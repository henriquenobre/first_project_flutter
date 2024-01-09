import 'package:first_project/data/tasksData.dart';
import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({
    super.key,
    required this.taskContext,
  });

  final BuildContext taskContext;

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController difficultyController = TextEditingController();
  TextEditingController urlController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          backgroundColor: Colors.blue,
          title: const Text('Nova Tarefa',
              style: TextStyle(fontSize: 26, color: Colors.white)),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              height: 650,
              width: 375,
              decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 3)),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        controller: nameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Insira o nome da Tarefa';
                          }
                          return null;
                        },
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                            fillColor: Colors.white70,
                            filled: true,
                            border: OutlineInputBorder(),
                            hintText: 'Nome'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value!.isEmpty ||
                              int.tryParse(value)! > 5 ||
                              int.tryParse(value)! < 1) {
                            return 'Insira um número entre 1 e 5';
                          }
                          return null;
                        },
                        controller: difficultyController,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                            fillColor: Colors.white70,
                            filled: true,
                            border: OutlineInputBorder(),
                            hintText: 'Dificuldade'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        onChanged: (text) {
                          setState(() {});
                        },
                        keyboardType: TextInputType.url,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Insira a url da Imagem';
                          }
                          return null;
                        },
                        controller: urlController,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                            fillColor: Colors.white70,
                            filled: true,
                            border: OutlineInputBorder(),
                            hintText: 'Imagem'),
                      ),
                    ),
                    Container(
                      height: 100,
                      width: 72,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 2, color: Colors.blue)),
                      child: Image.network(
                        urlController.text,
                        errorBuilder: (BuildContext context, Object object,
                            StackTrace? stackTrace) {
                          return Image.asset(
                            'assets/images/nophoto.jpg',
                            fit: BoxFit.cover,
                          );
                        },
                        fit: BoxFit.cover,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          TaskInherited.of(widget.taskContext)!.newTask(
                              nameController.text,
                              urlController.text,
                              int.parse(difficultyController.text));
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Criando nova Tarefa!')));
                          Navigator.pop(context);
                        }
                      },
                      child: const Text('Adcionar'),
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
