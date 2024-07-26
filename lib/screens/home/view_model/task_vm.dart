import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
import '../../../database/database_helper.dart';
import '../../../main.dart';
import '../../../utils/show_toast.dart';
import '../model/task_model.dart';

class TaskProvider with ChangeNotifier {
  List<TaskModel> _taskModelList = [];
  List<TaskModel> get taskModelList => _taskModelList;

  RequestResponseState responseState = RequestResponseState.dataReceived;

  Future<void> loadTasks() async {
    try {
      responseState = RequestResponseState.loading;

      final db = await DatabaseHelper.instance.database;
      final List<Map<String, dynamic>> maps = await db.query(
        'todo_table',
        orderBy: 'timestamp DESC',
      );

      _taskModelList = List.generate(maps.length, (i) {
        return TaskModel(
          id: maps[i]['id'],
          title: maps[i]['title'],
          completed: maps[i]['completed'] == 1,
          timestamp: maps[i]['timestamp'],
        );
      });

      if (_taskModelList.isNotEmpty) {
        responseState = RequestResponseState.dataReceived;
      } else {
        responseState = RequestResponseState.noData;
      }

      for (TaskModel data in _taskModelList) {
        debugPrint("Data-${data.toMap().toString()}");
      }
    } catch (e) {
      debugPrint(e.toString());
      responseState = RequestResponseState.error;
    }

    notifyListeners();
  }

  Future<void> addTasks(TaskModel taskModel) async {
    try {
      FocusScope.of(navigatorKey.currentContext!).unfocus();

      final db = await DatabaseHelper.instance.database;
      await db.insert('todo_table', taskModel.toMap());

      Navigator.pop(navigatorKey.currentContext!);

      await loadTasks();

      showToast(
        message: "Task added successfully!",
        backgroundColor: Colors.green,
      );
    } catch (e) {
      showToast(message: "Something went Wrong");
    }
  }

  Future<void> updateTasks(TaskModel taskModel) async {
    try {
      final db = await DatabaseHelper.instance.database;
      await db.update(
        'todo_table',
        taskModel.toMap(),
        where: 'id = ?',
        whereArgs: [taskModel.id],
      );

      showToast(
        message: "Task Updated Successfully",
        backgroundColor: Colors.green,
      );

      await loadTasks();
    } catch (e) {
      showToast(message: "Something went Wrong");
    }
  }

  Future<void> deleteTasks(int id) async {
    try {
      final db = await DatabaseHelper.instance.database;
      await db.delete(
        'todo_table',
        where: 'id = ?',
        whereArgs: [id],
      );

      showToast(
        message: "Task Deleted Successfully",
        backgroundColor: Colors.green,
      );

      await loadTasks();
    } catch (e) {
      showToast(message: "Something went Wrong");
    }
  }
}
