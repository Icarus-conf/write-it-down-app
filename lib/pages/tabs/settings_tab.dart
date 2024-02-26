import 'package:flutter/material.dart';

class SettingsTab extends StatefulWidget {
  static const String routeName = 'SettingsTab';
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  var dropDownValue = 'English';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Langauge',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            width: 200,
            color: Colors.white,
            child: DropdownMenu(
              width: 200,
              hintText: 'Select language',
              dropdownMenuEntries: <DropdownMenuEntry<Widget>>[
                DropdownMenuEntry(
                    value: GestureDetector(
                      onTap: () {},
                      child: const Text(
                        'English',
                      ),
                    ),
                    label: 'English'),
                DropdownMenuEntry(
                    value: GestureDetector(
                      onTap: () {},
                      child: const Text(
                        'Arabic',
                      ),
                    ),
                    label: 'Arabic'),
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          const Text(
            'Mode',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            width: 200,
            color: Colors.white,
            child: DropdownMenu(
              width: 200,
              hintText: 'Select mode',
              dropdownMenuEntries: <DropdownMenuEntry<Widget>>[
                DropdownMenuEntry(
                    value: GestureDetector(
                      onTap: () {},
                      child: const Text(
                        'Light',
                      ),
                    ),
                    label: 'Light'),
                DropdownMenuEntry(
                    value: GestureDetector(
                      onTap: () {},
                      child: const Text(
                        'Dark',
                      ),
                    ),
                    label: 'Dark'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
