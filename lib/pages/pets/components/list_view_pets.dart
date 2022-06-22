import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:wa_adopt_pet/controllers/enum_state_controller.dart';
import 'package:wa_adopt_pet/controllers/pet_controller.dart';
import 'package:wa_adopt_pet/models/pet_model.dart';

import 'card_pet.dart';

class ListViewPets extends StatefulWidget {
  const ListViewPets({Key? key}) : super(key: key);

  @override
  _ListViewPetsState createState() => _ListViewPetsState();
}

class _ListViewPetsState extends State<ListViewPets> {
  late PetController petController;

  @override
  void initState() {
    petController = context.read<PetController>();
    petController.clearPets();
    petController.getPets();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (BuildContext context) {
        switch (petController.statePet) {
          case StateController.loading:
            return Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height * 0.35,
              width: MediaQuery.of(context).size.width,
              child: const CircularProgressIndicator(),
            );
          case StateController.error:
            return Center(
              child: Text('Houve um problema'),
            );
          case StateController.success:
          default:
            if (petController.listPets.isEmpty) {
              return Container(
                  height: MediaQuery.of(context).size.height * 0.75,
                  alignment: Alignment.center,
                  child: const Text('Nenhuma informação encontrada'));
            }
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: petController.listPets.length,
              itemBuilder: (BuildContext context, int index) {
                return CardPet(petModel: petController.listPets[index]);
              },
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20),
            );
        }
      },
    );
  }
}
