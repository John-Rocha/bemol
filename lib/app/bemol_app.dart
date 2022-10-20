import 'package:bemol_test/app/blocs/cep_bloc/cep_bloc.dart';
import 'package:bemol_test/app/core/routes/routes.dart';
import 'package:bemol_test/app/core/ui/theme/theme_config.dart';
import 'package:bemol_test/app/services/cep_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class BemolApp extends StatelessWidget {
  const BemolApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => CepService()),
        BlocProvider(
          create: (context) => CepBloc(
            context.read<CepService>(),
          ),
        )
      ],
      child: MaterialApp(
        title: 'Bemol Canal',
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: Routes.instance.routes,
        theme: ThemeConfig.theme,
      ),
    );
  }
}
