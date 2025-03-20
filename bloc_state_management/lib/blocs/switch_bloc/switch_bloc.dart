import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/blocs/switch_bloc/switch_events.dart';
import 'package:flutter_bloc_tutorial/blocs/switch_bloc/switch_states.dart';

class SwitchBloc extends Bloc<SwitchEvents, SwitchStates> {
  SwitchBloc() : super(const SwitchStates()) {
    on<EnableOrDisableNotifications>(_enableOrDisableNotifications);
    on<ChangeSliderValue>(_changeSliderValue);
  }

  void _enableOrDisableNotifications(
      EnableOrDisableNotifications event, Emitter emit) {
    emit(state.copyWith(isSwitch: !state.isSwitch));
  }

  void _changeSliderValue(ChangeSliderValue event, Emitter emit) {
    emit(state.copyWith(sliderValue: event.sliderValue));
  }
}
