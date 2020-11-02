import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:practica10/models/freezed_classes.dart';
import 'package:practica10/services/petService.dart';
import 'package:practica10/stores/OwnersStore.dart';
import 'package:practica10/stores/PetStore.dart';
import 'package:practica10/stores/SpeciesStore.dart';
import 'package:practica10/views/pets/pet_form.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher_platform_interface/url_launcher_platform_interface.dart';

class PetHome extends StatefulWidget {
  PetHome({Key key}) : super(key: key);
  @override
  _PetHomeState createState() => _PetHomeState();
}
enum todo { DELETE, UPDATE }
class _PetHomeState extends State<PetHome> {

  Future<void> _launched;

  PetStore _petStore;
  OwnerStore _ownerStore;
  SpeciesStore _speciesStore;
  PetService _petService = PetService();

  Future<void> _launchInBrowser(String url) async {
    if (await UrlLauncherPlatform.instance.canLaunch(url)) {
      await UrlLauncherPlatform.instance.launch(
        url,
        useSafariVC: false,
        useWebView: false,
        enableJavaScript: false,
        enableDomStorage: false,
        universalLinksOnly: false,
        headers: <String, String>{},
      );
    } else {
      throw 'Could not launch $url';
    }
  }
  Widget _launchStatus(BuildContext context, AsyncSnapshot<void> snapshot) {
    if (snapshot.hasError) {
      return Text('Error: ${snapshot.error}');
    } else {
      return const Text('');
    }
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _petStore ??= Provider.of<PetStore>(context);
    _ownerStore ??= Provider.of<OwnerStore>(context);
    _speciesStore ??= Provider.of<SpeciesStore>(context);
    if(_petStore.listPet == null){
      _petStore.getPets();
    }
    if(_speciesStore.listSpecies == null){
      _speciesStore.getSpecies();
    }
    if( _ownerStore.realOwners.length == 0 ){
      _ownerStore.getOwners();
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("pet's Home"),
        actions:[
          FlatButton.icon(
            icon: Icon( Icons.insert_drive_file , color: Colors.white,),
            label: Text( "report" ),
            onPressed: () async {
              setState(() {
                _launched = _launchInBrowser("http://localhost:8090/v1/mascotas/report");
              });
            }
          ),
          FutureBuilder<void>(future: _launched, builder: _launchStatus)
        ]
      ),
      body: Observer(
        builder: (context) => isLoading(context),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: Icon(Icons.add),
        onPressed: () async {
          Pet pet = await showForm(context);
          if( pet != null ){
            setState(() {
              _petStore.listPet.add( pet );
            });
          }
        },
      ),
    );
  }

  Widget isLoading(BuildContext context) {

    if( _petStore.isLoading || _ownerStore.isLoading ){
      return Center(
        child: CircularProgressIndicator(),
      );
    }else{
      return CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              buildListOfPets(context)
            ),
          )
        ],
      );
    }

  }

  List<Widget> buildListOfPets(BuildContext context){

    return List.generate( _petStore.listPet.length, (int index){
      return ListTile(
        title: Text("Pet's name: "+_petStore.listPet[index].nombre),
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Code: "+_petStore.listPet[index].codigo_mascota.toString()),
            SizedBox(height: 10,),
            Text("owner: "+_ownerStore.realOwners.where((owner) => owner.codigo_cliente == _petStore.listPet[index].codigo_cliente ).map((o) => o ).first.nombre),
            SizedBox(height: 10,),
            Text("Birthdate: "+ _petStore.listPet[index].fecha_nacimiento.toLocal().toString() ),
            SizedBox(height: 10,),
            Text(" Gender:  "+  ( _petStore.listPet[index].sexo ? 'Female' : 'Male' ) ),
            SizedBox(height: 10,),
            Text(" Color: "+ _petStore.listPet[index].color),
            SizedBox(height: 10,),
            Text(" Comment: "+ _petStore.listPet[index].comentarios)
          ],
        ),
        trailing: buildSubMenu(_petStore.listPet[index], context),
      );
    });

  }

  Widget buildSubMenu( Pet pet, BuildContext context ){

    return PopupMenuButton<Map<String,dynamic>>(
      onSelected: (value) {
        performAction( value["todo"], pet, context );
      },
      itemBuilder: (context) =>  [
        PopupMenuItem(
          value: {
            "todo":todo.UPDATE
          },
          child: Row(
            children: [
              Text("Update"),
              Icon( Icons.edit, color: Colors.green, )
            ],
          ),
        ),
        PopupMenuItem(
          value: {
            "todo": todo.DELETE
          },
          child: Row(
            children: [
              Text("Delete"),
              Icon( Icons.delete, color: Colors.redAccent, )
            ],
          ),
        )
      ],
    );

  }

  Future showForm( BuildContext context, {Pet pet} ) async {
    Pet _pet;
    if( pet is Pet ){
      _pet = pet;
    }else{
      _pet = Pet(0,"",DateTime.now(),true,0.0,"","",0,0);
    }
    return await showDialog<Pet>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Pet's info"),
          content: PetForm(pet: _pet,owners: _ownerStore.realOwners, species: _speciesStore.listSpecies ),
        );
      },
    );
  }

// this is only for update or delete a pet
  Future performAction( todo todoWith, Pet pet, BuildContext context ) async {

    switch(todoWith){
      case todo.UPDATE:
        Pet resultPet = await this.showForm(context,pet:pet);
        if( resultPet != null ){
          int index = _petStore.listPet.indexWhere((element) => element.codigo_mascota == resultPet.codigo_mascota);
          setState(() {
            _petStore.listPet[index] = resultPet;
          });
          showSnackBar( color:Colors.green, title: Text("The pet was successful updated!",style:TextStyle(color: Colors.white)), context: context );
        }
        break;
      case todo.DELETE:
        bool resultBool = await showDialog(
          context: context,
         builder: (context) {
           return AlertDialog(
               title: Text("Are you shure you want to delete it?"),
               content: Row(
                 children: [
                   FlatButton.icon(
                     icon: Icon(Icons.done, color: Colors.green,),
                      label: Text("Sure", style: TextStyle( color: Colors.green )),
                     onPressed: () {
                       Navigator.of(context).pop(true);
                     },
                   ),
                   FlatButton.icon(
                     icon: Icon(Icons.cancel, color: Colors.blue ),
                     label: Text("Cancel", style: TextStyle( color: Colors.blue )),
                     onPressed: () {
                       Navigator.of(context).pop(false);
                     },
                   )
                 ],
               ),
             );
         },
          barrierDismissible: false
        );

        if( resultBool ){
          bool result = await _petStore.delete( pet.codigo_mascota );
          if(result){
            setState(() {
              _petStore.listPet.removeAt( _petStore.listPet.indexWhere((element) => element.codigo_mascota == pet.codigo_mascota) );
            });
            showSnackBar(color: Colors.green, title: Text("the pet was deleted!",style: TextStyle(color: Colors.white)), context: context);
          }
        }else{
          showSnackBar(color: Colors.yellow , title: Text("the pet couldn't be remove",style: TextStyle(color: Colors.white)), context: context);
        }

        break;
    }
  }

  void showSnackBar( {Color color, Text title, BuildContext context} ){
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: title,
        backgroundColor: color,
        duration: Duration(seconds: 2),
      )
    );
  }



}