import 'dart:js';

import 'package:ftt151attendant/controllers/login_controller.dart';
import 'package:ftt151attendant/pages/login_page.dart';
import 'package:ftt151attendant/pages/splash_page.dart';
import 'package:go_router/go_router.dart';

import '../helpers/utils.dart';

class AppRoutes {
  static final router = GoRouter(
    initialLocation: LoginPage.route,
    navigatorKey: Utils.mainNav,
    routes: [
      GoRoute(
        parentNavigatorKey: Utils.mainNav,
        path: SplashPage.route,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
          parentNavigatorKey: Utils.mainNav,
          path: LoginPage.route,
          builder: (context, state) => const LoginPage())
    ],
  );
}
