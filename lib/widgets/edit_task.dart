import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_c10_sat_route/config/firebase_functions.dart';
import 'package:todo_c10_sat_route/models/task_model.dart';

class EditTask extends StatefulWidget {
  static const String routeName = 'EditTask';
  const EditTask({super.key});

  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  var selectedTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    var taskModel = ModalRoute.of(context)!.settings.arguments as TaskModel;

    var titleController = TextEditingController();
    var desController = TextEditingController();
    var timestamp = Timestamp.now();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.appName,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * 0.7,
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: taskModel.title,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            TextFormField(
              controller: desController,
              decoration: InputDecoration(
                labelText: taskModel.description,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              'Select Time:',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Center(
              child: TextButton(
                onPressed: () {
                  selectDate(context);
                },
                child: Text(
                  selectedTime.toString().substring(0, 10),
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  TaskModel task = TaskModel(
                    id: taskModel.id,
                    userId: FirebaseAuth.instance.currentUser!.uid,
                    title: titleController.text,
                    description: desController.text,
                    date:
                        DateUtils.dateOnly(selectedTime).microsecondsSinceEpoch,
                    timestamp: timestamp,
                  );
                  FirebaseFunctions.updateTask(task);
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: const Text(
                  'Save Changes',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  selectDate(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
        context: context,
        initialDate: selectedTime,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(
          const Duration(days: 365),
        ));

    if (selectedDate != null) {
      selectedTime = selectedDate;
      setState(() {});
    }
  }
}
