// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, unnecessary_null_comparison

import 'package:capstone_project/DB/DB.dart';
import 'package:capstone_project/model/liftcitl.dart';
import 'package:capstone_project/views/new_workout.dart';
import 'package:capstone_project/views/workout_view.dart';
import 'package:capstone_project/widgets/back_home.dart';
import 'package:capstone_project/widgets/list_builder.dart';
import 'package:capstone_project/widgets/row_diaplay.dart';
import 'package:capstone_project/widgets/workout_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

List<Workouts> workoutInfo = [];
List<String> imagePath = [];
var dbHelper = DB();

class AddWorkout extends StatefulWidget {
  const AddWorkout({super.key, required this.exerciseId});

  final int exerciseId;

  @override
  State<AddWorkout> createState() => _AddWorkoutState();
}

class _AddWorkoutState extends State<AddWorkout> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    var dbHelper = DB();
    List<Workouts> _exerciseName = await dbHelper.getWorkoutName();
    setState(() {
      workoutInfo = _exerciseName;
    });
    List<String> _imagePath = await dbHelper.getWorkoutImages();
    setState(() {
      imagePath = _imagePath;
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
          RefreshIndicator(
            onRefresh: () async {
              await Future.delayed(Duration(milliseconds: 1500));
              setState(() {
                getData();
              });
            },
            child: SingleChildScrollView(
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
                      Row(
                        children: [
                          BackHome(),
                          Icon(
                            Icons.library_add,
                            size: 30,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Select Workout",
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => new_WorkoutView(),
                            ),
                          );
                        },
                        child: RowDispaly(
                          image: AssetImage("assets/WorkoutAdd.jpg"),
                          label: 'Add new Workout',
                          height: 68,
                          width: 48,
                        ),
                      ),
                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: workoutInfo == null ? 0 : workoutInfo.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              dbHelper.insertWorkoutExercise(
                                  workoutInfo[index].Workout_id,
                                  widget.exerciseId);
                              Navigator.pop(context);
                            },
                            child: RowDispaly(
                              image: AssetImage(imagePath[index]),
                              label: workoutInfo[index].Workout_name.toString(),
                              height: 68,
                              width: 48,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
