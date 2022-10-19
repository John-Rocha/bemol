import 'package:bemol_test/app/screens/home_screen.dart';
import 'package:bemol_test/app/screens/login_screen.dart';
import 'package:bemol_test/app/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class BemolApp extends StatelessWidget {
  const BemolApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bemol Canal',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/spalsh': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
      },
      theme: null,
    );
  }
}
