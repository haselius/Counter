import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part '_event.dart';
part '_state.dart';

class CounterBloc extends Bloc<CounterEvents, int> {
  CounterBloc() : super(0);

  @override
  Stream<int> mapEventToState(
      CounterEvents event,
  ) async* {
    switch (event) {
      case CounterEvents.increment:
        yield state + 1;
        break;
      case CounterEvents.decrement:
        yield state - 1;
        break;
    }
  }
}
