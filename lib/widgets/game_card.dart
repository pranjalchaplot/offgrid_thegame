import 'dart:ui';
import 'package:flutter/material.dart';
import '../models/game_item.dart';

class GameCard extends StatelessWidget {
  final GameItem gameItem;
  final double blur;
  final double dim;

  const GameCard({
    super.key,
    required this.gameItem,
    this.blur = 0.0,
    this.dim = 0.1,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, gameItem.route);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(gameItem.imagePath, fit: BoxFit.cover),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: dim),
                ),
              ),
            ),
            // Center(
            //   child: Text(
            //     gameItem.title,
            //     textAlign: TextAlign.center,
            //     style: const TextStyle(
            //       color: Colors.white,
            //       fontSize: 24,
            //       fontFamily: 'Sigmar', // Placeholder for custom font
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
