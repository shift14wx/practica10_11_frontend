import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:practica10/models/freezed_classes.dart';
import 'package:practica10/services/ownerService.dart';


class OwnerForm extends StatefulWidget {

  final Owner _owner;
  final OwnerService _ownerService = OwnerService();

  bool isLoading = false;
  OwnerForm(this._owner,{Key key}) : super(key: key);

  @override
  _OwnerFormState createState() => _OwnerFormState();
}

class _OwnerFormState extends State<OwnerForm> {

  Map<String,TextEditingController> formController= null;

@override
  void initState() {
    formController={
      "codigo_cliente" : TextEditingController( text: widget._owner.codigo_cliente.toString() ),
      "nombre" : TextEditingController( text: widget._owner.nombre ),
      "correo" : TextEditingController( text: widget._owner.correo ),
      "telefono" : TextEditingController( text: widget._owner.telefono )
    };
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
           widget._owner.codigo_cliente > 0 ? TextFormField(
             decoration: InputDecoration(
               labelText: "Owner code"
             ),
             controller: formController["codigo_cliente"],
             enabled: false,
            ) :SizedBox(),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Name",
                prefixIcon: Icon(Icons.person)
              ),controller: formController["nombre"],
              autovalidateMode: AutovalidateMode.always,
              validator: (value) => value.isEmpty ? "this field couldn't be empty" : null,
            ),
            TextFormField(
               decoration: InputDecoration(
                 labelText: "Email",
                 prefixIcon: Icon( Icons.email )
               ),
                controller: formController["correo"],
                keyboardType: TextInputType.emailAddress,
                autovalidateMode: AutovalidateMode.always,
                validator: this.validateEmail
              ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Phone Number",
                prefixIcon: Icon( Icons.phone )
              ),
              controller: formController["telefono"],
              autovalidateMode: AutovalidateMode.always,
              validator: (value) => value.isEmpty ? "this field couldn't be empty" : null,
            ),
            SizedBox(
              height: 10,
            ),
            widget.isLoading ?
                Center(
                  child: CircularProgressIndicator(),
                ) :
            FlatButton.icon(
              icon: Icon(Icons.save, color: Colors.white,),
              color: Colors.green,
              label: Text("Save",style: TextStyle(color: Colors.white),),
              onPressed: () async {
               if( _formKey.currentState.validate() ){
                  Owner owner = Owner(
                    formController["nombre"].value.text,
                    widget._owner.codigo_cliente > 0 ? widget._owner.codigo_cliente : 0,
                    formController["correo"].value.text,
                    formController["telefono"].value.text
                  );

                  setState(() {
                    widget.isLoading = true;
                  });
                  if ( widget._owner.codigo_cliente > 0 ) {

                    var result =await widget._ownerService.update(owner);
                    Navigator.of(context).pop(owner);
                  } else {
                    var result = await widget._ownerService.create(owner);

                    if(result != null) {
                      Navigator.of(context).pop(result as Owner);
                    }
                  }
                  setState(() {
                    widget.isLoading = false;
                  });
                  }
              },
            )
          ],
        ),
      ),
    );
  
  }



  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }
  @override
  void dispose() {
    Navigator.pop(context,null);
    super.dispose();
  }


}