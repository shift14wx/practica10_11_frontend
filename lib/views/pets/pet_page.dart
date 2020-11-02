import 'package:flutter/material.dart';
import 'package:practica10/stores/OwnersStore.dart';
import 'package:practica10/stores/PetStore.dart';
import 'package:practica10/stores/SpeciesStore.dart';
import 'package:practica10/views/pets/pet_home.dart';
import 'package:provider/provider.dart';

class PetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<PetStore>(create: (_)=>PetStore()),
        Provider<OwnerStore>(create: (_)=>OwnerStore()),
        Provider<SpeciesStore>(create:(_)=>SpeciesStore())
      ],
      builder: (context, child) {
        return PetHome();
      },
    );
  }
}
