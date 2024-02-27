import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_c10_sat_route/pages/home_page.dart';
import 'package:todo_c10_sat_route/pages/tabs/settings_tab.dart';
import 'package:todo_c10_sat_route/pages/tabs/tasks_tab.dart';
import 'package:todo_c10_sat_route/provider.dart/my_provider.dart';
import 'package:todo_c10_sat_route/theme/theme.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => MyProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.routeName,
      theme: Provider.of<MyProvider>(context).themeData,
      darkTheme: darkMode,
      routes: {
        HomePage.routeName: (context) => const HomePage(),
        TasksTab.routeName: (context) => const TasksTab(),
        SettingsTab.routeName: (context) => const SettingsTab(),
      },
    );
  }
}
