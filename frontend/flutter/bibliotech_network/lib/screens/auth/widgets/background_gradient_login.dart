import 'package:flutter/material.dart';

class LoginGradient extends StatelessWidget {
  const LoginGradient({super.key});

  @override
  Widget build(BuildContext context) {
    const List<Color> colors = [
      Color(0xFF0F172A), // Slate 900
            Color(0xFF1E293B), // Slate 800
            Color(0xFF1E3A8A), // Azul profundo
    ];
    const List<double> stops = [ 0.3, 0.6, 0.9];
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: colors,
          stops: stops,
        ),
      ),
    );
  }
}