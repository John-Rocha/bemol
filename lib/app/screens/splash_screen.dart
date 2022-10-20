import 'package:bemol_test/app/core/ui/styles/colors_app.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.primary,
      body: Center(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * .8,
              height: MediaQuery.of(context).size.height * .8,
              child: Image.asset('assets/images/logo_bemol.png'),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .8,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: context.colors.secondary,
                ),
                onPressed: () {},
                child: const Text('Entrar'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
