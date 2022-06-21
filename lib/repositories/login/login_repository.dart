import '../../services/client_http_interface.dart';
import '../../utils/constants.dart';
import 'login_repository_interface.dart';

class LoginRepository implements ILoginRepository {
  final IClientHttp clientHttp;

  LoginRepository(this.clientHttp);

  Map<String, String> headers = {
    "Content-Type": "application/json",
  };

  @override
  Future login(String email) async {
    try {
      final response = await clientHttp
          .post(Constants.URL_CAT, params: {"email": email});

      return response?.data;
    } catch (e) {
      rethrow;
    }
  }
}
