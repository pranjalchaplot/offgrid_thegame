import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late VideoPlayerController _controller;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/videos/splash_screen.mp4')
      ..initialize()
          .then((_) {
            setState(() {
              _isInitialized = true; // Mark as initialized
            });
            _controller.play(); // Start playback
          })
          .catchError((error) {
            debugPrint('Error initializing video: $error');
            // Navigate even if video fails (optional)
            _navigateToHome();
          });

    // Listen for video completion
    _controller.addListener(() {
      if (_controller.value.isInitialized &&
          !_controller.value.isPlaying &&
          _controller.value.position >= _controller.value.duration) {
        _navigateToHome(); // Navigate when video finishes
      }
    });
  }

  void _navigateToHome() {
    if (mounted) {
      // Ensure widget is still active
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  @override
  void dispose() {
    _controller.dispose(); // Clean up the controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
            _isInitialized
                ? SizedBox.expand(
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: SizedBox(
                      width: _controller.value.size.width,
                      height: _controller.value.size.height,
                      child: VideoPlayer(_controller),
                    ),
                  ),
                )
                : const CircularProgressIndicator(), // Show loading until ready
      ),
    );
  }
}
