// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, no_leading_underscores_for_local_identifiers

import 'package:capstone_project/DB/DB.dart';
import 'package:capstone_project/views/home.dart';
import 'package:capstone_project/widgets/row_diaplay.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sql_conn/sql_conn.dart';

import '../widgets/back_home.dart';
import '../widgets/list_builder.dart';
import 'exercise_view.dart';

List<String> exerciseName = [];

class WorkoutView extends StatefulWidget {
  const WorkoutView(
      {super.key,
      required this.image,
      required this.index,
      required this.name});

  final ImageProvider image;
  final int index;
  final String name;

  @override
  State<WorkoutView> createState() => _WorkoutViewState();
}

class _WorkoutViewState extends State<WorkoutView> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    var dbHelper = DB();
    List<String> _exerciseName =
        await dbHelper.getWorkoutExerciseName(widget.index);
    setState(() {
      exerciseName = _exerciseName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .63,
            color: Color.fromARGB(131, 233, 30, 98).withOpacity(.74),
          ),
          SafeArea(
            child: RefreshIndicator(
              onRefresh: () async {
                await Future.delayed(Duration(milliseconds: 1500));
                setState(() {
                  getData();
                });
              },
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Container(
                      clipBehavior: Clip.antiAlias,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withOpacity(0),
                            Colors.black.withOpacity(0.59),
                            Colors.black.withOpacity(0.79),
                            Colors.black.withOpacity(1)
                          ],
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 40),
                        child: Column(
                          children: [
                            BackHome(),
                            Container(
                              decoration: BoxDecoration(boxShadow: [
                                BoxShadow(
                                  color: Colors.black26.withOpacity(1),
                                  offset: Offset(0, 20),
                                  blurRadius: 32,
                                  spreadRadius: 16,
                                )
                              ]),
                              child: Image(
                                image: widget.image,
                                width: MediaQuery.of(context).size.width - 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(height: 16),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //change to have name injected by database
                                  Text(
                                    widget.name,
                                    style: Theme.of(context).textTheme.caption,
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Row(
                                    children: [
                                      Image(
                                        image: AssetImage(
                                            "assets/Placeholder.jpg"),
                                        height: 32,
                                        width: 32,
                                      ),
                                      SizedBox(width: 10),
                                      Text("Liftcitl")
                                    ],
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  //pulled total count of exercise through database to list count
                                  Text(
                                    exerciseName.length
                                        .toString(), // change to amount of exercises in workout
                                    style: Theme.of(context).textTheme.caption,
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ExerciseView(
                                            Name: exerciseName[0],
                                          ),
                                        ),
                                      );
                                    },
                                    child: Stack(
                                      clipBehavior: Clip.none,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(Icons.swap_vert),
                                            SizedBox(
                                              width: 16,
                                            ),
                                            Icon(Icons.more_horiz_rounded)
                                          ],
                                        ),
                                        Positioned(
                                          right: 0,
                                          bottom: 0,
                                          child: Container(
                                            width: 64,
                                            height: 64,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.blueAccent,
                                            ),
                                            child: Icon(
                                              Icons.view_day,
                                              size: 38,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Column(
                                    children: [
                                      ListDisplay(
                                        textDisplay: exerciseName,
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.black,
                      height: 500,
                    ),
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
