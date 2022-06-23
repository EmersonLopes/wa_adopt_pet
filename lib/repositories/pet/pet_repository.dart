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
      final response = await clientHttp.get(Constants.URL_CAT);
      List<PetModel> pets = (response.data as List)
          .map((i) => PetModel.fromJson(i, false))
          .toList();
      return pets;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<PetModel>> getDogs() async {
    try {
      final response = await clientHttp.get(Constants.URL_DOG);
      List<PetModel> pets = (response.data as List)
          .map((i) => PetModel.fromJson(i, true))
          .toList();
      return pets;
    } catch (e) {
      rethrow;
    }
  }
}
