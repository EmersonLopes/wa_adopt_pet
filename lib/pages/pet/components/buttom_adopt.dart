import 'package:flutter/material.dart';
import 'package:wa_adopt_pet/components/widget_default_buttom.dart';

class ButtomAdopt extends StatefulWidget {
  const ButtomAdopt({Key? key}) : super(key: key);

  @override
  State<ButtomAdopt> createState() => _ButtomAdoptState();
}

class _ButtomAdoptState extends State<ButtomAdopt> {
  bool isAdopted = false;

  @override
  Widget build(BuildContext context) {
    return WidgetDefaultButtom(
      text: 'Me adote',
      press: isAdopted
          ? null
          : () {
              ScaffoldMessenger.of(context).showMaterialBanner(MaterialBanner(
                  content: const Text("Pet adotado com sucesso!."),
                  actions: [
                    TextButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context)
                              .hideCurrentMaterialBanner();
                          Navigator.pop(context);
                        },
                        child: const Text('OK')),
                  ]));

              setState(() {
                isAdopted = true;
              });
            },
    );
  }
}
