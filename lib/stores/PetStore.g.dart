// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PetStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PetStore on _PetStore, Store {
  final _$isLoadingAtom = Atom(name: '_PetStore.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$listPetAtom = Atom(name: '_PetStore.listPet');

  @override
  List<Pet> get listPet {
    _$listPetAtom.reportRead();
    return super.listPet;
  }

  @override
  set listPet(List<Pet> value) {
    _$listPetAtom.reportWrite(value, super.listPet, () {
      super.listPet = value;
    });
  }

  final _$getPetsAsyncAction = AsyncAction('_PetStore.getPets');

  @override
  Future<void> getPets() {
    return _$getPetsAsyncAction.run(() => super.getPets());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
listPet: ${listPet}
    ''';
  }
}
