// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bemol_test/app/core/ui/styles/colors_app.dart';
import 'package:bemol_test/app/core/ui/styles/text_styles.dart';
import 'package:bemol_test/app/core/utils/input_formatter.dart';
import 'package:bemol_test/app/models/user_model.dart';
import 'package:bemol_test/app/services/cep_service.dart';
import 'package:bemol_test/app/services/database_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:validatorless/validatorless.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();

  // Person controllers
  final _nameEC = TextEditingController();
  final _lastNameEC = TextEditingController();
  final _birthEC = TextEditingController();
  String _genderValue = 'Sexo';
  final _cpfEC = TextEditingController();
  final _rgEC = TextEditingController();
  final _emailEC = TextEditingController();
  final _phoneEC = TextEditingController();

  // Address controllers
  final _cepEC = TextEditingController();
  final _logradouroEC = TextEditingController();
  final _numeroEC = TextEditingController();
  final _bairroEC = TextEditingController();
  final _localidadeEC = TextEditingController();
  final _ufEC = TextEditingController();

  final cepService = CepService.instance;
  final dbService = DatabaseService.instance;

  List<String> genres = ['Sexo', 'Homem', 'Mulher', 'Trans', 'Outro'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.primary,
      appBar: AppBar(
        title: Text(
          'Formulário de Usuário',
          style: context.textStyles.textPrimaryFontExtraBold,
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _personData(),
                const SizedBox(height: 10),
                _addressData(),
                const SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: context.colors.secondary,
                  ),
                  onPressed: () async => _saveForm(context),
                  child: const Text('Enviar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _saveForm(BuildContext context) async {
    {
      final isValid = _formKey.currentState?.validate() ?? false;
      final userModel = UserModel(
        name: _nameEC.text,
        lastName: _lastNameEC.text,
        birth: _convertBithToDateTime(_birthEC.text),
        gender: _genderValue,
        cpf: _cpfEC.text,
        rg: _rgEC.text,
        email: _emailEC.text,
        phone: _phoneEC.text,
        cep: _cepEC.text,
        logradouro: _logradouroEC.text,
        number: _numeroEC.text,
        bairro: _bairroEC.text,
        localidade: _localidadeEC.text,
        uf: _ufEC.text,
      );
      if (isValid) {
        final userSaved = await dbService.addUser(userModel);
        if (userSaved && mounted) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Sucesso ao salvar o usuário!'),
          ));

          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.of(context).pushReplacementNamed('/home');
          });
        } else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Houve um erro, por favor, tente novamente.'),
          ));
        }
      }
    }
  }

  DateTime _convertBithToDateTime(String birthDate) {
    return DateFormat('d/M/y').parse(birthDate);
  }

  Widget _personData() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Dados Pessoais',
              style: context.textStyles.titleWhite,
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: TextFormField(
                controller: _nameEC,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  labelText: 'Nome',
                ),
                validator: Validatorless.required('Campo obrigatório'),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextFormField(
                controller: _lastNameEC,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  labelText: 'Sobrenome',
                ),
                validator: Validatorless.required('Campo obrigatório'),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: _birthEC,
                inputFormatters: [
                  InputFormatter.instance.birthDateFormatter,
                ],
                decoration: const InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  labelText: 'Nascimento',
                ),
                validator: Validatorless.required('Campo obrigatório'),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: _gender(),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: _cpfEC,
                inputFormatters: [
                  InputFormatter.instance.cpfFormatter,
                ],
                decoration: const InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  labelText: 'CPF',
                ),
                validator: Validatorless.required('Campo obrigatório'),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextFormField(
                controller: _rgEC,
                decoration: const InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  labelText: 'RG',
                ),
                validator: Validatorless.required('Campo obrigatório'),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: _emailEC,
                decoration: const InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  labelText: 'E-mail',
                ),
                validator: Validatorless.multiple([
                  Validatorless.required('Obrigatório'),
                  Validatorless.email('E-mail inválido'),
                ]),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: _phoneEC,
                inputFormatters: [
                  InputFormatter.instance.phoneFormatter,
                ],
                decoration: const InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  labelText: 'Telefone',
                ),
                validator: Validatorless.required('Campo obrigatório'),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _addressData() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Endereço',
              style: context.textStyles.titleWhite,
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                inputFormatters: [
                  InputFormatter.instance.cepFormatter,
                ],
                controller: _cepEC,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  labelText: 'CEP',
                ),
                validator: Validatorless.required('Campo obrigatório'),
              ),
            ),
            const SizedBox(width: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: context.colors.secondary,
              ),
              onPressed: () async {
                final result = await cepService.getAddress(_cepEC.text);
                setState(() {
                  _logradouroEC.text = result['logradouro'];
                  _bairroEC.text = result['bairro'];
                  _localidadeEC.text = result['localidade'];
                  _ufEC.text = result['uf'];
                });
              },
              child: const Text('Buscar'),
            )
          ],
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: _logradouroEC,
          decoration: const InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.never,
            labelText: 'Endereço',
          ),
          validator: Validatorless.required('Campo obrigatório'),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: _numeroEC,
                decoration: const InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  labelText: 'Número',
                ),
                validator: Validatorless.required('Campo obrigatório'),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextFormField(
                controller: _bairroEC,
                decoration: const InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  labelText: 'Bairro',
                ),
                validator: Validatorless.required('Campo obrigatório'),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: _localidadeEC,
                decoration: const InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  labelText: 'Cidade',
                ),
                validator: Validatorless.required('Campo obrigatório'),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextFormField(
                controller: _ufEC,
                decoration: const InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  labelText: 'Estado',
                ),
                validator: Validatorless.required('Campo obrigatório'),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _gender() {
    return DropdownButtonFormField<String>(
      value: _genderValue,
      onChanged: (value) {
        setState(
          () {
            _genderValue = value!;
          },
        );
      },
      items: genres
          .map<DropdownMenuItem<String>>(
            (String gender) => DropdownMenuItem<String>(
              value: gender,
              child: Text(gender),
            ),
          )
          .toList(),
    );
  }
}
