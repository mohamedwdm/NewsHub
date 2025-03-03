import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";

import "package:news_app/services/theme_service.dart";

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = lightMode;
  IconData _icon = CupertinoIcons.moon_stars; // Default icon is moon


  ThemeData get themeData => _themeData;
  IconData get icon => _icon; // Expose icon state


  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
      _icon = CupertinoIcons.sun_max; // Change to sun icon

    } else {
      themeData = lightMode;
      _icon = CupertinoIcons.moon_stars; // Change to moon icon

    }
  }
}
