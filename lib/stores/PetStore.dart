import 'package:mobx/mobx.dart';
import 'package:practica10/models/freezed_classes.dart';
import 'package:practica10/services/petService.dart';

part 'PetStore.g.dart';

class PetStore = _PetStore with _$PetStore;

abstract class _PetStore with Store{

  PetService petService = PetService();

  @observable
  bool isLoading = false;

  @observable
  List<Pet> listPet = null;

  @action
  Future<void> getPets () async {
    isLoading = true;
    listPet = await petService.getPets();
    isLoading = false;
  }

  @action
  Future<bool> delete( int id ) async {
    return await petService.delete(id);
  }

}