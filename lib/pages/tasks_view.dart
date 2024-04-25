import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_c10_sat_route/components/app_colors.dart';

import 'package:todo_c10_sat_route/widgets/custom_drawer.dart';
import 'package:todo_c10_sat_route/widgets/profile_image.dart';
import 'package:todo_c10_sat_route/widgets/tasks_view_body.dart';
import 'package:todo_c10_sat_route/provider.dart/my_provider.dart';
import 'package:todo_c10_sat_route/widgets/add_task.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TasksView extends StatefulWidget {
  static const String routeName = 'TasksView';
  const TasksView({super.key});

  @override
  State<TasksView> createState() => _TasksViewState();
}

class _TasksViewState extends State<TasksView> {
  int index = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var auth = Provider.of<MyProvider>(context);
    return Scaffold(
      key: _scaffoldKey,
      extendBody: true,
      drawer: Drawer(
        child: CustomDrawer(
          imageUrl: auth.userModel?.imageUrl ?? '',
          onTap: () => _scaffoldKey.currentState?.openDrawer(),
          userName: '${auth.userModel?.userName}',
          email: '${auth.userModel?.email}',
        ),
      ),
      appBar: AppBar(
        toolbarHeight: 80,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: ProfileImage(
            imageUrl: auth.userModel?.imageUrl ?? '',
            onTap: () => _scaffoldKey.currentState?.openDrawer(),
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
      body: const TasksViewBody(),
    );
  }
}
