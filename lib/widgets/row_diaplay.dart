// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class RowDispaly extends StatelessWidget {
  final AssetImage image;
  final String label;
  final double height;
  final double width;
  const RowDispaly({
    Key? key,
    required this.image,
    required this.label,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white38,
            borderRadius: BorderRadius.circular(8),
            border:
                Border.all(color: Color.fromARGB(255, 126, 64, 93), width: 3)),
        clipBehavior: Clip.antiAlias,
        child: Row(
          children: [
            Image(
              image: image,
              height: height,
              width: width,
              fit: BoxFit.cover,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              label,
              style: Theme.of(context).textTheme.bodyMedium,
            )
          ],
        ),
      ),
    );
  }
}
