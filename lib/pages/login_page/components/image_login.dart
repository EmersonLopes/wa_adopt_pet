import 'package:flutter/material.dart';

class ImageLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'images/imagelogin.png',
        // width: MediaQuery.of(context).size.width,
      ),
    );
  }
}
