import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/blocs/counter_bloc/counter_bloc.dart';
import 'package:flutter_bloc_tutorial/blocs/favorite_app_bloc/favorite_app_bloc.dart';
import 'package:flutter_bloc_tutorial/blocs/image_picker_bloc/image_picker_bloc.dart';
import 'package:flutter_bloc_tutorial/blocs/switch_bloc/switch_bloc.dart';
import 'package:flutter_bloc_tutorial/blocs/to_do_bloc/todo_bloc.dart';
import 'package:flutter_bloc_tutorial/favorite_app/ui/favorite_app.dart';
import 'package:flutter_bloc_tutorial/image_picker_app/ui/image_picker_app.dart';
import 'package:flutter_bloc_tutorial/repository/favorite_item_repository.dart';
import 'package:flutter_bloc_tutorial/utils/image_picker_utils.dart';

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
        ),
        BlocProvider(
          create: (_) => TodoBloc(),
        ),
        BlocProvider(
          create: (_) => ImagePickerBloc(ImagePickerUtils()),
        ),
        BlocProvider(
          create: (_) => FavoriteAppBloc(FavoriteItemRepository()),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Bloc Tutorial',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        theme: ThemeData(
          brightness: Brightness.dark,
          appBarTheme: const AppBarTheme(centerTitle: true),
          useMaterial3: true,
        ),
        home: const FavoriteApp(),
      ),
    );
  }
}
