import 'package:flutter/material.dart';
import '../utils/constants.dart';

class GameScreen2 extends StatelessWidget {
  const GameScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(title: const Text('Game 2')),
      body: const Center(child: Text('Game 2')),
    );
  }
}
