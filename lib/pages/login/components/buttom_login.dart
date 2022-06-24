import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:wa_adopt_pet/components/widget_default_buttom.dart';
import 'package:wa_adopt_pet/controllers/enum_state_controller.dart';
import 'package:wa_adopt_pet/controllers/login_controller.dart';
import 'package:wa_adopt_pet/utils/app_routes.dart';

class ButtomLogin extends StatefulWidget {
  final GlobalKey<FormState> formKey;

  const ButtomLogin({Key? key, required this.formKey}) : super(key: key);

  @override
  State<ButtomLogin> createState() => _ButtomLoginState();
}

class _ButtomLoginState extends State<ButtomLogin> {
  late LoginController loginController;

  @override
  void initState() {
    loginController = context.read<LoginController>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return WidgetDefaultButtom(
        isLoading: loginController.stateLogin == StateController.loading,
        text: "Acessar",
        press: () {
          login();
        },
      );
    });
  }

  Future<void> login() async {
    if (widget.formKey.currentState!.validate()) {
      widget.formKey.currentState!.save();
      try {
        var ok = await loginController.login();
        if (ok ?? false) {
          Navigator.pushReplacementNamed(context, AppRoutes.PETS);
        }
      } on Exception catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Usuário não encontrado.")
        ));
      }
    }
  }
}
