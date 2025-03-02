import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/home_screen.dart';
import 'screens/game1_screen.dart';
import 'screens/game2_screen.dart';
// import 'screens/game_screen3.dart';
// import 'screens/game_screen4.dart';
import 'utils/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Off Grid Games',
      theme: ThemeData(primaryColor: primaryColor),
      initialRoute: '/splash',
      debugShowCheckedModeBanner: false,
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/home': (context) => const HomeScreen(),
        '/game1': (context) => const GameScreen1(),
        '/game2': (context) => const GameScreen2(),
        // '/game3': (context) => const GameScreen3(),
        // '/game4': (context) => const GameScreen4(),
      },
    );
  }
}
