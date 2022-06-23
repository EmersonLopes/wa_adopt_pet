import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wa_adopt_pet/controllers/pet_controller.dart';
import 'package:wa_adopt_pet/pages/pets/components/list_view_pets.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  ScrollController _scrollController = ScrollController();
  late PetController petController;

  @override
  void initState() {
    _scrollController.addListener(() {
      _scrollListener();
    });

    petController = context.read<PetController>();
    petController.clearPets();
    petController.getPets();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        controller: _scrollController,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ListViewPets(),
            ],
          ),
        ));
  }

  _scrollListener() {
    print("listener");
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      print("End list");
      petController.getPets();
    }
  }
}
