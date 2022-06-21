import 'package:mobx/mobx.dart';
import 'package:wa_adopt_pet/repositories/pet/pet_repository_interface.dart';

import 'enum_state_controller.dart';

part 'pet_controller.g.dart';

class PetController = PetControllerBase
    with _$PetController;

abstract class PetControllerBase with Store {
  final IPetRepository simulationRepository;

  PetControllerBase(this.simulationRepository);

  @observable
  StateController statePet = StateController.idle;


  getDogs() async {
    try {
      statePet = StateController.loading;

      await simulationRepository.getDogs();
      await simulationRepository.getCats();

      statePet = StateController.error;
    } catch (e) {
      statePet = StateController.error;
    }
  }
}
