import 'package:clean_architecture_with_bloc/config/routes/routes_name.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed(RoutesName.homeScreen);
          },
          child: Text("Go to Home"),
        ),
      ),
    );
  }
}
