import 'package:flutter/material.dart';

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
    return Column(
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
    );
  }
}
