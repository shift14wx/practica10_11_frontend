
import 'package:mobx/mobx.dart';
import 'package:practica10/models/freezed_classes.dart';
import 'package:practica10/services/SpeciesService.dart';
part 'SpeciesStore.g.dart';
class SpeciesStore = _SpeciesStores with _$SpeciesStore;

abstract class _SpeciesStores with Store{

  SpeciesService serviceSpecies = SpeciesService();

  @observable
  bool isLoading= false;

  @observable
  List<Specie> listSpecies;

  @action
  Future<void> getSpecies() async {
    isLoading = true;
    listSpecies = await serviceSpecies.getSpecies();
    isLoading = false;
  }

}