import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_c10_sat_route/firebase_options.dart';
import 'package:todo_c10_sat_route/my_app.dart';
import 'package:todo_c10_sat_route/provider.dart/my_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    ChangeNotifierProvider(
      create: (context) => MyProvider()..initUser(),
      child: const MyApp(),
    ),
  );
}
