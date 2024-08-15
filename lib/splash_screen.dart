import 'package:flutter/material.dart';
import 'package:other/sign_in.dart';
import 'sign_in_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _bounceAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1), // Shortened duration
      vsync: this,
    )..forward().then((_) => _navigateToSignIn());

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut, // Smooth transition
      ),
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut, // Smooth transition
      ),
    );

    _bounceAnimation = Tween<double>(begin: 1, end: 1.1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut, // Smooth transition
      ),
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(0, 0.1), // Slightly higher start position
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut, // Smooth transition
      ),
    );
  }

  Future<void> _navigateToSignIn() async {
    await Future.delayed(Duration(milliseconds: 500), () {}); // Shortened delay
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => SignInScreen()),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: ScaleTransition(
                scale: _bounceAnimation,
                child: Text(
                  'Tech Buddy',
                  style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0B8FAC),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SlideTransition(
              position: _slideAnimation,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Powered By',
                      style: TextStyle(
                        fontSize: 26,
                        color: Color(0xFF0B8FAC),
                      ),
                    ),
                    Text(
                      'ORCA CLAN TECH',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
