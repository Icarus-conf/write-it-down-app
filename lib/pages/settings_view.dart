import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_c10_sat_route/config/firebase_functions.dart';
import 'package:todo_c10_sat_route/pages/auth/login_or_register.dart';
import 'package:todo_c10_sat_route/provider.dart/my_provider.dart';

class SettingsView extends StatefulWidget {
  static const String routeName = 'SettingsView';
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  String selectedLanguage = 'English';
  ThemeMode selectedTheme = ThemeMode.light;
  var modeValue = 0;
  var langValue = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Language',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              color: Theme.of(context).primaryColor,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: DropdownButton(
                underline: const SizedBox.shrink(),
                value: langValue,
                items: [
                  DropdownMenuItem(
                    value: 0,
                    onTap: () => provider.changeLang('en'),
                    child: const Text('English'),
                  ),
                  DropdownMenuItem(
                    value: 1,
                    onTap: () => provider.changeLang('ar'),
                    child: const Text('Arabic'),
                  ),
                ],
                onChanged: (value) {
                  langValue = value!;
                  setState(() {});
                },
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const Text(
              'Mode',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              color: Theme.of(context).primaryColor,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: DropdownButton(
                underline: const SizedBox.shrink(),
                value: modeValue,
                items: [
                  DropdownMenuItem(
                    value: 0,
                    onTap: () => AdaptiveTheme.of(context).setLight(),
                    child: const Text('Light'),
                  ),
                  DropdownMenuItem(
                    value: 1,
                    onTap: () => AdaptiveTheme.of(context).setDark(),
                    child: const Text('Dark'),
                  ),
                ],
                onChanged: (value) {
                  modeValue = value!;
                  setState(() {});
                },
              ),
            ),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  FirebaseFunctions.logOut();
                  Navigator.pushNamedAndRemoveUntil(
                      context, LoginOrRegister.routeName, (route) => false);
                },
                child: const Text(
                  'Sign out',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
