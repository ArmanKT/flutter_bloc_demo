part of 'internet_bloc_bloc.dart';

abstract class InternetBlocState extends Equatable {
  const InternetBlocState();

  @override
  List<Object> get props => [];
}

class InternetBlocInitial extends InternetBlocState {}

class InternetGainState extends InternetBlocState {}

class InternetLostState extends InternetBlocState {}
