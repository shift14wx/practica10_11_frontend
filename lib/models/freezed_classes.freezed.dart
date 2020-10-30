// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'freezed_classes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Owner _$OwnerFromJson(Map<String, dynamic> json) {
  return _Owner.fromJson(json);
}

/// @nodoc
class _$OwnerTearOff {
  const _$OwnerTearOff();

// ignore: unused_element
  _Owner call(
      String nombre, int codigo_cliente, String correo, String telefono) {
    return _Owner(
      nombre,
      codigo_cliente,
      correo,
      telefono,
    );
  }

// ignore: unused_element
  Owner fromJson(Map<String, Object> json) {
    return Owner.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $Owner = _$OwnerTearOff();

/// @nodoc
mixin _$Owner {
  String get nombre;
  int get codigo_cliente;
  String get correo;
  String get telefono;

  Map<String, dynamic> toJson();
  $OwnerCopyWith<Owner> get copyWith;
}

/// @nodoc
abstract class $OwnerCopyWith<$Res> {
  factory $OwnerCopyWith(Owner value, $Res Function(Owner) then) =
      _$OwnerCopyWithImpl<$Res>;
  $Res call(
      {String nombre, int codigo_cliente, String correo, String telefono});
}

/// @nodoc
class _$OwnerCopyWithImpl<$Res> implements $OwnerCopyWith<$Res> {
  _$OwnerCopyWithImpl(this._value, this._then);

  final Owner _value;
  // ignore: unused_field
  final $Res Function(Owner) _then;

  @override
  $Res call({
    Object nombre = freezed,
    Object codigo_cliente = freezed,
    Object correo = freezed,
    Object telefono = freezed,
  }) {
    return _then(_value.copyWith(
      nombre: nombre == freezed ? _value.nombre : nombre as String,
      codigo_cliente: codigo_cliente == freezed
          ? _value.codigo_cliente
          : codigo_cliente as int,
      correo: correo == freezed ? _value.correo : correo as String,
      telefono: telefono == freezed ? _value.telefono : telefono as String,
    ));
  }
}

/// @nodoc
abstract class _$OwnerCopyWith<$Res> implements $OwnerCopyWith<$Res> {
  factory _$OwnerCopyWith(_Owner value, $Res Function(_Owner) then) =
      __$OwnerCopyWithImpl<$Res>;
  @override
  $Res call(
      {String nombre, int codigo_cliente, String correo, String telefono});
}

/// @nodoc
class __$OwnerCopyWithImpl<$Res> extends _$OwnerCopyWithImpl<$Res>
    implements _$OwnerCopyWith<$Res> {
  __$OwnerCopyWithImpl(_Owner _value, $Res Function(_Owner) _then)
      : super(_value, (v) => _then(v as _Owner));

  @override
  _Owner get _value => super._value as _Owner;

  @override
  $Res call({
    Object nombre = freezed,
    Object codigo_cliente = freezed,
    Object correo = freezed,
    Object telefono = freezed,
  }) {
    return _then(_Owner(
      nombre == freezed ? _value.nombre : nombre as String,
      codigo_cliente == freezed ? _value.codigo_cliente : codigo_cliente as int,
      correo == freezed ? _value.correo : correo as String,
      telefono == freezed ? _value.telefono : telefono as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Owner implements _Owner {
  const _$_Owner(this.nombre, this.codigo_cliente, this.correo, this.telefono)
      : assert(nombre != null),
        assert(codigo_cliente != null),
        assert(correo != null),
        assert(telefono != null);

  factory _$_Owner.fromJson(Map<String, dynamic> json) =>
      _$_$_OwnerFromJson(json);

  @override
  final String nombre;
  @override
  final int codigo_cliente;
  @override
  final String correo;
  @override
  final String telefono;

  @override
  String toString() {
    return 'Owner(nombre: $nombre, codigo_cliente: $codigo_cliente, correo: $correo, telefono: $telefono)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Owner &&
            (identical(other.nombre, nombre) ||
                const DeepCollectionEquality().equals(other.nombre, nombre)) &&
            (identical(other.codigo_cliente, codigo_cliente) ||
                const DeepCollectionEquality()
                    .equals(other.codigo_cliente, codigo_cliente)) &&
            (identical(other.correo, correo) ||
                const DeepCollectionEquality().equals(other.correo, correo)) &&
            (identical(other.telefono, telefono) ||
                const DeepCollectionEquality()
                    .equals(other.telefono, telefono)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(nombre) ^
      const DeepCollectionEquality().hash(codigo_cliente) ^
      const DeepCollectionEquality().hash(correo) ^
      const DeepCollectionEquality().hash(telefono);

  @override
  _$OwnerCopyWith<_Owner> get copyWith =>
      __$OwnerCopyWithImpl<_Owner>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_OwnerToJson(this);
  }
}

abstract class _Owner implements Owner {
  const factory _Owner(
          String nombre, int codigo_cliente, String correo, String telefono) =
      _$_Owner;

  factory _Owner.fromJson(Map<String, dynamic> json) = _$_Owner.fromJson;

  @override
  String get nombre;
  @override
  int get codigo_cliente;
  @override
  String get correo;
  @override
  String get telefono;
  @override
  _$OwnerCopyWith<_Owner> get copyWith;
}

Pet _$PetFromJson(Map<String, dynamic> json) {
  return _Pet.fromJson(json);
}

/// @nodoc
class _$PetTearOff {
  const _$PetTearOff();

// ignore: unused_element
  _Pet call(
      int codigo_mascota,
      String nombre,
      DateTime fecha_nacimiento,
      bool sexo,
      double peso,
      String color,
      String comentarios,
      int codigo_cliente,
      int codigo_especie) {
    return _Pet(
      codigo_mascota,
      nombre,
      fecha_nacimiento,
      sexo,
      peso,
      color,
      comentarios,
      codigo_cliente,
      codigo_especie,
    );
  }

// ignore: unused_element
  Pet fromJson(Map<String, Object> json) {
    return Pet.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $Pet = _$PetTearOff();

/// @nodoc
mixin _$Pet {
  int get codigo_mascota;
  String get nombre;
  DateTime get fecha_nacimiento;
  bool get sexo;
  double get peso;
  String get color;
  String get comentarios;
  int get codigo_cliente;
  int get codigo_especie;

  Map<String, dynamic> toJson();
  $PetCopyWith<Pet> get copyWith;
}

/// @nodoc
abstract class $PetCopyWith<$Res> {
  factory $PetCopyWith(Pet value, $Res Function(Pet) then) =
      _$PetCopyWithImpl<$Res>;
  $Res call(
      {int codigo_mascota,
      String nombre,
      DateTime fecha_nacimiento,
      bool sexo,
      double peso,
      String color,
      String comentarios,
      int codigo_cliente,
      int codigo_especie});
}

/// @nodoc
class _$PetCopyWithImpl<$Res> implements $PetCopyWith<$Res> {
  _$PetCopyWithImpl(this._value, this._then);

  final Pet _value;
  // ignore: unused_field
  final $Res Function(Pet) _then;

  @override
  $Res call({
    Object codigo_mascota = freezed,
    Object nombre = freezed,
    Object fecha_nacimiento = freezed,
    Object sexo = freezed,
    Object peso = freezed,
    Object color = freezed,
    Object comentarios = freezed,
    Object codigo_cliente = freezed,
    Object codigo_especie = freezed,
  }) {
    return _then(_value.copyWith(
      codigo_mascota: codigo_mascota == freezed
          ? _value.codigo_mascota
          : codigo_mascota as int,
      nombre: nombre == freezed ? _value.nombre : nombre as String,
      fecha_nacimiento: fecha_nacimiento == freezed
          ? _value.fecha_nacimiento
          : fecha_nacimiento as DateTime,
      sexo: sexo == freezed ? _value.sexo : sexo as bool,
      peso: peso == freezed ? _value.peso : peso as double,
      color: color == freezed ? _value.color : color as String,
      comentarios:
          comentarios == freezed ? _value.comentarios : comentarios as String,
      codigo_cliente: codigo_cliente == freezed
          ? _value.codigo_cliente
          : codigo_cliente as int,
      codigo_especie: codigo_especie == freezed
          ? _value.codigo_especie
          : codigo_especie as int,
    ));
  }
}

/// @nodoc
abstract class _$PetCopyWith<$Res> implements $PetCopyWith<$Res> {
  factory _$PetCopyWith(_Pet value, $Res Function(_Pet) then) =
      __$PetCopyWithImpl<$Res>;
  @override
  $Res call(
      {int codigo_mascota,
      String nombre,
      DateTime fecha_nacimiento,
      bool sexo,
      double peso,
      String color,
      String comentarios,
      int codigo_cliente,
      int codigo_especie});
}

/// @nodoc
class __$PetCopyWithImpl<$Res> extends _$PetCopyWithImpl<$Res>
    implements _$PetCopyWith<$Res> {
  __$PetCopyWithImpl(_Pet _value, $Res Function(_Pet) _then)
      : super(_value, (v) => _then(v as _Pet));

  @override
  _Pet get _value => super._value as _Pet;

  @override
  $Res call({
    Object codigo_mascota = freezed,
    Object nombre = freezed,
    Object fecha_nacimiento = freezed,
    Object sexo = freezed,
    Object peso = freezed,
    Object color = freezed,
    Object comentarios = freezed,
    Object codigo_cliente = freezed,
    Object codigo_especie = freezed,
  }) {
    return _then(_Pet(
      codigo_mascota == freezed ? _value.codigo_mascota : codigo_mascota as int,
      nombre == freezed ? _value.nombre : nombre as String,
      fecha_nacimiento == freezed
          ? _value.fecha_nacimiento
          : fecha_nacimiento as DateTime,
      sexo == freezed ? _value.sexo : sexo as bool,
      peso == freezed ? _value.peso : peso as double,
      color == freezed ? _value.color : color as String,
      comentarios == freezed ? _value.comentarios : comentarios as String,
      codigo_cliente == freezed ? _value.codigo_cliente : codigo_cliente as int,
      codigo_especie == freezed ? _value.codigo_especie : codigo_especie as int,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Pet implements _Pet {
  const _$_Pet(
      this.codigo_mascota,
      this.nombre,
      this.fecha_nacimiento,
      this.sexo,
      this.peso,
      this.color,
      this.comentarios,
      this.codigo_cliente,
      this.codigo_especie)
      : assert(codigo_mascota != null),
        assert(nombre != null),
        assert(fecha_nacimiento != null),
        assert(sexo != null),
        assert(peso != null),
        assert(color != null),
        assert(comentarios != null),
        assert(codigo_cliente != null),
        assert(codigo_especie != null);

  factory _$_Pet.fromJson(Map<String, dynamic> json) => _$_$_PetFromJson(json);

  @override
  final int codigo_mascota;
  @override
  final String nombre;
  @override
  final DateTime fecha_nacimiento;
  @override
  final bool sexo;
  @override
  final double peso;
  @override
  final String color;
  @override
  final String comentarios;
  @override
  final int codigo_cliente;
  @override
  final int codigo_especie;

  @override
  String toString() {
    return 'Pet(codigo_mascota: $codigo_mascota, nombre: $nombre, fecha_nacimiento: $fecha_nacimiento, sexo: $sexo, peso: $peso, color: $color, comentarios: $comentarios, codigo_cliente: $codigo_cliente, codigo_especie: $codigo_especie)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Pet &&
            (identical(other.codigo_mascota, codigo_mascota) ||
                const DeepCollectionEquality()
                    .equals(other.codigo_mascota, codigo_mascota)) &&
            (identical(other.nombre, nombre) ||
                const DeepCollectionEquality().equals(other.nombre, nombre)) &&
            (identical(other.fecha_nacimiento, fecha_nacimiento) ||
                const DeepCollectionEquality()
                    .equals(other.fecha_nacimiento, fecha_nacimiento)) &&
            (identical(other.sexo, sexo) ||
                const DeepCollectionEquality().equals(other.sexo, sexo)) &&
            (identical(other.peso, peso) ||
                const DeepCollectionEquality().equals(other.peso, peso)) &&
            (identical(other.color, color) ||
                const DeepCollectionEquality().equals(other.color, color)) &&
            (identical(other.comentarios, comentarios) ||
                const DeepCollectionEquality()
                    .equals(other.comentarios, comentarios)) &&
            (identical(other.codigo_cliente, codigo_cliente) ||
                const DeepCollectionEquality()
                    .equals(other.codigo_cliente, codigo_cliente)) &&
            (identical(other.codigo_especie, codigo_especie) ||
                const DeepCollectionEquality()
                    .equals(other.codigo_especie, codigo_especie)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(codigo_mascota) ^
      const DeepCollectionEquality().hash(nombre) ^
      const DeepCollectionEquality().hash(fecha_nacimiento) ^
      const DeepCollectionEquality().hash(sexo) ^
      const DeepCollectionEquality().hash(peso) ^
      const DeepCollectionEquality().hash(color) ^
      const DeepCollectionEquality().hash(comentarios) ^
      const DeepCollectionEquality().hash(codigo_cliente) ^
      const DeepCollectionEquality().hash(codigo_especie);

  @override
  _$PetCopyWith<_Pet> get copyWith =>
      __$PetCopyWithImpl<_Pet>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PetToJson(this);
  }
}

abstract class _Pet implements Pet {
  const factory _Pet(
      int codigo_mascota,
      String nombre,
      DateTime fecha_nacimiento,
      bool sexo,
      double peso,
      String color,
      String comentarios,
      int codigo_cliente,
      int codigo_especie) = _$_Pet;

  factory _Pet.fromJson(Map<String, dynamic> json) = _$_Pet.fromJson;

  @override
  int get codigo_mascota;
  @override
  String get nombre;
  @override
  DateTime get fecha_nacimiento;
  @override
  bool get sexo;
  @override
  double get peso;
  @override
  String get color;
  @override
  String get comentarios;
  @override
  int get codigo_cliente;
  @override
  int get codigo_especie;
  @override
  _$PetCopyWith<_Pet> get copyWith;
}

Specie _$SpecieFromJson(Map<String, dynamic> json) {
  return _Specie.fromJson(json);
}

/// @nodoc
class _$SpecieTearOff {
  const _$SpecieTearOff();

// ignore: unused_element
  _Specie call(int codigo_especie, String especie) {
    return _Specie(
      codigo_especie,
      especie,
    );
  }

// ignore: unused_element
  Specie fromJson(Map<String, Object> json) {
    return Specie.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $Specie = _$SpecieTearOff();

/// @nodoc
mixin _$Specie {
  int get codigo_especie;
  String get especie;

  Map<String, dynamic> toJson();
  $SpecieCopyWith<Specie> get copyWith;
}

/// @nodoc
abstract class $SpecieCopyWith<$Res> {
  factory $SpecieCopyWith(Specie value, $Res Function(Specie) then) =
      _$SpecieCopyWithImpl<$Res>;
  $Res call({int codigo_especie, String especie});
}

/// @nodoc
class _$SpecieCopyWithImpl<$Res> implements $SpecieCopyWith<$Res> {
  _$SpecieCopyWithImpl(this._value, this._then);

  final Specie _value;
  // ignore: unused_field
  final $Res Function(Specie) _then;

  @override
  $Res call({
    Object codigo_especie = freezed,
    Object especie = freezed,
  }) {
    return _then(_value.copyWith(
      codigo_especie: codigo_especie == freezed
          ? _value.codigo_especie
          : codigo_especie as int,
      especie: especie == freezed ? _value.especie : especie as String,
    ));
  }
}

/// @nodoc
abstract class _$SpecieCopyWith<$Res> implements $SpecieCopyWith<$Res> {
  factory _$SpecieCopyWith(_Specie value, $Res Function(_Specie) then) =
      __$SpecieCopyWithImpl<$Res>;
  @override
  $Res call({int codigo_especie, String especie});
}

/// @nodoc
class __$SpecieCopyWithImpl<$Res> extends _$SpecieCopyWithImpl<$Res>
    implements _$SpecieCopyWith<$Res> {
  __$SpecieCopyWithImpl(_Specie _value, $Res Function(_Specie) _then)
      : super(_value, (v) => _then(v as _Specie));

  @override
  _Specie get _value => super._value as _Specie;

  @override
  $Res call({
    Object codigo_especie = freezed,
    Object especie = freezed,
  }) {
    return _then(_Specie(
      codigo_especie == freezed ? _value.codigo_especie : codigo_especie as int,
      especie == freezed ? _value.especie : especie as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Specie implements _Specie {
  const _$_Specie(this.codigo_especie, this.especie)
      : assert(codigo_especie != null),
        assert(especie != null);

  factory _$_Specie.fromJson(Map<String, dynamic> json) =>
      _$_$_SpecieFromJson(json);

  @override
  final int codigo_especie;
  @override
  final String especie;

  @override
  String toString() {
    return 'Specie(codigo_especie: $codigo_especie, especie: $especie)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Specie &&
            (identical(other.codigo_especie, codigo_especie) ||
                const DeepCollectionEquality()
                    .equals(other.codigo_especie, codigo_especie)) &&
            (identical(other.especie, especie) ||
                const DeepCollectionEquality().equals(other.especie, especie)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(codigo_especie) ^
      const DeepCollectionEquality().hash(especie);

  @override
  _$SpecieCopyWith<_Specie> get copyWith =>
      __$SpecieCopyWithImpl<_Specie>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SpecieToJson(this);
  }
}

abstract class _Specie implements Specie {
  const factory _Specie(int codigo_especie, String especie) = _$_Specie;

  factory _Specie.fromJson(Map<String, dynamic> json) = _$_Specie.fromJson;

  @override
  int get codigo_especie;
  @override
  String get especie;
  @override
  _$SpecieCopyWith<_Specie> get copyWith;
}
