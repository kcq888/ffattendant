import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ftt151attendant/controllers/auth_controller.dart';
import 'package:ftt151attendant/controllers/login_controller.dart';
import 'package:ftt151attendant/routes/app_routes.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => AuthController()),
    ChangeNotifierProvider(create: (_) => LoginController())
  ], child: const TT151Attendant()));
}

class TT151Attendant extends StatelessWidget {
  const TT151Attendant({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Tough Tech Attendant App',
      theme: ThemeData(fontFamily: 'Toy Robots'),
      debugShowCheckedModeBanner: false,
      routeInformationProvider: AppRoutes.router.routeInformationProvider,
      routeInformationParser: AppRoutes.router.routeInformationParser,
      routerDelegate: AppRoutes.router.routerDelegate,
    );
  }
}
