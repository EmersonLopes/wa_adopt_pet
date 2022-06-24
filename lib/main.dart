import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wa_adopt_pet/controllers/pet_controller.dart';
import 'package:wa_adopt_pet/services/shared_local_storage_service.dart';

import 'controllers/login_controller.dart';
import 'pages/login/login_page.dart';
import 'pages/pet/pet_page.dart';
import 'pages/pets/pets_page.dart';
import 'repositories/pet/pet_repository.dart';
import 'services/client_http_service.dart';
import 'utils/app_routes.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
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
        Provider(
          create: (_) => LoginController(
            SharedLocalStorageService(),
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
          AppRoutes.PET: (ctx) => PetPage(),
        },
      ),
    );
  }
}
