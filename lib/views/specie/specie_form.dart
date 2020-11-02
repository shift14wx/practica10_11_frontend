import 'package:flutter/material.dart';
import 'package:practica10/models/freezed_classes.dart';
import 'package:practica10/services/SpeciesService.dart';

class SpecieForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SpeciesService service = SpeciesService();
    GlobalKey<FormState> _formKey = GlobalKey<FormState>();
   TextEditingController specieControllerName = TextEditingController();
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child:Column(
          children: [
            TextFormField(
              controller: specieControllerName,
              autovalidateMode: AutovalidateMode.always,
              decoration: InputDecoration(
                labelText: "Name",
                icon: Icon( Icons.android ),
              ),

            ),
            SizedBox(
              height: 10,
            ),
            FlatButton.icon(
              color: Colors.green,
              icon: Icon( Icons.save, color: Colors.white ),
              label: Text( "Save", style: TextStyle(color: Colors.white) ),
              onPressed: () async {
                if(_formKey.currentState.validate()){
                 dynamic result = await service.create( Specie( 0,specieControllerName.value.text ) );
                 print(result);
                 Navigator.of(context).pop(true);
                }
              },
            )
          ],
        )
      ),
    );
  }
}
