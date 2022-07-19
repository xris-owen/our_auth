import 'package:flutter/material.dart';
import 'package:our_auth/src/screens/auth/login_screen.dart';
import 'package:our_auth/src/screens/auth/signup_screen.dart';
import 'package:our_auth/src/screens/home_screen.dart';

class AppRoute {
  Route? onGeneratedRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case '/login':
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case '/sihnup':
        return MaterialPageRoute(
          builder: (_) => const SignupScreen(),
        );
      default:
        return null;
    }
  }
}
