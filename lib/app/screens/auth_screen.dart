import 'package:bemol_test/app/core/ui/styles/colors_app.dart';
import 'package:bemol_test/app/core/ui/styles/text_styles.dart';
import 'package:bemol_test/app/services/auth_service.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();
  bool isRegister = false;

  final _auth = AuthService.instance;

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
                            child: !isRegister
                                ? Text(
                                    'Login',
                                    style: context.textStyles.titleWhite,
                                  )
                                : Text(
                                    'Registrar',
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
                            child: Text(
                              !isRegister ? 'Entrar' : 'Registrar',
                              style: context.textStyles.textPrimaryFontRegular
                                  .copyWith(
                                fontSize: 16,
                              ),
                            ),
                            onPressed: () {
                              if (isRegister) {
                                _auth.register(_emailEC.text, _passwordEC.text);
                                setState(() {
                                  isRegister = false;
                                });
                              } else {
                                _auth.login(_emailEC.text, _passwordEC.text);
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                  '/home',
                                  (route) => false,
                                );
                              }
                            },
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
                      text: 'Possui uma conta? ',
                      style: context.textStyles.textPrimaryFontMedium.copyWith(
                        color: context.colors.grey,
                      ),
                      children: [
                        TextSpan(
                          text: !isRegister ? 'Cadastre-se' : 'Entrar',
                          style:
                              context.textStyles.textPrimaryFontMedium.copyWith(
                            color: context.colors.secondary,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => setState(() {
                                  isRegister = !isRegister;
                                }),
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
