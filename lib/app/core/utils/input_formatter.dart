import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class InputFormatter {
  static InputFormatter? _instance;

  InputFormatter._();
  static InputFormatter get instance {
    _instance ??= InputFormatter._();
    return _instance!;
  }

  MaskTextInputFormatter get birthDateFormatter => MaskTextInputFormatter(
        mask: '##/##/####',
        filter: {"#": RegExp(r'[0-9]')},
      );

  MaskTextInputFormatter get cpfFormatter => MaskTextInputFormatter(
        mask: '###.###.###-##',
        filter: {"#": RegExp(r'[0-9]')},
      );

  MaskTextInputFormatter get phoneFormatter => MaskTextInputFormatter(
        mask: '(##) #####-####',
        filter: {"#": RegExp(r'[0-9]')},
      );

  MaskTextInputFormatter get cepFormatter => MaskTextInputFormatter(
        mask: '#####-###',
        filter: {"#": RegExp(r'[0-9]')},
      );
}
