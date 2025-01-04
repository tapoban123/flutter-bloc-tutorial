import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class EquatablePackageTutorial extends StatelessWidget {
  const EquatablePackageTutorial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Problem of Dart
          const PersonWithoutEquatable person =
              PersonWithoutEquatable(name: "Arif", age: 20);
          const PersonWithoutEquatable person2 =
              PersonWithoutEquatable(name: "Arif", age: 20);

          // Both person and person2 are supposed to be equal. But they are not.
          debugPrint(
              "Result without using Equatable = ${person.hashCode == person2.hashCode}"); // False

          // Here we use equatable.
          const Person personWithEquatable = Person(name: "Meena", age: 25);
          const Person personWithEquatable2 = Person(name: "Meena", age: 25);

          debugPrint(
              "Result using Equatable = ${personWithEquatable == personWithEquatable2}"); // True
        },
      ),
    );
  }
}

class PersonWithoutEquatable {
  final String name;
  final int age;

  const PersonWithoutEquatable({
    required this.name,
    required this.age,
  });
}

class Person extends Equatable {
  final String name;
  final int age;

  const Person({
    required this.name,
    required this.age,
  });

  @override
  List<Object?> get props => [name, age];
}
