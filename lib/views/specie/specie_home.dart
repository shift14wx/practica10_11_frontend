import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:practica10/stores/SpeciesStore.dart';
import 'package:practica10/views/specie/specie_form.dart';
import 'package:provider/provider.dart';

class SpecieHome extends StatefulWidget {
  SpecieHome({Key key}) : super(key: key);

  @override
  _SpecieHomeState createState() => _SpecieHomeState();
}

class _SpecieHomeState extends State<SpecieHome> {

  SpeciesStore _speciestore;
  @override
  void didChangeDependencies() {
    _speciestore ??= Provider.of<SpeciesStore>(context);
    if(_speciestore.listSpecies == null){
        _speciestore.getSpecies();
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: Text("Specie's Home"),
        ),
        body: IsLoading(context),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          child: Icon( Icons.add ),
          onPressed: () async{
            var isDone = await showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("Specie Data"),
                  content: SpecieForm(),
                );
              },
            );
            if(isDone){
              _speciestore.getSpecies();
            }
          },
        ),
      ),
    );
  }

  Widget IsLoading( BuildContext context ){

    if( _speciestore.isLoading ){
        return Center(
          child: CircularProgressIndicator(),
        );
    }else{
        return buildList(context);
    }

  }

  Widget buildList(BuildContext context){

    return CustomScrollView(
      slivers: [
        SliverList(

          delegate: SliverChildListDelegate(
            SpeciesList()
          ),
        )
      ],
    );

  }

  List<ListTile> SpeciesList(){

    return _speciestore.listSpecies.map((e) => ListTile(
      title: Text(e.especie),
      subtitle: Text(e.codigo_especie.toString()),
    )).toList();

  }
}