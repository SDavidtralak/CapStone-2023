// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, unnecessary_null_comparison

import 'package:capstone_project/model/liftcitl.dart';
import 'package:capstone_project/views/exercise_view.dart';
import 'package:capstone_project/views/workout_view.dart';
import 'package:capstone_project/widgets/row_diaplay.dart';
import 'package:flutter/material.dart';

class WorkoutList extends StatelessWidget {
  final List<Workouts> textDisplay;

  final List imagePath;

  const WorkoutList({
    Key? key,
    required this.textDisplay,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: textDisplay == null ? 0 : textDisplay.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => WorkoutView(
                  image: AssetImage(imagePath[index]),
                  index: index,
                  name: textDisplay[index].Workout_name.toString(),
                ),
              ),
            );
          },
          child: RowDispaly(
            image: AssetImage(imagePath[index]),
            label: textDisplay[index].Workout_name.toString(),
            height: 68,
            width: 48,
          ),
        );
      },
    );
  }
}
