import 'package:bemol_test/app/core/routes/routes.dart';
import 'package:bemol_test/app/core/ui/theme/theme_config.dart';
import 'package:flutter/material.dart';

class BemolApp extends StatelessWidget {
  const BemolApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bemol Canal',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: Routes.instance.routes,
      theme: ThemeConfig.theme,
    );
  }
}
