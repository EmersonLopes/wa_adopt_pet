import 'package:flutter/material.dart';
import 'package:wa_adopt_pet/models/pet_model.dart';
import 'package:wa_adopt_pet/repositories/pet/pet_repository_interface.dart';
import 'package:wa_adopt_pet/services/client_http_interface.dart';
import 'package:wa_adopt_pet/utils/constants.dart';

class PetRepository implements IPetRepository {
  final IClientHttp clientHttp;

  PetRepository(this.clientHttp);

  @override
  Future<List<PetModel>> getCats() async {
    try {
      // final response = await clientHttp.get(Constants.URL_CAT);
      // List<PetModel> pets =
      // (response.data as List).map((i) => PetModel.fromJson(i)).toList();
      // return pets;
      return [
        PetModel(url: "https://cdn2.thecatapi.com/images/e6f.jpg"),
        PetModel(url: "https://cdn2.thecatapi.com/images/bsk.jpg"),
        PetModel(url: "https://cdn2.thecatapi.com/images/akv.jpg"),
        PetModel(url: "https://cdn2.thecatapi.com/images/a9r.jpg"),
      ];
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<PetModel>> getDogs() async {
    try {
     
      // final response = await clientHttp.get(Constants.URL_DOG);

      // List<PetModel> pets =
          // (response.data as List).map((i) => PetModel.fromJson(i)).toList();
      // return pets;

      return [
        PetModel(url: "https://cdn2.thedogapi.com/images/BJcNbec4X_1280.jpg"),
        PetModel(url: "https://cdn2.thedogapi.com/images/S1nhWx94Q_1280.jpg"),
        PetModel(url: "https://cdn2.thedogapi.com/images/H1QyMe5EQ_1280.jpg"),
        PetModel(url: "https://cdn2.thedogapi.com/images/Bklnce5NX_1280.jpg"),
      ];
    } catch (e) {
      rethrow;
    }
  }
}
