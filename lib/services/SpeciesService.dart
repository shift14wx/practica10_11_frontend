import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:practica10/models/freezed_classes.dart';

class SpeciesService{
  Future<List<Specie>> getSpecies() async {
    http.Response response = await http.get("http://localhost:8090/v1/especie/");
    List<dynamic> encodedList = jsonDecode( response.body );
    return encodedList.map((encoded) => Specie.fromJson( encoded ) ).toList();
  }
  Future<dynamic> create(Specie specie) async {
    Map<String,dynamic> especie = specie.toJson();
    especie.remove("codigo_especie");
    print(especie);
    http.Response response = await http.post("http://localhost:8090/v1/especie/",headers: {'Content-Type': 'application/json; charset=UTF-8',},body:  jsonEncode(especie) );
    return jsonDecode( response.body );
  }

  Future<bool> update(Specie specie ) async {
    http.Response response = await http.put("http://localhost:8090/v1/especie/",body:  jsonEncode( specie.toJson() ) );
    return jsonDecode( response.body ) as bool;
  }

  Future<bool> delete( int id ) async {
    http.Response response = await http.delete("http://localhost:8090/v1/especie/"+id.toString() );
    return jsonDecode( response.body ) as bool;
  }
}