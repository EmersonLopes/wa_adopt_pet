import 'package:flutter/material.dart';
import 'package:wa_adopt_pet/models/pet_model.dart';

class ImagePet extends StatelessWidget {
  const ImagePet({Key? key, required this.petModel}) : super(key: key);

  final PetModel petModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(0),
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: const RoundedRectangleBorder(
        borderRadius: const BorderRadius.only(
            bottomRight: const Radius.circular(20), bottomLeft: const Radius.circular(20)),
      ),
      elevation: 5,
      child: FadeInImage.assetNetwork(
        fit: BoxFit.cover,
        width: MediaQuery.of(context).size.width,
        image: petModel.url ?? "",
        placeholder: "assets/images/pet.png",
      ),
    );
  }
}
