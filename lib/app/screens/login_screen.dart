import 'package:bemol_test/app/core/ui/styles/colors_app.dart';
import 'package:bemol_test/app/core/ui/styles/text_styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.primary,
      body: Form(
        key: _formKey,
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate.fixed(
                [
                  SizedBox(
                    height: MediaQuery.of(context).size.height *
                        (MediaQuery.of(context).size.width > 350 ? .30 : .25),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * .2,
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/logo_bemol.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 20,
                      left: 10,
                      right: 10,
                    ),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Center(
                            child: Text(
                              'Login',
                              style: context.textStyles.titleWhite,
                            ),
                          ),
                          TextFormField(
                            controller: _emailEC,
                            decoration: const InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              label: Text('E-mail'),
                            ),
                            validator: Validatorless.multiple([
                              Validatorless.required('Obrigatório'),
                              Validatorless.email('E-mail inválido'),
                            ]),
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: _passwordEC,
                            obscureText: true,
                            decoration: const InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              label: Text('Senha'),
                            ),
                            validator: Validatorless.multiple([
                              Validatorless.required('Obrigatório'),
                              Validatorless.min(
                                  6, 'Senha deve ter pelo menos 6 caractéres')
                            ]),
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: context.colors.secondary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            onPressed: () {},
                            child: Text(
                              'Entrar',
                              style: context.textStyles.textPrimaryFontRegular
                                  .copyWith(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  const Spacer(),
                  Text.rich(
                    TextSpan(
                      text: 'Não possui uma conta? ',
                      style: context.textStyles.textPrimaryFontMedium.copyWith(
                        color: context.colors.grey,
                      ),
                      children: [
                        TextSpan(
                          text: 'Cadastre-se',
                          style:
                              context.textStyles.textPrimaryFontMedium.copyWith(
                            color: context.colors.secondary,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () =>
                                Navigator.of(context).pushNamed('/signup'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
