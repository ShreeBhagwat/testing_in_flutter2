import 'package:flutter/material.dart';
import 'package:testing_in_flutter2/login_screen.dart';

void main() {
  runApp(const TestingInFlutter());
}

class TestingInFlutter extends StatelessWidget {
  const TestingInFlutter({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
    );
  }
}
