import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_c10_sat_route/firebase_functions.dart';
import 'package:todo_c10_sat_route/models/user_model.dart';
import 'package:todo_c10_sat_route/theme/theme.dart';

class MyProvider extends ChangeNotifier {
  ThemeData themeData = AppThemes.lightMode;

  String locale = 'en';

  bool get isDarkMode => themeData == AppThemes.darkMode;

  changeTheme(ThemeData theme) {
    themeData = theme;
    notifyListeners();
  }

  changeLang(String localeCode) {
    locale = localeCode;
    notifyListeners();
  }

  User? firebaseUser;
  UserModel? userModel;

  MyProvider() {
    firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      initUser();
    }
  }

  initUser() async {
    userModel = await FirebaseFunctions.readUser();
    notifyListeners();
  }
}
