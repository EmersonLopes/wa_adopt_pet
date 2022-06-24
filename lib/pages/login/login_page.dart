import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wa_adopt_pet/controllers/login_controller.dart';
import 'package:wa_adopt_pet/utils/app_routes.dart';
import 'components/body.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginController loginController;

  @override
  void initState() {
    loginController = context.read<LoginController>();
    isLogged();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Body()),
    );
  }

  isLogged() async {
    var logged = await loginController.isLogged();
    if (logged ?? false) {
      Navigator.pushReplacementNamed(context, AppRoutes.PETS);
    }
  }
}
