import 'package:flutter/material.dart';
import 'package:practica10/views/Home.dart';
import 'package:practica10/views/Owners/owners_home.dart';
import 'package:practica10/views/Owners/owners_page.dart';
import 'package:practica10/views/pets/pet_page.dart';
import 'package:practica10/views/specie/specie_page.dart';

void main(){
  runApp(
    MaterialApp(
      routes: {
        "/": (_) => Home(),
        "/owners" : (_) => OwnersPage(),
        "/pets" : (_) => PetPage(),
        "/species" : (_) => SpeciePage()
      },
    )
      );
    }