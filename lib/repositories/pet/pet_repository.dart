import 'package:wa_adopt_pet/repositories/pet/pet_repository_interface.dart';
import 'package:wa_adopt_pet/services/client_http_interface.dart';
import 'package:wa_adopt_pet/utils/constants.dart';

class PetRepository implements IPetRepository {
  final IClientHttp clientHttp;

  PetRepository(this.clientHttp);

  @override
  Future getCats() async {
    try {
      final response = await clientHttp.get(Constants.URL_CAT);

      return response?.data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future getDogs() async {
    try {
      final response = await clientHttp.get(Constants.URL_DOG);

      return response?.data;
    } catch (e) {
      rethrow;
    }
  }
}
