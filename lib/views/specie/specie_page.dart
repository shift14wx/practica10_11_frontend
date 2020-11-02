import 'package:flutter/material.dart';
import 'package:practica10/stores/SpeciesStore.dart';
import 'package:practica10/views/specie/specie_home.dart';
import 'package:provider/provider.dart';

class SpeciePage extends StatefulWidget {
  SpeciePage({Key key}) : super(key: key);

  @override
  _SpeciePageState createState() => _SpeciePageState();
}

class _SpeciePageState extends State<SpeciePage> {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create:(_) => SpeciesStore(),
      builder: (context, child) {
        return SpecieHome();
      },
    );
  }
}