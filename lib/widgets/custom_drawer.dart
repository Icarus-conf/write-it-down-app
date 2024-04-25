import 'package:flutter/material.dart';
import 'package:todo_c10_sat_route/components/app_colors.dart';
import 'package:todo_c10_sat_route/config/firebase_functions.dart';
import 'package:todo_c10_sat_route/pages/auth/login_or_register.dart';
import 'package:todo_c10_sat_route/pages/settings_view.dart';
import 'package:todo_c10_sat_route/pages/tasks_view.dart';
import 'package:todo_c10_sat_route/widgets/profile_image.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer(
      {super.key,
      required this.imageUrl,
      required this.onTap,
      required this.userName,
      required this.email});
  final String imageUrl;
  final Function()? onTap;
  final String userName;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Column(
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
                ProfileImage(
                  imageUrl: imageUrl,
                  onTap: onTap,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 10,
                  ),
                  child: Column(
                    children: [
                      Text(
                        userName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        email,
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
            Navigator.pushNamed(context, TasksView.routeName);
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
    );
  }
}
