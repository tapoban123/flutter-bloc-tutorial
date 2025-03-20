import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/blocs/switch_bloc/switch_bloc.dart';
import 'package:flutter_bloc_tutorial/blocs/switch_bloc/switch_events.dart';
import 'package:flutter_bloc_tutorial/blocs/switch_bloc/switch_states.dart';

class MultiStateApp extends StatelessWidget {
  const MultiStateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Multiple States Bloc Example"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Notifications"),
                BlocBuilder<SwitchBloc, SwitchStates>(
                  buildWhen: (previous, current) {
                    return previous.isSwitch != current.isSwitch;
                  },
                  builder: (context, state) => Switch(
                    value: state.isSwitch,
                    onChanged: (changedValue) {
                      context
                          .read<SwitchBloc>()
                          .add(EnableOrDisableNotifications());
                    },
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            BlocBuilder<SwitchBloc, SwitchStates>(
              builder: (context, state) => Container(
                height: 200,
                color: Colors.red.withOpacity(state.sliderValue),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            BlocBuilder<SwitchBloc, SwitchStates>(
              buildWhen: (previous, current) => previous.sliderValue != current.sliderValue,
              builder: (context, state) => Slider(
                value: state.sliderValue,
                onChanged: (changedValue) {
                  context
                      .read<SwitchBloc>()
                      .add(ChangeSliderValue(sliderValue: changedValue));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
