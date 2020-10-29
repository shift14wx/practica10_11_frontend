import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:practica10/models/freezed_classes.dart';
import 'package:practica10/services/ownerService.dart';
import 'package:practica10/stores/OwnersStore.dart';
import 'package:practica10/views/Owners/owner_form.dart';
import 'package:provider/provider.dart';

class OwnersHome extends StatefulWidget {
  OwnersHome({Key key}) : super(key: key);

  final OwnerService service = OwnerService();

  @override
  _OwnersHomeState createState() => _OwnersHomeState();
}
enum todo {DELETE, UPDATE}
class _OwnersHomeState extends State<OwnersHome> {
  OwnerStore _os;
  List<Map<String,dynamic>> todoListPopupMenuItemsMenu =[
    {
      "title":"update",
      "todo" : todo.UPDATE,
      "icon" : Icon(Icons.edit, color: Colors.green)
    },
    {
      "title":"delete",
      "todo" : todo.DELETE,
      "icon" : Icon(Icons.delete, color: Colors.red)
    }
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _os ??= Provider.of<OwnerStore>(context);
    if(_os.realOwners.length == 0 ){
     _os.getOwners();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("owners Home"),
      ),
      body: Observer(
        builder: (_){
          return isLoading();
        },
      ),
      floatingActionButton: Builder(
        builder:(context) =>  FloatingActionButton(
          onPressed: () async {
            var result = await this.showForm(context);
            if(result != null){
              Scaffold.of(context).showSnackBar( SnackBar(
                content: Text("Done!, new owner was inserted",style: TextStyle(color:Colors.white),),
                backgroundColor: Colors.green,
              ));
              addNewOwner(result as Owner);
            }
          },
          child: Icon(Icons.person_add_alt_1),
          backgroundColor: Colors.green,
        ),
      ),
    );
  }

  Widget isLoading(){
    if( _os.isLoading ){
        return Center(child: CircularProgressIndicator());
    }else{
      return buildList();
    }
  }

  Widget buildList(){
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate(
           _os.realOwners.map((owner) => ListTile(
             title: Text("Codigo cliente: "+owner.codigo_cliente.toString()),
             subtitle: Text("Nombre: "+owner.nombre),
             trailing: buildSubMenu(owner),
           )).toList()
          ),
        )
      ],
    );
  }

  Widget buildSubMenu(Owner owner,){
    return Builder(
      builder: (context) =>  PopupMenuButton(
        onSelected: (value) async {
          var result = await this.showForm(context,owner: owner,ownerValues: value);

          if(result != null){
            if (result is Owner) {
              int index = _os.realOwners.indexWhere((element) => element.codigo_cliente == result.codigo_cliente);
              print("index update: "+index.toString());
              setState(() {
                _os.realOwners[index] = result;
              });

            }
            String _msg = "the owner with id "+owner.codigo_cliente.toString()+" was successful updated!";
            Color _color = Colors.blue;
            if( value["todo"] == todo.DELETE && result ){
              setState(() {
                _os.realOwners.remove(owner);
              });
              _msg = "the owner with id "+owner.codigo_cliente.toString()+" was successful removed!";
              _color = Colors.red;
            }else if( value["todo"] == todo.DELETE && !result ){
              _msg = "cant delete the owner cancelled by the user nor this client has pets";
              _color = Colors.yellow;
            }
            Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text(_msg),
                  backgroundColor: _color,
                )
            );
          }
        },
        itemBuilder: (_) => todoListPopupMenuItemsMenu.map((item)=>PopupMenuItem(
        value: {
          "owner" : owner,
          "todo" : item["todo"]
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            item["icon"],
            Text(item["title"]),
          ],
        ),
      )).toList(),
      ),
    );
  }

  Future showForm(BuildContext context, {Owner owner, ownerValues: Map }) async {
    Owner _owner;
    if ( owner is Owner ) {
      _owner = owner;
    }else{
      _owner = Owner("",0,"","");
    }

    if( ownerValues is Map && ownerValues["todo"] == todo.DELETE ){
      print("showing deleting");
      bool decision = await showDialog<bool>(
        context: context,
        builder: (context){
          return AlertDialog(
            actions: [
              FlatButton.icon(
                icon: Icon(Icons.delete,color: Colors.red),
                label: Text("Delete",style: TextStyle(color:Colors.red),),
                onPressed: () => Navigator.pop(context,true),
              ),
              FlatButton.icon(
                icon: Icon(Icons.cancel,color: Colors.blueAccent),
                label: Text("Cancel",style: TextStyle(color:Colors.blueAccent),),
                onPressed: () => Navigator.pop(context, false),
              )
            ],
          );
        },
        barrierDismissible: false
      );
      print("the decision was: "+decision.toString());
      return decision ? await widget.service.deleteOwner( _owner.codigo_cliente ) : false;
    }else {
      return await showDialog(
          context: context,
          builder: (_) {
            return AlertDialog(
              title: Text("owner info"),
              content: OwnerForm(_owner),
            );
          }
      );
    }
  }

  addNewOwner(Owner owner){
    _os.realOwners.add(owner);
    setState(() {

    });
  }

}