import 'package:flutter/material.dart';
import 'package:wa_adopt_pet/components/widget_default_buttom.dart';

class ButtomAdopt extends StatefulWidget {
  const ButtomAdopt({Key? key}) : super(key: key);

  @override
  State<ButtomAdopt> createState() => _ButtomAdoptState();
}

class _ButtomAdoptState extends State<ButtomAdopt> {
  @override
  Widget build(BuildContext context) {
    return WidgetDefaultButtom(
      text: 'Me adote',
      press: () {
        Navigator.pop(context);
      },
    );
  }
}
