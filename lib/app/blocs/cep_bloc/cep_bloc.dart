// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bemol_test/app/services/cep_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cep_event.dart';
part 'cep_state.dart';

class CepBloc extends Bloc<CepEvent, CepState> {
  final CepService cepService;

  CepBloc(this.cepService) : super(const CepInitial()) {
    on<SearchingCepEvent>(_fetchCep);
  }

  FutureOr<void> _fetchCep(
    SearchingCepEvent event,
    Emitter<CepState> emit,
  ) async {
    emit(const CepLoading());
    try {
      final response = await cepService.getAddress(event.cep);
      emit(CepSuccess(data: response));
    } catch (e) {
      emit(CepError('Ocorreu um erro ao buscar o CEP'));
    }
  }
}
