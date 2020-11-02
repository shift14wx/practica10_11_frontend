// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SpeciesStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SpeciesStore on _SpeciesStores, Store {
  final _$isLoadingAtom = Atom(name: '_SpeciesStores.isLoading');

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

  final _$listSpeciesAtom = Atom(name: '_SpeciesStores.listSpecies');

  @override
  List<Specie> get listSpecies {
    _$listSpeciesAtom.reportRead();
    return super.listSpecies;
  }

  @override
  set listSpecies(List<Specie> value) {
    _$listSpeciesAtom.reportWrite(value, super.listSpecies, () {
      super.listSpecies = value;
    });
  }

  final _$getSpeciesAsyncAction = AsyncAction('_SpeciesStores.getSpecies');

  @override
  Future<void> getSpecies() {
    return _$getSpeciesAsyncAction.run(() => super.getSpecies());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
listSpecies: ${listSpecies}
    ''';
  }
}
