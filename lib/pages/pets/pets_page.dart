import 'package:flutter/material.dart';

import 'components/body.dart';

class PetsPage extends StatefulWidget {
  const PetsPage({Key? key}) : super(key: key);

  @override
  State<PetsPage> createState() => _PetsPageState();
}

class _PetsPageState extends State<PetsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pets")),
      body: Body(),
    );
  }
}
