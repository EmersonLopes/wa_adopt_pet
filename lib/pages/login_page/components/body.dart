import 'package:flutter/material.dart';

import 'bem_vindo.dart';
import 'buttom_login.dart';
import 'logo.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();



  @override
  void initState() {

  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Form(
        key: formKey,
        child: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 100.0),
                    Logo(),
                    SizedBox(height: screenHeight * 0.04),
                    BemVindo(),
                    SizedBox(height: screenHeight * 0.01),
                    Text(
                      'Login',
                      style: TextStyle(
                          fontSize: (screenHeight > 550.0) ? 50 : 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ]),
              SizedBox(height: screenHeight * 0.02),
              ButtomLogin(formKey: formKey),
              SizedBox(height: screenHeight * 0.05),
            ],
          ),
        ),
      ),
    );
  }
}
