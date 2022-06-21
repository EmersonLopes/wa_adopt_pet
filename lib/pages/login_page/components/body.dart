import 'package:flutter/material.dart';

import 'bem_vindo.dart';
import 'buttom_login.dart';
import 'email_text_field.dart';
import 'image_login.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
        child: Form(
      key: formKey,
      child: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: [
                  ImageLogin(),
                  SizedBox(height: 16.0,),
                  Text("Wa Adopt Pet",
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600)),
                ],
              ),


              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: screenHeight * 0.04),
                  const Text("Informe seu e-mail",
                      style: TextStyle(fontSize: 16)),
                  const EmailTextField(),
                ],
              ),
              ButtomLogin(formKey: formKey),
            ]),
      ),
    ));
  }
}
