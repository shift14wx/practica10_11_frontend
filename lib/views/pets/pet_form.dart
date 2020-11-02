import 'package:flutter/material.dart';
import 'package:practica10/models/freezed_classes.dart';
import 'package:practica10/services/petService.dart';

class PetForm extends StatefulWidget {
  final Pet pet;
  final List<Owner> owners;
  final List<Specie> species;
  Map<String,TextEditingController> formController;
  PetForm({Key key, this.pet,this.owners, this.species}) : super(key: key);

  Map<String, dynamic> _formControllerDropDown;

  @override
  _PetFormState createState() => _PetFormState();
}
enum dropdownType {SPECIE, OWNER}
class _PetFormState extends State<PetForm> {

  PetService _petService = PetService();
  bool isLoading = false;
  @override
  void initState() {

    widget._formControllerDropDown ={
      "codigo_cliente" : widget.pet.codigo_cliente,
      "codigo_especie"  : widget.pet.codigo_especie
    };
    
    widget.formController={
      "codigo_mascota" : TextEditingController(text: widget.pet.codigo_mascota.toString()),
      "nombre" : TextEditingController(text: widget.pet.nombre),
      "color" : TextEditingController(text: widget.pet.color),
      "comentarios" : TextEditingController(text: widget.pet.comentarios),
      "peso" : TextEditingController(text: widget.pet.peso.toString()),
      "fecha_nacimiento" : TextEditingController( text: widget.pet.fecha_nacimiento.toString() ),
      "sexo" : TextEditingController(text: widget.pet.sexo.toString())
    };

    super.initState();
  }

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            widget.pet.codigo_mascota > 0 ? TextFormField(
              decoration: InputDecoration(
                icon: Icon( Icons.featured_video )
              ),
             controller: widget.formController["codigo_mascota"],
              enabled: false,
            ) : SizedBox(),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Pet's name",
                icon: Icon(Icons.android),
              ),
              controller: widget.formController["nombre"],
              autovalidateMode: AutovalidateMode.always,
              validator: (value) => value.isEmpty ? "Error this field couldn't be empty" : null,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Pet's color",
                icon: Icon(Icons.color_lens_outlined),
              ),
              controller: widget.formController["color"],
              autovalidateMode: AutovalidateMode.always,
              validator: (value) => value.isEmpty ? "Error this field couldn't be empty" : null,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Pet's weight",
                icon: Icon( Icons.line_weight )
              ),
              controller: widget.formController["peso"],
              keyboardType: TextInputType.number ,
              autovalidateMode: AutovalidateMode.always,
              validator: (value) => value.isEmpty ? "This field could't be empty" : null,
            ),
            TextFormField(
              controller: widget.formController["fecha_nacimiento"],
              decoration: new InputDecoration(
                  hintText: "Pet's birthday ",
                  labelText: "Pet's birthday",
                icon: Icon( Icons.date_range )
              ),
              onTap: ()async {
                // this is needed, this prevent to show the keyboard
                FocusScope.of(context).requestFocus(new FocusNode());
                await _selectDate();
              },
              onSaved: (String val) {

              },
            ),
            DropdownButtonFormField(
              icon: Icon( Icons.android_rounded ),
              value: widget.formController["sexo"].value.text == "true" ? true : false,
              onChanged: (value) {
                widget.formController["sexo"].text = value ? "true" : "false";
              },
              // ignore: missing_return
              validator: (value){
                if( value == null ){
                  return "this field could not be empty";
                }
              },
              autovalidateMode: AutovalidateMode.always,
             items: [
               DropdownMenuItem(
                 value: true,
                 child: Text("Female"),
               ),
               DropdownMenuItem(
                 value: false,
                 child: Text("Male"),
               )
             ],
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Pet's comment",
                icon: Icon(Icons.comment),
              ),
              controller: widget.formController["comentarios"],
              autovalidateMode: AutovalidateMode.always,
              validator: (value) => value.isEmpty ? "Error this field couldn't be empty" : null,
            ),
            buildDropDown( dropdownType.SPECIE ),
            buildDropDown( dropdownType.OWNER ),
            SizedBox(
              height: 10,
            ),
            isLoading ? CircularProgressIndicator() :
            FlatButton.icon(
              icon: Icon( Icons.save, color: Colors.white ),
              color: Colors.green,
              onPressed: () async {
                  if( _formKey.currentState.validate() ){

                    Pet _pet = Pet(
                     int.parse( widget.formController["codigo_mascota"].value.text.toString() ),
                      widget.formController["nombre"].value.text.toString(),
                      DateTime.parse( widget.formController["fecha_nacimiento"].value.text ),
                      widget.formController["sexo"].value.text.toString() == "true" ? true : false,
                      double.parse( widget.formController["peso"].value.text.toString() ),
                      widget.formController["color"].value.text.toString(),
                      widget.formController["comentarios"].value.text.toString(),
                      widget._formControllerDropDown["codigo_cliente"],
                      widget._formControllerDropDown["codigo_especie"]
                    );
                    print(_pet.toJson().toString());
                   setState(() {
                     isLoading = true;
                   });
                   Pet resultPet;
                   if( widget.pet.codigo_mascota == 0 ) {
                     resultPet = await _petService.create(_pet);
                   }else{
                      bool result = await _petService.update( _pet );
                      resultPet = _pet;
                   }
                    setState(() {
                      isLoading = false;
                    });
                    Navigator.of(context).pop(resultPet);
                  }
              },
              label: Text("Save pet",style: TextStyle( color: Colors.white )),
            )

          ],
        ),
      ),
    );
  }

  Widget buildDropDown( dropdownType type ){
   switch( type ){
     case dropdownType.SPECIE:
       return DropdownButtonFormField(
         value: widget._formControllerDropDown["codigo_especie"] > 0 ? widget._formControllerDropDown["codigo_especie"] : null ,
         decoration: InputDecoration(
           labelText: "Pet's specimen"
         ),
         icon: Icon( Icons.android_outlined ),
           // this thing is needed for not gettting overflow
         isExpanded: true,
         onChanged: (value) {
          widget._formControllerDropDown["codigo_especie"] = value;
         },
           // ignore: missing_return
           validator: (value ) {
         if( value == null || ( value is int && value <= 0 )  ){
           return "this cannot be empty";
         }else{
         }
       },
         autovalidateMode: AutovalidateMode.always,
         items: widget.species.map((specie) {
           return DropdownMenuItem(
             value: specie.codigo_especie,
             child: Text(specie.especie),
           );
         }
         ).toList()
       );
       break;
     case dropdownType.OWNER:
       return DropdownButtonFormField(
           value: widget._formControllerDropDown["codigo_cliente"] > 0 ? widget._formControllerDropDown["codigo_cliente"] : null ,
           decoration: InputDecoration(
               labelText: "Pet's owner"
           ),
           icon: Icon( Icons.person ),
           onChanged: (value) {
            widget._formControllerDropDown["codigo_cliente"] = value;
           },
           // ignore: missing_return
           validator: (value ) {
              if( value == null || ( value is int && value <= 0 )  ){
                return "this cannot be empty";
              }else{
              }
           },
           // this thing is needed for not gettting overflow
           isExpanded: true,
           autovalidateMode: AutovalidateMode.always,
           items: widget.owners.map((owner) {
             return DropdownMenuItem(
               value: owner.codigo_cliente,
               child: Text(owner.nombre, overflow: TextOverflow.ellipsis,),
             );
           }
           ).toList()
       );
       break;
   }
  }

  Future _selectDate() async {
    DateTime picked = await showDatePicker(
        context: context,
        currentDate: DateTime.parse( widget.formController["fecha_nacimiento"].value.text.toString() ).toLocal(),
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2016),
        lastDate: new DateTime.now()
    );
    if(picked != null) setState(() {
      widget.formController["fecha_nacimiento"].text = picked.toString();
    });
  }

}