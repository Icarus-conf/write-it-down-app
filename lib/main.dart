import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo_c10_sat_route/firebase_options.dart';
import 'package:todo_c10_sat_route/pages/auth/login_or_register.dart';
import 'package:todo_c10_sat_route/pages/auth/pages/login_page.dart';
import 'package:todo_c10_sat_route/pages/auth/pages/register_page.dart';
import 'package:todo_c10_sat_route/pages/home_page.dart';
import 'package:todo_c10_sat_route/pages/tabs/settings_tab.dart';
import 'package:todo_c10_sat_route/pages/tabs/tasks_tab.dart';

import 'package:todo_c10_sat_route/provider.dart/my_provider.dart';
import 'package:todo_c10_sat_route/theme/theme.dart';
import 'package:todo_c10_sat_route/widgets/edit_task.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    ChangeNotifierProvider(
      create: (context) => MyProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var auth = Provider.of<MyProvider>(context);
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      initialRoute: auth.firebaseUser != null
          ? HomePage.routeName
          : LoginOrRegister.routeName,
      locale: Locale(Provider.of<MyProvider>(context).locale),
      theme: Provider.of<MyProvider>(context).themeData,
      darkTheme: darkMode,
      routes: {
        HomePage.routeName: (context) => const HomePage(),
        TasksTab.routeName: (context) => const TasksTab(),
        SettingsTab.routeName: (context) => const SettingsTab(),
        LoginPage.routeName: (context) => LoginPage(),
        RegisterPage.routeName: (context) => RegisterPage(),
        LoginOrRegister.routeName: (context) => const LoginOrRegister(),
        EditTask.routeName: (context) => const EditTask(),
      },
    );
  }
}
