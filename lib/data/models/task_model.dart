
import 'package:hive/hive.dart';

part "task_model.g.dart";

@HiveType(typeId: 0)
class TaskModel {
  @HiveField(0)
  final String title;
  
  @HiveField(1)
  String? description;
  
  @HiveField(2)
  final DateTime taskTime;
  
  @HiveField(3)
  bool completed;



  TaskModel({required this.title, this.description, required this.taskTime, required this.completed});

  TaskModel copyWith({
    String? title,
    String? description,
    bool? completed,
    DateTime? taskTime
  }) {
    return TaskModel(
      title: title ?? this.title,
      description: description ?? this.description,
      completed: completed ?? this.completed, taskTime: taskTime ?? this.taskTime,
    );
  }

}

