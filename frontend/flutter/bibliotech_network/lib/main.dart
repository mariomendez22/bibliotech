import 'package:bibliotech_network/screens/auth/login_screen.dart';
import 'package:bibliotech_network/screens/home/home_screen.dart';
import 'package:bibliotech_network/screens/prestamo/nuevo_prestamo_screen.dart';
import 'package:bibliotech_network/screens/prestamo/activo_prestamo_screen.dart';
import 'package:bibliotech_network/screens/prestamo/historico_prestamo_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/home': (context) => const HomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/prestamo/nuevo': (context) => const NuevoPrestamoPage(),
        '/prestamo/activos': (context) => const PrestamosActivosPage(),
        '/prestamo/historico': (context) => const HistoricoPrestamosPage(),
      },
     localizationsDelegates: const [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
          Locale('es', ''), 
      ],
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginScreen()
    );
  }
}


