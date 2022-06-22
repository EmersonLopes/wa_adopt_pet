import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:wa_adopt_pet/models/pet_model.dart';

class CardPet extends StatefulWidget {
  const CardPet({Key? key, required this.petModel}) : super(key: key);

  final PetModel petModel;

  @override
  State<CardPet> createState() => _CardPetState();
}

class _CardPetState extends State<CardPet> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        // height: MediaQuery.of(context).size.height * 0.2,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            FadeInImage.assetNetwork(
                fit: BoxFit.fill,
                // height: 150.0,
                placeholder: "images/pet.png",
                image: widget.petModel.url ?? "")
          ],
        ),
      ),
    );
  }

  getName(PetModel p) {
    String name = "";
    if (p.breeds != null) {
      if (p.breeds!.length > 0) {
        name = p.breeds![0].name!;
      }

      //
    }
  }
}
