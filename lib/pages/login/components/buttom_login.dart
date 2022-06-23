import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:wa_adopt_pet/components/widget_default_buttom.dart';
import 'package:wa_adopt_pet/utils/app_routes.dart';

class ButtomLogin extends StatefulWidget {
  final GlobalKey<FormState> formKey;

  const ButtomLogin({Key? key, required this.formKey}) : super(key: key);

  @override
  State<ButtomLogin> createState() => _ButtomLoginState();
}

class _ButtomLoginState extends State<ButtomLogin> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WidgetDefaultButtom(
      text: "Acessar",
      press: () {
        login();
      },
    );
  }

  Future<void> login() async {
    if (widget.formKey.currentState!.validate()) {
      widget.formKey.currentState!.save();
      try {
        Navigator.pushReplacementNamed(context, AppRoutes.PETS);
      } catch (e) {}
    }
  }
}
