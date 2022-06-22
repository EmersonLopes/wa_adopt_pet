import 'package:flutter/material.dart';
import 'package:wa_adopt_pet/components/widget_textformfield.dart';
import 'package:wa_adopt_pet/utils/regex_util.dart';

class EmailTextField extends StatefulWidget {
  const EmailTextField({Key? key}) : super(key: key);

  @override
  State<EmailTextField> createState() => _EmailTextFieldState();
}

class _EmailTextFieldState extends State<EmailTextField> {
  late TextEditingController emailController;

  @override
  void initState() {
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return

      WidgetTextFormField(
        controller: emailController,
        hintText: "seuemail@email.com",
        keyboardType: TextInputType.emailAddress,
        onChanged: (value){

        },
        validator: (value) {
          if (!RegexUtil.isEmailValid(value!)) return 'E-mail inválido';

          return null;
        },
      );

  }
}
