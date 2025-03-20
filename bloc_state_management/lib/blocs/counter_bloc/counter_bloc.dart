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

  // @override
  // void onEvent(CounterEvent event) {
  //   super.onEvent(event);

  //   debugPrint("Called whenever a new event is added");
  // }

  // @override
  // void onTransition(Transition<CounterEvent, CounterState> transition) {
  //   super.onTransition(transition);

  //   debugPrint("Called after an event is added but before the change.");
  // }

  // @override
  // void onChange(Change<CounterState> change) {
  //   super.onChange(change);

  //   debugPrint("Called whenever any change occurs.");
  // }

  // @override
  // void onError(Object error, StackTrace stackTrace) {
  //   super.onError(error, stackTrace);

  //   debugPrint("Called whenever any error occurs.");
  // }
}
