import 'package:flutter/material.dart';
import '../models/game_item.dart';
import '../widgets/game_card.dart';
import '../utils/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const List<GameItem> gameItems = [
    GameItem(
      imagePath: 'assets/images/guessemoji_icon.png',
      title: 'Guess Emoji',
      route: '/game1',
    ),
    GameItem(
      imagePath: 'assets/images/guess_the _link_icon.png',
      title: 'Guess the Link',
      route: '/game2',
    ),
    // GameItem(imagePath: 'assets/game3.png', title: 'Game 3', route: '/game3'),
    // GameItem(imagePath: 'assets/game4.png', title: 'Game 4', route: '/game4'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Image.asset(
          'assets/images/off_grid_transparent.png',
          fit:
              BoxFit
                  .contain, // Ensures the image scales to fit while maintaining aspect ratio
          height:
              40, // Adjust height to fit nicely in the AppBar (tweak as needed)
        ),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 600, // Limit the grid width for better centering
            minWidth: 300, // Optional: Ensures grid doesn’t shrink too much
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.builder(
              shrinkWrap: true, // Prevents the grid from expanding infinitely
              physics:
                  const NeverScrollableScrollPhysics(), // Disable scrolling for a fixed 2x2 grid
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemCount: gameItems.length,
              itemBuilder: (context, index) {
                return GameCard(gameItem: gameItems[index]);
              },
            ),
          ),
        ),
      ),
    );
  }
}
