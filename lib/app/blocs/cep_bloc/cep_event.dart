// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'cep_bloc.dart';

abstract class CepEvent {}

class LoadCepEvent extends CepEvent {}

class SearchingCepEvent extends CepEvent {
  final String cep;

  SearchingCepEvent({required this.cep});
}

class ErrorCepEvent extends CepEvent {}
