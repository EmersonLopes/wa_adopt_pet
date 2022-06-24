import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wa_adopt_pet/controllers/login_controller.dart';
import 'package:wa_adopt_pet/pages/pets/components/buttom_logout.dart';
import 'package:wa_adopt_pet/utils/app_routes.dart';

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
      appBar: AppBar(
        title: Text("Pets"),
        actions: [ButtomLogout()],
      ),
      body: Body(),
    );
  }
}
