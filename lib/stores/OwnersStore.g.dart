// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'OwnersStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$OwnerStore on _OwnersStore, Store {
  final _$isLoadingAtom = Atom(name: '_OwnersStore.isLoading');

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

  final _$realOwnersAtom = Atom(name: '_OwnersStore.realOwners');

  @override
  List<Owner> get realOwners {
    _$realOwnersAtom.reportRead();
    return super.realOwners;
  }

  @override
  set realOwners(List<Owner> value) {
    _$realOwnersAtom.reportWrite(value, super.realOwners, () {
      super.realOwners = value;
    });
  }

  final _$getOwnersAsyncAction = AsyncAction('_OwnersStore.getOwners');

  @override
  Future<void> getOwners() {
    return _$getOwnersAsyncAction.run(() => super.getOwners());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
realOwners: ${realOwners}
    ''';
  }
}
