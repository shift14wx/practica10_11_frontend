import 'package:flutter/material.dart';
import 'package:practica10/views/Home.dart';
import 'package:practica10/views/Owners/owners_home.dart';
import 'package:practica10/views/Owners/owners_page.dart';

void main(){
  runApp(
    MaterialApp(
      routes: {
        "/": (_) => Home(),
          "/owners" : (_) => OwnersPage()
      },
    )
      );
    }