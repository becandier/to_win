import 'package:flutter/material.dart';

class AppTheme {
  ThemeData get mainTheme => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        appBarTheme: AppBarTheme(
          centerTitle: false,
          elevation: 0,
          backgroundColor: Colors.black.withValues(alpha: .2),
          titleTextStyle: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
      );
}
