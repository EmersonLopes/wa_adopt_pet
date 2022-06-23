import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:wa_adopt_pet/controllers/pet_controller.dart';
import 'package:wa_adopt_pet/models/pet_model.dart';
import 'package:wa_adopt_pet/utils/app_routes.dart';

class CardPet extends StatefulWidget {
  const CardPet({Key? key, required this.petModel}) : super(key: key);

  final PetModel petModel;

  @override
  State<CardPet> createState() => _CardPetState();
}

class _CardPetState extends State<CardPet> {
  late PetController petController;

  @override
  void initState() {
    petController = context.read<PetController>();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        petController.selectedPet = widget.petModel;
        Navigator.pushNamed(context, AppRoutes.PET);
      },
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 5,
        child: Container(
          height: 250,
          child: Stack(
            children: [
              Container(
                height: 120,
                // padding: const EdgeInsets.only(bottom: 50),
                child: FadeInImage.assetNetwork(
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                  image: widget.petModel.url ?? "",
                  placeholder: "assets/images/pet.png",
                ),
              ),
              Positioned(
                bottom: 16,
                left: 6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 140,
                      child: Text(
                        widget.petModel.getName(),
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16.0),
                        overflow: TextOverflow.clip,
                        maxLines: 1,
                      ),
                    ),
                    Text(
                      widget.petModel.getGroupOrOrigin(),
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 12.0),
                    ),
                  ],
                ),
              ),
              Positioned(
                  bottom: 16,
                  right: 8,
                  child: Icon(
                    size: 18,
                    widget.petModel.isDog ?? true
                        ? FontAwesomeIcons.dog
                        : FontAwesomeIcons.cat,
                    color: Theme.of(context).primaryColorLight,
                  ))
            ],
          ),
        ),
      ),
    );
  }


}
