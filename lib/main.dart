//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:tap2024/screens/home_screen.dart';
import 'package:tap2024/screens/intenciones_screen.dart';
import 'package:tap2024/screens/login_screen_2.dart';
import 'package:tap2024/screens/popular_screen.dart';
import 'package:tap2024/screens/splash_screen.dart';
import 'package:tap2024/settings/theme_settings.dart';
import 'package:tap2024/value_listener.dart';
//ListView, Column, Row, GridView, Stack
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ValueListener.isDark,
      builder: (context,value,child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const SplashScreen(),//SplashScreen(),PopularScreen()
          theme: value==true? ThemeSettings.darkTheme(context): ThemeSettings.lightTheme(context),
          routes: {
            "/home": (context) => const HomeScreen(),
            "/login2": (context) => const LoginScreen2(),
            "/intent": (context) => const IntencionesScreen(),
          },
        );
      }
    );
  }
}

/*class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int cont=0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Stateful vs Stateless'),
        ),
        body: Center(
          child: Text('Valor del contador $cont'),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.plus_one),
          onPressed:(){
            cont++;
            setState(() {});
          },
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  int cont=0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Stateful vs Stateless'),
        ),
        body: Center(
          child: Text('Valor del contador $cont'),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.plus_one),
          onPressed:(){
            cont++;
          },
        ),
      ),
    );
  }
}*/