import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'internet_bloc_event.dart';
part 'internet_bloc_state.dart';

class InternetBloc extends Bloc<InternetBlocEvent, InternetBlocState> {
  StreamSubscription? connectivitySubscription;
  final Connectivity _connectivity = Connectivity();
  InternetBloc() : super(InternetBlocInitial()) {
    // on<InternetBlocEvent>((event, emit) {
    //   return emit(const InternetBlocEvent());
    // });
    on<InternetBlocGainedEvent>((event, emit) => emit(InternetGainState()));
    on<InternetBlocLostEvent>((event, emit) => emit(InternetLostState()));
    connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        add(InternetBlocGainedEvent());
      } else {
        add(InternetBlocLostEvent());
      }
    });
  }

  @override
  Future<void> close() {
    connectivitySubscription!.cancel();
    return super.close();
  }
}
