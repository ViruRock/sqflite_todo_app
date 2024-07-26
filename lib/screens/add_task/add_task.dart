import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/show_app_bar.dart';
import '../../widgets/show_bg_filled_button.dart';
import '../home/model/task_model.dart';
import '../home/view_model/task_vm.dart';

class AddTaskScreen extends StatefulWidget {
  static const String routeName = 'add_task_screen';
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final TextEditingController _titleController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showAppBar(title: "Add Task"),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
          child: ListView(
            shrinkWrap: true,
            children: [
              TextFormField(
                controller: _titleController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Title should not be empty.";
                  } else if (value.startsWith(" ")) {
                    return "Title should not with space.";
                  } else {
                    return null;
                  }
                },
                decoration: showInputDecoration(),
              ),
              const SizedBox(height: 28),
              showBgFilledButton(
                btnText: "Submit",
                onPressed: () {
                  if (!_formKey.currentState!.validate()) {
                    return;
                  }

                  Provider.of<TaskProvider>(context, listen: false).addTasks(
                    TaskModel(
                      title: _titleController.text,
                      completed: false,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  showInputDecoration() {
    return const InputDecoration(
      hintText: "Type Here",
      label: Text.rich(
        TextSpan(
          text: "Title",
          children: [
            TextSpan(
              text: "*",
              style: TextStyle(color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
