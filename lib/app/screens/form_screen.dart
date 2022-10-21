// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bemol_test/app/core/ui/styles/colors_app.dart';
import 'package:bemol_test/app/core/ui/styles/text_styles.dart';
import 'package:bemol_test/app/core/utils/input_formatter.dart';
import 'package:flutter/material.dart';
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
  final _numberEC = TextEditingController();
  final _bairroEC = TextEditingController();
  final _cidadeEC = TextEditingController();
  final _estadoEC = TextEditingController();

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
                  onPressed: () {
                    final isValid = _formKey.currentState?.validate() ?? false;
                    if (!isValid) {
                      return;
                    }
                  },
                  child: const Text('Enviar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
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
                controller: _emailEC,
                decoration: const InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  labelText: 'Email',
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
              onPressed: () {},
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
                controller: _numberEC,
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
                controller: _cidadeEC,
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
                controller: _estadoEC,
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
