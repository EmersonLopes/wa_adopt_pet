import 'package:cached_network_image/cached_network_image.dart';
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
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(20),
            bottomLeft: Radius.circular(20)),
      ),
      elevation: 5,
      child: CachedNetworkImage(
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
        imageUrl: petModel.url ?? "",
        placeholder: (context, url) => const Image(
            image: AssetImage("assets/images/pet.png"), fit: BoxFit.fitWidth),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
