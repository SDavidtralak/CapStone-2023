// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, unnecessary_null_comparison

import 'package:capstone_project/views/exercise_view.dart';
import 'package:capstone_project/widgets/row_diaplay.dart';
import 'package:flutter/material.dart';

class ListDisplay extends StatelessWidget {
  final List textDisplay;
  const ListDisplay({
    Key? key,
    required this.textDisplay,
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
                builder: (context) => ExerciseView(
                  Index: index,
                ),
              ),
            );
          },
          child: RowDispaly(
            image: AssetImage("assets/Placeholder.jpg"),
            label: textDisplay[index],
            height: 68,
            width: 48,
          ),
        );
      },
    );
  }
}
