import 'package:first_project/data/tasksData.dart';
import 'package:first_project/screens/form.dart';
import 'package:flutter/material.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text(
            'Tarefas',
            style: TextStyle(fontSize: 26, color: Colors.white),
          ),
        ),
        body: ListView(
          children: TaskInherited.of(context)!.taskList,
          padding: EdgeInsets.only(top: 8, bottom: 70),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (newContext) => FormScreen(taskContext: context)));
          },
          child: const Icon(Icons.add),
        ));
  }
}
