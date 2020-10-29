import 'package:flutter/material.dart';
import 'package:practica10/stores/OwnersStore.dart';
import 'package:practica10/views/Owners/owners_home.dart';
import 'package:provider/provider.dart';

class OwnersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
        create: (context) => OwnerStore(),
        child: OwnersHome(),
    );
  }
}
