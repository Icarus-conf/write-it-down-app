import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_c10_sat_route/components/app_colors.dart';
import 'package:todo_c10_sat_route/firebase_functions.dart';
import 'package:todo_c10_sat_route/pages/auth/login_or_register.dart';

import 'package:todo_c10_sat_route/pages/tabs/settings_tab.dart';
import 'package:todo_c10_sat_route/pages/tabs/tasks_tab.dart';
import 'package:todo_c10_sat_route/provider.dart/my_provider.dart';
import 'package:todo_c10_sat_route/widgets/add_task.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatefulWidget {
  static const String routeName = 'HomePage';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var auth = Provider.of<MyProvider>(context);
    return Scaffold(
      key: _scaffoldKey,
      extendBody: true,
      drawer: Drawer(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: DrawerHeader(
                decoration: const BoxDecoration(
                  color: AppColors.primaryColor,
                ),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage:
                          NetworkImage(auth.userModel?.imageUrl ?? ''),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 10,
                      ),
                      child: Column(
                        children: [
                          Text(
                            '${auth.userModel?.userName} ',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            '${auth.userModel?.email} ',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, HomePage.routeName);
              },
              child: const ListTile(
                leading: Icon(Icons.home_outlined),
                title: Text('Home'),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, SettingsView.routeName);
              },
              child: ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Settings'),
                onTap: () {
                  Navigator.pushNamed(context, SettingsView.routeName);
                },
              ),
            ),
            const Spacer(),
            const Divider(
              color: Colors.black45,
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                FirebaseFunctions.logOut();
                Navigator.pushNamed(context, LoginOrRegister.routeName);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        toolbarHeight: 80,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: InkWell(
            onTap: () => _scaffoldKey.currentState?.openDrawer(),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: CircleAvatar(
                backgroundImage: NetworkImage(auth.userModel?.imageUrl ?? ''),
              ),
            ),
          ),
        ),
        title: Row(
          children: [
            Text(
              '${AppLocalizations.of(context)!.appName} ',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w300,
              ),
            ),
            Text(
              '${auth.userModel?.userName} ',
              style: const TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 50.0,
          horizontal: 20,
        ),
        child: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) {
                return SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: const AddTask(),
                  ),
                );
              },
            );
            setState(() {});
          },
          backgroundColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
            side: const BorderSide(
              color: Colors.white,
              width: 3,
            ),
          ),
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
      body: const TasksTab(),
    );
  }
}
