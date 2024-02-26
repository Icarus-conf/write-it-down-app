import 'package:flutter/material.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  var selectedTime = DateTime.now();

  var titleController = TextEditingController();
  var desController = TextEditingController();

  var formKey = GlobalKey<FormState>();

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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            const Text('Add Task'),
            const SizedBox(
              height: 25,
            ),
            TextFormField(
              controller: titleController,
              validator: (value) {
                if (value != null) {
                  return 'Please enter a valid title';
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: 'Title',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            TextFormField(
              validator: (value) {
                if (value != null) {
                  return 'Please enter a valid text';
                }
                return null;
              },
              controller: desController,
              decoration: InputDecoration(
                hintText: 'Description',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const Align(
              alignment: AlignmentDirectional.bottomStart,
              child: Text(
                'Select Time',
              ),
            ),
            TextButton(
              onPressed: () {
                selectDate(context);
              },
              child: Text(
                selectedTime.toString().substring(0, 10),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    )),
                child: const Text(
                  'Add task',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
