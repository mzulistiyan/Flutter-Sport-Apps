import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_sport_apps/models/olahraga_model.dart';
import 'package:flutter_application_sport_apps/services/olahraga_service.dart';

part 'olahraga_state.dart';

class OlahragaCubit extends Cubit<OlahragaState> {
  OlahragaCubit() : super(OlahragaInitial());

  void createOlahraga(
    OlahragaModel transaction,
  ) async {
    try {
      emit(OlahragaLoading());
      await OlahragaService().createOlahraga(
        transaction,
      );
      emit(OlahragaSuccess(const []));
    } catch (e) {
      emit(OlahragaFailed(e.toString()));
    }
  }

  void fetchFod() async {
    try {
      emit(OlahragaLoading());

      List<OlahragaModel> foods = await OlahragaService().fetchOlahraga();

      emit(OlahragaSuccess(foods));
    } catch (e) {
      emit(OlahragaFailed(e.toString()));
    }
  }
}
