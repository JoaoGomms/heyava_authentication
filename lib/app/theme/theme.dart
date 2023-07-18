import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
    textTheme: textTheme, iconTheme: const IconThemeData(color: Colors.blue));

const TextTheme textTheme = TextTheme(
    titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.normal),
    bodyLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
    bodyMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
    bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.normal));
