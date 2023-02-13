// ignore_for_file: prefer_const_constructors

import 'package:capstone_project/views/exercise_view.dart';
import 'package:capstone_project/widgets/row_diaplay.dart';
import 'package:flutter/material.dart';

class ListDisplay extends StatelessWidget {
  final int count;
  const ListDisplay({
    Key? key,
    required this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: count,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ExerciseView(),
              ),
            );
          },
          child: RowDispaly(
            image: AssetImage("assets/Placeholder.jpg"),
            label: "Placeholder",
            height: 68,
            width: 48,
          ),
        );
      },
    );
  }
}
