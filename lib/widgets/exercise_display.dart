// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ExerciseDisplay extends StatelessWidget {
  final AssetImage image;
  final String label;
  const ExerciseDisplay({super.key, required this.image, required this.label});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      child: Column(children: [
        Image(
          image: image,
          width: 140,
          height: 140,
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.caption,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
      ]),
    );
  }
}
