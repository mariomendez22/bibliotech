import 'package:bibliotech_network/screens/auth/widgets/background_gradient_login.dart';
import 'package:bibliotech_network/screens/auth/widgets/form_login.dart';
import 'package:bibliotech_network/screens/auth/widgets/logo_login.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          const LoginGradient(),
          Center(
            child: Container(
              padding:  const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
              margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
              constraints: const BoxConstraints(maxWidth: 500),
              child: const SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LogoLogin(),
                    SizedBox(height: 20),
                    LoginForm(),
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

