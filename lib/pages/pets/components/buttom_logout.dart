import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wa_adopt_pet/controllers/login_controller.dart';
import 'package:wa_adopt_pet/utils/app_routes.dart';

class ButtomLogout extends StatefulWidget {
  const ButtomLogout({Key? key}) : super(key: key);

  @override
  State<ButtomLogout> createState() => _ButtomLogoutState();
}

class _ButtomLogoutState extends State<ButtomLogout> {
  late LoginController loginController;

  @override
  void initState() {
    loginController = context.read<LoginController>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () async {
          var logout = await loginController.logout();
          if (logout ?? false) {
            Navigator.pushReplacementNamed(context, AppRoutes.LOGIN);
          }
        },
        icon: Icon(Icons.logout));
  }
}
