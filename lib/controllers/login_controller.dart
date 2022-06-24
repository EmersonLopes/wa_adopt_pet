import 'package:mobx/mobx.dart';
import 'package:wa_adopt_pet/services/local_storage_intergace.dart';

import '../utils/constants.dart';
import 'enum_state_controller.dart';

part 'login_controller.g.dart';

class LoginController = LoginControllerBase with _$LoginController;

abstract class LoginControllerBase with Store {
  final ILocalStorage storage;

  LoginControllerBase(this.storage);

  @observable
  StateController stateLogin = StateController.idle;

  String loginEmail = "";

  List<dynamic> jsonEmails = [
    {"email": "joao@gmail.com"},
    {"email": "maria@gmail.com"},
    {"email": "jose@gmail.com"},
  ];

  Future<bool?> isLogged() async {
    String? user = await storage.get(Constants.SHARED_LOGIN_USER);

    loginEmail = user ?? "";

    return loginEmail.isNotEmpty;
  }

  Future<bool?> login() async {
    try {
      stateLogin = StateController.loading;
      bool ok = false;
      if (loginEmail.isNotEmpty) {
        if (!emailInJson(loginEmail)) {
          throw Exception();
        }
        await storage.put(Constants.SHARED_LOGIN_USER, loginEmail);
        ok = true;
      }

      stateLogin = StateController.success;
      return ok;
    } catch (e) {
      loginEmail = "";
      stateLogin = StateController.error;
      rethrow;
    }
  }

  Future<bool?> logout() async {
    try {
      stateLogin = StateController.loading;
      await storage.delete(Constants.SHARED_LOGIN_USER);
      stateLogin = StateController.success;
      return true;
    } catch (e) {
      loginEmail = "";
      stateLogin = StateController.error;
      rethrow;
    }
  }

  bool emailInJson(String email) {
    bool emailExists = false;
    jsonEmails.forEach((e) {
      if (e['email'] == email) {
        emailExists = true;
      }
    });

    return emailExists;
  }
}
