import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
    appBarTheme: AppBarTheme(
    backgroundColor: Colors.blueGrey,

  ),
  colorScheme: ColorScheme.light(
    background: Colors.white,
    primary: Colors.white.withOpacity(0.8),
  ),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.grey.shade900,
    foregroundColor:  Colors.grey.shade200,


  ),
  colorScheme: ColorScheme.dark(
    background: Colors.grey.shade900,
    primary: Colors.grey.shade800,
    secondary: Colors.grey.shade900,
    

  ),
);

    // primaryColor: Colors.blueGrey.shade300,
    // appBarTheme: const AppBarTheme(),
    // dividerColor: Colors.black12,