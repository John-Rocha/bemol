import 'package:bemol_test/app/screens/home_screen.dart';
import 'package:bemol_test/app/screens/login_screen.dart';
import 'package:bemol_test/app/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static Routes? _instance;

  Routes._();
  static Routes get instance {
    _instance ??= Routes._();
    return _instance!;
  }

  Map<String, WidgetBuilder> get routes {
    return {
      '/': (context) => const SplashScreen(),
      '/login': (context) => const LoginScreen(),
      '/home': (context) => const HomeScreen(),
    };
  }
}
