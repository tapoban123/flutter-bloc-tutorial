import 'package:clean_architecture_with_bloc/config/routes/routes.dart';
import 'package:clean_architecture_with_bloc/config/routes/routes_name.dart';
import 'package:clean_architecture_with_bloc/views/splash/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Clean Architecture",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true),
      initialRoute: RoutesName.splashScreen,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
