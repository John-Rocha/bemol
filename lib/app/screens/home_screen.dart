import 'package:bemol_test/app/core/ui/styles/colors_app.dart';
import 'package:bemol_test/app/services/auth_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final _auth = AuthService.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.primary,
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            onPressed: () {
              _auth.logout();
              Navigator.of(context).pushNamedAndRemoveUntil(
                '/',
                (route) => false,
              );
            },
            icon: Icon(
              Icons.logout,
              color: context.colors.secondary,
            ),
          ),
        ],
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/form');
        },
        child: const Icon(Icons.person_add),
      ),
    );
  }
}
