import 'package:mobx/mobx.dart';

import "dart:convert";
import "package:practica10/models/freezed_classes.dart";
import 'package:practica10/services/ownerService.dart';
part 'OwnersStore.g.dart';

class OwnerStore = _OwnersStore with _$OwnerStore;

abstract class _OwnersStore with Store{

  OwnerService os = OwnerService();

  @observable
  bool isLoading = false;
  @observable
  List<Owner> realOwners = [];

  @action
  Future<void> getOwners() async {
    isLoading = true;

    realOwners = await os.getOwners();

    isLoading = false;
  }


  
}