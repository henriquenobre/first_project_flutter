import 'package:first_project/components/task.dart';
import 'package:flutter/material.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({Key? key, required Widget child})
      : super(key: key, child: child);

  final List<Task> taskList = [
    const Task('Aprender FLutter', 'assets/images/flutter.png', 3),
    const Task('Dart', 'assets/images/book.jpg', 5),
    const Task('Material', 'assets/images/bike.jpg', 1),
  ];

  void newTask(String name, String photo, int difficulty) {
    print('entrou');
    taskList.add(Task(name, photo, difficulty));
  }

  static TaskInherited? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TaskInherited>();
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}
