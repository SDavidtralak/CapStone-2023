// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, no_leading_underscores_for_local_identifiers

import 'package:capstone_project/DB/DB.dart';
import 'package:capstone_project/model/liftcitl.dart';
import 'package:capstone_project/widgets/list_builder.dart';
import 'package:capstone_project/widgets/workout_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

List<Workouts> exerciseName = [];
List<String> imagePath = [
  'assets/Workout1.jpg',
  'assets/Workout2.jpg',
  'assets/Workout3.jpg',
  'assets/Workout4.jpg',
  'assets/Workout5.jpg',
  'assets/Workout6.jpg',
  'assets/Workout7.jpg'
];

class LibraryView extends StatefulWidget {
  const LibraryView({super.key});

  @override
  State<LibraryView> createState() => _LibraryViewState();
}

class _LibraryViewState extends State<LibraryView> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    var dbHelper = DB();
    List<Workouts> _exerciseName = await dbHelper.getWorkoutName();
    setState(() {
      exerciseName = _exerciseName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topLeft,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .63,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 185, 27, 88).withOpacity(.50),
            ),
          ),
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromARGB(136, 27, 27, 27).withOpacity(0.0),
                    Color.fromARGB(110, 0, 0, 0).withOpacity(0.9),
                    Color.fromARGB(255, 0, 0, 0).withOpacity(0.89),
                    Colors.black.withOpacity(0.9),
                    Colors.black.withOpacity(1),
                  ],
                ),
              ),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Your Library",
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.library_books,
                          size: 30,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    WorkoutList(
                      textDisplay: exerciseName,
                      imagePath: imagePath,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
