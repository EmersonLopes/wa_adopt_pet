import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wa_adopt_pet/components/widget_default_buttom.dart';
import 'package:wa_adopt_pet/controllers/pet_controller.dart';
import 'package:wa_adopt_pet/models/pet_model.dart';
import 'package:wa_adopt_pet/pages/pet/components/buttom_adopt.dart';

import 'components/body.dart';

class PetPage extends StatefulWidget {
  const PetPage({Key? key}) : super(key: key);

  @override
  State<PetPage> createState() => _PetPageState();
}

class _PetPageState extends State<PetPage> {
  late PetController petController;

  @override
  void initState() {
    petController = context.read<PetController>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(petController.selectedPet?.getName())),
      body: Body(petModel: petController.selectedPet!),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ButtomAdopt(),
      ),
    );
  }
}
