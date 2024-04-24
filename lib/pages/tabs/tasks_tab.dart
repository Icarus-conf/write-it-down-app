import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:todo_c10_sat_route/components/app_colors.dart';

import 'package:todo_c10_sat_route/firebase_functions.dart';
import 'package:todo_c10_sat_route/models/task_model.dart';

import 'package:todo_c10_sat_route/widgets/task_tile.dart';

class TasksTab extends StatefulWidget {
  static const String routeName = 'TasksTab';
  const TasksTab({super.key});

  @override
  State<TasksTab> createState() => _TasksTabState();
}

class _TasksTabState extends State<TasksTab> {
  var _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
              ),
              padding: const EdgeInsets.all(8),
              child: DatePicker(
                DateTime.now(),
                height: 100,
                initialSelectedDate: _selectedDate,
                selectionColor: AppColors.primaryColor,
                selectedTextColor: Colors.white,
                onDateChange: (date) {
                  // New date selected
                  setState(() {
                    _selectedDate = date;
                  });
                },
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Expanded(
          child: StreamBuilder(
            stream: FirebaseFunctions.getTasks(_selectedDate),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasError) {
                return const Center(
                  child: Text('Something went wrong'),
                );
              }

              List<TaskModel> tasks =
                  snapshot.data?.docs.map((doc) => doc.data()).toList() ?? [];

              tasks = tasks.reversed.toList();

              if (tasks.isEmpty) {
                return const Center(
                  child: Text('No tasks yet'),
                );
              }

              return ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return TaskTile(taskModel: tasks[index]);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
