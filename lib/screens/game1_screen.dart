import 'package:flutter/material.dart';
import '../utils/constants.dart';

class GameScreen1 extends StatelessWidget {
  const GameScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(title: const Text('Game 1')),
      body: const Center(child: Text('Game 1')),
    );
  }
}
