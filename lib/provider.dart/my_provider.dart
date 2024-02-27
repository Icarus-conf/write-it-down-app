import 'package:flutter/material.dart';
import 'package:todo_c10_sat_route/theme/theme.dart';

class MyProvider extends ChangeNotifier {
  ThemeData themeData = lightMode;

  String locale = 'en';

  bool get isDarkMode => themeData == darkMode;

  changeTheme(ThemeData theme) {
    themeData = theme;
    notifyListeners();
  }

  changeLang(String localeCode) {
    locale = localeCode;
    notifyListeners();
  }
}
