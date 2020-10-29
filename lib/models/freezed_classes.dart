import 'package:freezed_annotation/freezed_annotation.dart';

part 'freezed_classes.freezed.dart';
part 'freezed_classes.g.dart';

@freezed
abstract class Owner with _$Owner {
  const factory Owner(String nombre, int codigo_cliente, String correo, String telefono ) = _Owner;
  factory Owner.fromJson(Map<String, dynamic> json) => _$OwnerFromJson(json);
}

@freezed
abstract class Pet with _$Pet{
  const factory Pet( int codigo_mascota, String nombre, DateTime fecha_nacimiento, bool sexo, double peso,String color, String comentarios, int codigo_cliente, int codigo_especie) = _Pet;
  factory Pet.fromJson(Map<String,dynamic> json) => _$PetFromJson();
}