import 'dart:convert';

import 'package:practica10/models/freezed_classes.dart';
import 'package:http/http.dart' as http;

class OwnerService{


  Future<Owner> create( Owner owner ) async {
   Map<String,dynamic> OwnerJson = owner.toJson();
    OwnerJson.remove("codigo_cliente");

    print( OwnerJson.toString() );
    http.Response response= await http.post("http://localhost:8090/v1/clientes/",headers: {'Content-Type': 'application/json; charset=UTF-8',},body: jsonEncode(OwnerJson) );
    return Owner.fromJson( jsonDecode(response.body) );
  }

  Future<bool> update( Owner owner ) async {
      Map<String,dynamic> OwnerJson = owner.toJson();

      print( OwnerJson.toString() );
      http.Response response= await http.put("http://localhost:8090/v1/clientes/",headers: {'Content-Type': 'application/json; charset=UTF-8',},body: jsonEncode(OwnerJson) );
      print( response.body );
      return  jsonDecode( response.body ) as bool;
  }
  
  Future<List<Owner>> getOwners() async {
    http.Response response= await http.get("http://localhost:8090/v1/clientes/");
    return parseOwners(response);
  }

  List<Owner> parseOwners(http.Response response) {
    List<Owner> realOwners=[];
    if(response.statusCode == 200){
      List owners = jsonDecode( response.body );
      owners.forEach((json) => realOwners.add(Owner.fromJson(json)) );
      return realOwners;
    }else{
      Exception('failed to get owners');
    }
  }

  Future<bool> deleteOwner( int id ) async {
    http.Response response = await http.delete("http://localhost:8090/v1/clientes/"+id.toString());
    return jsonDecode( response.body ) as bool;
  }

}