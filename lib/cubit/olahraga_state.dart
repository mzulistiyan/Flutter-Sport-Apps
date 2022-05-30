part of 'olahraga_cubit.dart';

abstract class OlahragaState extends Equatable {
  const OlahragaState();

  @override
  List<Object> get props => [];
}

class OlahragaInitial extends OlahragaState {}

class OlahragaLoading extends OlahragaState {}

class OlahragaSuccess extends OlahragaState {
  final List<OlahragaModel> olahragas;

  OlahragaSuccess(this.olahragas);
  @override
  // TODO: implement props
  List<Object> get props => [olahragas];
}

class OlahragaFailed extends OlahragaState {
  final String error;

  OlahragaFailed(this.error);

  @override
  // TODO: implement props
  List<Object> get props => [error];
}
