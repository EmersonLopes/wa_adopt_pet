import 'package:flutter/material.dart';

class PetLoading extends StatelessWidget {
  const PetLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.8,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          Image(
            image: AssetImage("assets/images/pet.png"),
            height: 150.0,
          ),
          SizedBox(height: 6.0),
          Text(
            "Carregando...",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
          ),
        ],
      ),
    );

    Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height * 0.35,
      width: MediaQuery.of(context).size.width,
      child: const CircularProgressIndicator(),
    );
  }
}
