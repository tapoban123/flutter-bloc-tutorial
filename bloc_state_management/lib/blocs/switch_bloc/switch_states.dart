import 'package:equatable/equatable.dart';

class SwitchStates extends Equatable {
  final bool isSwitch;
  final double sliderValue;

  const SwitchStates({
    this.isSwitch = false,
    this.sliderValue = 1.0,
  });

  @override
  List<Object?> get props => [isSwitch, sliderValue];

  SwitchStates copyWith({
    bool? isSwitch,
    double? sliderValue,
  }) {
    return SwitchStates(
      isSwitch: isSwitch ?? this.isSwitch,
      sliderValue: sliderValue ?? this.sliderValue,
    );
  }
}
