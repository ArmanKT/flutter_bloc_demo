part of 'internet_bloc_bloc.dart';

abstract class InternetBlocEvent extends Equatable {
  const InternetBlocEvent();

  @override
  List<Object> get props => [];
}

class InternetBlocGainedEvent extends InternetBlocEvent {}

class InternetBlocLostEvent extends InternetBlocEvent {}
