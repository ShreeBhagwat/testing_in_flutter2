import 'package:flutter/material.dart';
import 'package:testing_in_flutter2/constants.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
   // Create a scaffold which has home screen text in center and app bar which says home screen
    return Scaffold(
      appBar: AppBar(
        title: const Text(
        
          'Home Screen'),
      ),
      body: const Center(
        child: Text('Home Screen', key: homeScreenTextKey,),
      ),
    );
  }
}