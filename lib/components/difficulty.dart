import 'package:flutter/material.dart';

class Dificulty extends StatelessWidget {
  final int difficultyLevel;

  const Dificulty(this.difficultyLevel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star,
          color: (difficultyLevel >= 1) ? Colors.blue : Colors.blue[200],
          size: 14,
        ),
        Icon(
          Icons.star,
          color: (difficultyLevel >= 2) ? Colors.blue : Colors.blue[200],
          size: 14,
        ),
        Icon(
          Icons.star,
          color: (difficultyLevel >= 3) ? Colors.blue : Colors.blue[200],
          size: 14,
        ),
        Icon(
          Icons.star,
          color: (difficultyLevel >= 4) ? Colors.blue : Colors.blue[200],
          size: 14,
        ),
        Icon(
          Icons.star,
          color: (difficultyLevel >= 5) ? Colors.blue : Colors.blue[200],
          size: 14,
        ),
      ],
    );
  }
}
