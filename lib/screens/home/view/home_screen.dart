import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/constants.dart';
import '../../../utils/show_loader.dart';
import '../../../widgets/show_app_bar.dart';
import '../../add_task/add_task.dart';
import '../model/task_model.dart';
import '../view_model/task_vm.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<TaskProvider>(context, listen: false).loadTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showAppBar(title: "Home Screen"),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => Navigator.pushNamed(
          context,
          AddTaskScreen.routeName,
        ),
      ),
      body: Consumer<TaskProvider>(
        builder: (ctx, data, widget) {
          return data.responseState == RequestResponseState.dataReceived
              ? Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: data.taskModelList.length,
                      itemBuilder: (ctx, pos) {
                        final TaskModel taskData = data.taskModelList[pos];

                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Dismissible(
                            background: Container(
                              color: Colors.redAccent,
                              padding: const EdgeInsets.all(8),
                              margin: const EdgeInsets.all(8),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    const Icon(Icons.delete,
                                        color: Colors.white),
                                    const SizedBox(width: 20),
                                    Text(
                                      'Delete',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              // child: Icon(Icons.delete),
                            ),
                            direction: DismissDirection.endToStart,
                            confirmDismiss: (direction) async {
                              if (direction == DismissDirection.endToStart) {
                                bool confirmed = await showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text('Alert'),
                                      content: const Text(
                                          'Are you sure you want to delete the task?'),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.of(context).pop(false),
                                          child: const Text('No'),
                                        ),
                                        TextButton(
                                          onPressed: () => Navigator.of(context)
                                              .pop(true),
                                          child: const Text('Yes'),
                                        ),
                                      ],
                                    );
                                  },
                                );

                                return confirmed;
                              }

                              return false;
                            },
                            onDismissed: (direction) {
                              if (direction == DismissDirection.endToStart) {
                                data.deleteTasks(taskData.id ?? 0);
                              }
                            },
                            key: Key(pos.toString()),
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CheckboxListTile(
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 12),
                                  title: Text(
                                    taskData.title,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(color: Colors.black),
                                  ),
                                  value: taskData.completed,
                                  onChanged: (bool? value) {
                                    TaskModel updatedTask = TaskModel(
                                      id: taskData.id,
                                      title: taskData.title,
                                      completed: value ?? false,
                                      timestamp: taskData.timestamp,
                                    );

                                    data.updateTasks(updatedTask);
                                  },
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                )
              : data.responseState == RequestResponseState.noData
                  ? Center(
                      child: Text(
                        "No task available",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    )
                  : data.responseState == RequestResponseState.loading
                      ? linearLoader()
                      : const SizedBox();
        },
      ),
    );
  }
}
