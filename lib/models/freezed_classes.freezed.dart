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
