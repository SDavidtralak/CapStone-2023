// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../views/workout_view.dart';

class Workoutdisplay extends StatelessWidget {
  final ImageProvider image;
  final String label;
  const Workoutdisplay({
    Key? key,
    required this.image,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WorkoutView(),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            image: image,
            width: 120,
            height: 120,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10),
          Text(label),
        ],
      ),
    );
  }
}
