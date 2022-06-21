import 'package:flutter/material.dart';

class BemVindo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text(
            'Bem-vindo, ',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.normal),
          ),
          Text(
            'Wa Adopt Pet',
            style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }
}
