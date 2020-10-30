import 'dart:convert';

import 'package:practica10/models/freezed_classes.dart';
import 'package:http/http.dart' as http;
class PetService {

  Future<List<Pet>> getPets() async {
    http.Response response = await http.get("http://localhost:8090/v1/mascotas/");
    return jsonDecode( response.body ) as List<Pet>;
  }
  Future<Pet> create(Pet pet) async {
    http.Response response = await http.put("http://localhost:8090/v1/mascotas/",body: jsonEncode( pet.toJson() ));
    return jsonDecode( response.body ) as Pet;
  }

  Future<bool> update( Pet pet ) async {
    http.Response response = await http.put("http://localhost:8090/v1/mascotas/",body:  jsonEncode( pet.toJson() ) );
    return jsonDecode( response.body ) as bool;
  }

  Future<bool> delete( int id ) async {
    http.Response response = await http.delete("http://localhost:8090/v1/mascotas/"+id.toString() );
    return jsonDecode( response.body ) as bool;
  }

}