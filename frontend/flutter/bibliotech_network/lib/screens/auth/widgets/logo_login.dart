import 'package:flutter/material.dart';

class LogoLogin extends StatelessWidget {
  const LogoLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Image.asset('assets/logo.png', fit: BoxFit.cover),
    );
  }
}


