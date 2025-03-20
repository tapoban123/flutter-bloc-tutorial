import 'package:flutter/material.dart';
import 'package:clean_architecture_with_bloc/data/exceptions/app_exceptions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          throw NoInternetException("");
        },
      ),
    );
  }
}
