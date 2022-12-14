import 'dart:developer';

import 'package:dio/dio.dart';

class CepService {
  static CepService? _instance;

  CepService._();
  static CepService get instance {
    _instance ??= CepService._();
    return _instance!;
  }

  Future<dynamic> getAddress(String cep) async {
    try {
      final response = await Dio().get("https://viacep.com.br/ws/$cep/json/");
      if (response.statusCode == 200) {
        return response.data;
      } else {
        return null;
      }
    } catch (e, s) {
      log('Erro ao buscar endereco', error: e, stackTrace: s);
      throw Exception();
    }
  }
}
