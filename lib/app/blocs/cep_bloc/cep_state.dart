// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'cep_bloc.dart';

abstract class CepState {}

class CepSuccess implements CepState {
  final Map data;

  CepSuccess({required this.data});
}

class CepInitial implements CepState {
  const CepInitial();
}

class CepLoading implements CepState {
  const CepLoading();
}

class CepError implements CepState {
  final String? errorMessage;

  CepError(this.errorMessage);
}
