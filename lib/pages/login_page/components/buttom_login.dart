import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

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
    return Container();
  }

  Future<void> login() async {
    if (widget.formKey.currentState!.validate()) {
      widget.formKey.currentState!.save();
      try {} catch (e) {}
    }
  }
}
