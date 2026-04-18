import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:tool_nest/config/app_storage_keys.dart';
import 'package:tool_nest/core/resources/constant.dart';
import 'package:tool_nest/data/models/task_model.dart';

//Provider for all viewModel use in task process
class TaskViewModel extends ChangeNotifier {
  final Box<TaskModel> taskBox = Hive.box<TaskModel>(AppKey.taskBox);

  final int _select = 0;
  FilterType _filter = FilterType.onGoing;


  int get select => _select;
  FilterType get filter => _filter;

  void setFilter(FilterType type) {
    _filter = type;
    notifyListeners();
  }

  List<TaskModel> get tasks {
    final allTasks = taskBox.values.toList();

    switch (_filter) {
      case FilterType.onGoing:
        return allTasks.where((task) => !task.completed).toList();
      case FilterType.completed:
        return allTasks.where((task) => task.completed).toList();
      default:
        return allTasks;
    }
  }

  void toggleRead(int key) {
    final task = taskBox.get(key);

    if (task != null) {
      final updatedTask = task.copyWith(
        completed: !task.completed,
      );
      taskBox.put(key, updatedTask); // persist change
      notifyListeners();      // this triggers UI rebuild
    }
  }


  void addTask(String title, String? desc, bool completed, String taskTime) {
    DateTime date = DateTime.parse(taskTime);
    TaskModel tasks = TaskModel(
      title: title,
      taskTime: date,
      completed: completed,
      description: desc,
    );
    taskBox.add(tasks);
    notifyListeners();
  }

  void deleteTask(int index) {
    taskBox.delete(index);
    notifyListeners();
  }

  void updateTask(dynamic key, TaskModel task) {
    taskBox.putAt(key, task);
    notifyListeners();
  }

}
