import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:wa_adopt_pet/controllers/enum_state_controller.dart';
import 'package:wa_adopt_pet/controllers/pet_controller.dart';
import 'package:wa_adopt_pet/models/pet_model.dart';

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
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: petController.listPets.length,
              itemBuilder: (BuildContext context, int index) {
                return getItem(petController.listPets[index]);
              },
            );
        }
      },
    );
  }

  getItem(PetModel p) {
    String name = "";
    if (p.breeds != null) {
      if (p.breeds!.length > 0) {
        name = p.breeds![0].name!;
      }
    }
    return Card(
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        padding: const EdgeInsets.only(left: 14.0),
                        child: Text(
                          name,
                          style: const TextStyle(fontSize: 18.0),
                        )),
                    const SizedBox(height: 2.0),
                  ],
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              height: MediaQuery.of(context).size.height * 0.35,
//        width: width,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  p.url ?? "",
                  fit: BoxFit.cover,
//                      height: MediaQuery.of(context).size.height * 0.8,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
