import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wa_adopt_pet/controllers/pet_controller.dart';

import 'pages/login/login_page.dart';
import 'pages/pets/pets_page.dart';
import 'repositories/pet/pet_repository.dart';
import 'services/client_http_service.dart';
import 'utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (_) => PetController(
            PetRepository(
              ClientHttpService(),
            ),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        initialRoute: AppRoutes.LOGIN,
        routes: {
          AppRoutes.LOGIN: (ctx) => LoginPage(),
          AppRoutes.PETS: (ctx) => PetsPage(),
        },
      ),
    );
  }
}
