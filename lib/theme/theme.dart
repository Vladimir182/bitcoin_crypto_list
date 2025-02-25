import 'package:flutter/material.dart';

final theme = ThemeData(
  useMaterial3: false,
  scaffoldBackgroundColor: const Color.fromARGB(255, 39, 37, 37),
  textTheme: TextTheme(
    bodyMedium: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ),
    labelSmall: TextStyle(
      color: Colors.white.withValues(alpha: 0.7),
      fontSize: 14,
      fontWeight: FontWeight.w700,
    ),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: const Color.fromARGB(255, 39, 37, 37),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  listTileTheme: const ListTileThemeData(iconColor: Colors.white),
  dividerColor: Colors.white54,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.yellow,
    foregroundColor: Colors.black,
  ),
  // colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
);
