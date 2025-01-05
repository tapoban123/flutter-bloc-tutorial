import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_tutorial/blocs/counter_bloc/counter_event.dart';
import 'package:flutter_bloc_tutorial/blocs/counter_bloc/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState()) {
    on<IncrementCounter>(_incrementCounter);
    on<DecrementCounter>(_decrementCounter);
  }

  void _incrementCounter(
    IncrementCounter event,
    Emitter<CounterState> emit,
  ) {
    emit(state.copyWith(counter: state.counter + 1));
  }

  void _decrementCounter(
    DecrementCounter event,
    Emitter<CounterState> emit,
  ) {
    if (state.counter > 0) {
      emit(state.copyWith(counter: state.counter - 1));
    }
  }
}
