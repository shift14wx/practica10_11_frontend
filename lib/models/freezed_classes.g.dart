// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'freezed_classes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Owner _$_$_OwnerFromJson(Map<String, dynamic> json) {
  return _$_Owner(
    json['nombre'] as String,
    json['codigo_cliente'] as int,
    json['correo'] as String,
    json['telefono'] as String,
  );
}

Map<String, dynamic> _$_$_OwnerToJson(_$_Owner instance) => <String, dynamic>{
      'nombre': instance.nombre,
      'codigo_cliente': instance.codigo_cliente,
      'correo': instance.correo,
      'telefono': instance.telefono,
    };

_$_Pet _$_$_PetFromJson(Map<String, dynamic> json) {
  return _$_Pet(
    json['codigo_mascota'] as int,
    json['nombre'] as String,
    json['fecha_nacimiento'] == null
        ? null
        : DateTime.parse(json['fecha_nacimiento'] as String),
    json['sexo'] as bool,
    (json['peso'] as num)?.toDouble(),
    json['color'] as String,
    json['comentarios'] as String,
    json['codigo_cliente'] as int,
    json['codigo_especie'] as int,
  );
}

Map<String, dynamic> _$_$_PetToJson(_$_Pet instance) => <String, dynamic>{
      'codigo_mascota': instance.codigo_mascota,
      'nombre': instance.nombre,
      'fecha_nacimiento': instance.fecha_nacimiento?.toIso8601String(),
      'sexo': instance.sexo,
      'peso': instance.peso,
      'color': instance.color,
      'comentarios': instance.comentarios,
      'codigo_cliente': instance.codigo_cliente,
      'codigo_especie': instance.codigo_especie,
    };

_$_Specie _$_$_SpecieFromJson(Map<String, dynamic> json) {
  return _$_Specie(
    json['codigo_especie'] as int,
    json['especie'] as String,
  );
}

Map<String, dynamic> _$_$_SpecieToJson(_$_Specie instance) => <String, dynamic>{
      'codigo_especie': instance.codigo_especie,
      'especie': instance.especie,
    };
