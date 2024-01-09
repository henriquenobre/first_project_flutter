import 'package:first_project/components/difficulty.dart';
import 'package:flutter/material.dart';

class Task extends StatefulWidget {
  final String title;
  final String iconImage;
  final int difficulty;
  const Task(this.title, this.iconImage, this.difficulty, {Key? key})
      : super(key: key);

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int nivel = 0;
  bool assetOrImage() {
    if (widget.iconImage.contains('http')) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            color: Colors.blue,
            height: 140,
          ),
          Column(
            children: [
              Container(
                color: Colors.white,
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      color: Colors.black26,
                      width: 72,
                      height: 100,
                      child: assetOrImage()
                          ? Image.asset(
                              widget.iconImage,
                              fit: BoxFit.cover,
                            )
                          : Image.network(
                              widget.iconImage,
                              fit: BoxFit.cover,
                            ),
                    ),
                    SizedBox(
                        width: 200,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.title,
                              style: const TextStyle(fontSize: 20),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Dificulty(widget.difficulty)
                          ],
                        )),
                    SizedBox(
                      height: 70,
                      width: 70,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              )),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.blue)),
                          onPressed: () {
                            setState(() {
                              nivel++;
                            });
                          },
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.arrow_drop_up,
                                color: Colors.white,
                              ),
                              Text(
                                'UP',
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          )),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                        width: 200,
                        child: LinearProgressIndicator(
                          color: Colors.black,
                          value: (nivel / widget.difficulty) / 10,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Nível: $nivel',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
