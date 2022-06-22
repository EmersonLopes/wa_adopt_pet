import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:wa_adopt_pet/models/pet_model.dart';
import 'package:wa_adopt_pet/repositories/pet/pet_repository_interface.dart';

import 'enum_state_controller.dart';

part 'pet_controller.g.dart';

class PetController = PetControllerBase with _$PetController;

abstract class PetControllerBase with Store {
  final IPetRepository petRepository;

  PetControllerBase(this.petRepository);

  @observable
  StateController statePet = StateController.idle;

  List<PetModel> listPets = [];

  getPets() async {
    try {
      statePet = StateController.loading;

      List<PetModel> listDogs = await petRepository.getDogs();
      if (listDogs.isNotEmpty) {
        listPets.addAll(listDogs);
      }
      List<PetModel> listCats = await petRepository.getCats();
      if (listCats.isNotEmpty) {
        listPets.addAll(listCats);
      }

      statePet = StateController.success;
    } catch (e) {
      debugPrint(e.toString());
      statePet = StateController.error;
    }
  }

  clearPets() async {
    try {
      statePet = StateController.loading;

      listPets.clear();

      statePet = StateController.success;
    } catch (e) {
      statePet = StateController.error;
    }
  }
}
