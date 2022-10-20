import 'package:flutter/material.dart';

class ColorsApp {
  static ColorsApp? _instance;

  ColorsApp._();

  static ColorsApp get instance {
    _instance ??= ColorsApp._();
    return _instance!;
  }

  Color get primary => const Color(0xff00a1e5);
  Color get secondary => const Color(0xffff0000);
  Color get grey => const Color(0xffcccccc);
  Color get greyDark => const Color(0xff999999);
}

extension ColorsAppExtensions on BuildContext {
  ColorsApp get colors => ColorsApp.instance;
}
