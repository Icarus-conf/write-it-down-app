import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_c10_sat_route/provider.dart/my_provider.dart';

class SettingsTab extends StatefulWidget {
  static const String routeName = 'SettingsTab';
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  String selectedLanguage = 'English';
  ThemeMode selectedTheme = ThemeMode.light;
  var modeValue = 0;
  var langValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    onTap: () {},
                    child: const Text('English'),
                  ),
                  DropdownMenuItem(
                    value: 1,
                    onTap: () {},
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
                    onTap: () => Provider.of<MyProvider>(context, listen: false)
                        .toggleTheme(),
                    child: const Text('Light'),
                  ),
                  DropdownMenuItem(
                    value: 1,
                    onTap: () => Provider.of<MyProvider>(context, listen: false)
                        .toggleTheme(),
                    child: const Text('Dark'),
                  ),
                ],
                onChanged: (value) {
                  modeValue = value!;
                  setState(() {});
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
