import 'package:equatable/equatable.dart';

abstract class SwitchEvents extends Equatable {
  const SwitchEvents();

  @override
  List<Object?> get props => [];
}

class EnableOrDisableNotifications extends SwitchEvents {}

class ChangeSliderValue extends SwitchEvents {
  final double sliderValue;

  const ChangeSliderValue({required this.sliderValue});

  @override
  List<Object?> get props => [sliderValue];
}
