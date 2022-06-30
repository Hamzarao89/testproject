import 'package:flutter/material.dart';
import 'package:syntech1/View/SignIn_View.dart';
import 'package:syntech1/View/SignUp_view.dart';
import 'package:syntech1/utils/routes/routes_names.dart';

import '../../View/Splash_View.dart';

class Routes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    final argume = settings.arguments;
    switch (settings.name) {
      case RoutesName.splash:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SplashScreen());
      case RoutesName.signIn:
        return MaterialPageRoute(
            builder: (BuildContext context) => SignInScreen());
      case RoutesName.signUp:
        return MaterialPageRoute(
            builder: (BuildContext context) => SignUpScreen());
      default:
        return MaterialPageRoute(builder: (context) {
          return const Scaffold(
            body: Center(
              child: Text("No Route Defined"),
            ),
          );
        });
    }
  }
}
