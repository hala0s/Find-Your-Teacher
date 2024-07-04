import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'app_state_bloc.dart';
import 'app_state_bloc.dart';

part 'app_state_event.dart';
part 'app_state_state.dart';

class AppStateBloc extends Bloc<AppStateEvent, BlocStateData> {
  AppStateBloc() : super(BlocStateData.init()) {
    on<AppStateEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
