import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/blocs/counter_bloc/counter_bloc.dart';
import 'package:flutter_bloc_tutorial/blocs/switch_bloc/switch_bloc.dart';
import 'package:flutter_bloc_tutorial/counter_app/ui/counter_screen.dart';
import 'package:flutter_bloc_tutorial/muti_state_app/ui/multi_state_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => CounterBloc(),
        ),
        BlocProvider(
          create: (_) => SwitchBloc(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Bloc Tutorial',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(centerTitle: true),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MultiStateApp(),
      ),
    );
  }
}
