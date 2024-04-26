import 'package:flutter/material.dart';

class ThemeSettings{
  static ThemeData lightTheme(context){
    final theme=ThemeData.light().copyWith(
      colorScheme: Theme.of(context).colorScheme.copyWith(
        primary: Colors.red,
      )
    );
    return theme;
  }
  static ThemeData darkTheme(context){
    final theme=ThemeData.dark().copyWith(
      colorScheme: Theme.of(context).colorScheme.copyWith(
        primary: const Color.fromARGB(255, 3, 54, 95),
      ),
    );
    return theme;
  }
}