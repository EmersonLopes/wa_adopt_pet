import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ImageLogin extends StatelessWidget {
  final String assetName = 'assets/images/pets.svg';

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsets.all(32.0),
        height: MediaQuery.of(context).size.height * 0.35,
        child: SvgPicture.asset(assetName, semanticsLabel: 'Adopt pet'));
  }
}
