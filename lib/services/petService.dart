import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart';
import 'package:practica10/models/freezed_classes.dart';
import 'package:http/http.dart' as http;
class PetService {

  Future<List<Pet>> getPets() async {
    http.Response response = await http.get("http://localhost:8090/v1/mascotas/all");
    List<dynamic> encodedList = jsonDecode( response.body );
    return encodedList.map((encoded) => Pet.fromJson( encoded ) ).toList();
  }
  Future<Pet> create(Pet pet) async {
    Map<String,dynamic> petMap = pet.toJson();
    petMap.remove("codigo_mascota");

    http.Response response = await http.post("http://localhost:8090/v1/mascotas/",headers: {'Content-Type': 'application/json; charset=UTF-8',},body: jsonEncode(petMap) );
    Map json = jsonDecode( response.body ) ;
    print(json);
    return Pet.fromJson(json);
  }

  Future<bool> update( Pet pet ) async {
    print( pet.toJson() );
    http.Response response = await http.put("http://localhost:8090/v1/mascotas/",headers: {'Content-Type': 'application/json; charset=UTF-8',},body: jsonEncode(pet.toJson())  );
    return jsonDecode( response.body ) as bool;
  }

  Future<bool> delete( int id ) async {
    http.Response response = await http.delete("http://localhost:8090/v1/mascotas/"+id.toString() ,headers: {'Content-Type': 'application/json; charset=UTF-8',});
    print( response.body );
    return response.body == "true" ? true : false;
  }


}