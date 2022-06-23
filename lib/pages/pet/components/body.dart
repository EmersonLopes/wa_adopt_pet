import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wa_adopt_pet/components/widget_default_buttom.dart';
import 'package:wa_adopt_pet/models/pet_model.dart';
import 'package:wa_adopt_pet/pages/pet/components/image_pet.dart';
import 'package:wa_adopt_pet/pages/pets/components/list_view_pets.dart';

import 'more_information.dart';

class Body extends StatefulWidget {
  const Body({super.key, required this.petModel});

  final PetModel petModel;

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
          SizedBox(height: 250, child: ImagePet(petModel: widget.petModel)),
          Container(
            padding: EdgeInsets.all(16.0),
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.75,
                      child: Text(
                        widget.petModel.getName(),
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 24.0),
                        overflow: TextOverflow.clip,
                        maxLines: 1,
                      ),
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    Text(
                      widget.petModel.getGroupOrOrigin(),
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 16.0),
                    ),
                  ],
                ),
                Icon(
                  size: 30,
                  widget.petModel.isDog ?? true
                      ? FontAwesomeIcons.dog
                      : FontAwesomeIcons.cat,
                  color: Theme.of(context).primaryColorLight,
                )
              ],
            ),
          ),
          if (widget.petModel.getDescription() != null)
            MoreInformation(
                title: 'Descrição:',
                info: widget.petModel.getDescription() ?? ""),
          SizedBox(
            height: 6.0,
          ),
          if (widget.petModel.getBredFor() != null)
            MoreInformation(
                title: 'Criado para:',
                info: widget.petModel.getBredFor() ?? ""),
          SizedBox(
            height: 6.0,
          ),
          if (widget.petModel.getTemperament() != null)
            MoreInformation(
                title: 'Temperamento:',
                info: widget.petModel.getTemperament() ?? ""),
          SizedBox(
            height: 6.0,
          ),
          if (widget.petModel.getLifeSpan() != null)
            MoreInformation(
                title: 'Expectativa de vida:',
                info: widget.petModel.getLifeSpan() ?? ""),
        ]));
  }
}
