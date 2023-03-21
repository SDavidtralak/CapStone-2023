// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, no_leading_underscores_for_local_identifiers

import 'dart:ui';

import 'package:capstone_project/views/workout_view.dart';
import 'package:capstone_project/widgets/exercise_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sql_conn/sql_conn.dart';

import '../widgets/row_diaplay.dart';
import '../widgets/workout_display.dart';
import '../DB/DB.dart';
import 'package:capstone_project/model/liftcitl.dart';

List<Workouts> workoutName = [];

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    var dbHelper = DB();
    List<Workouts> _workoutName = await dbHelper.getWorkoutName();
    setState(() {
      workoutName = _workoutName;
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
                    SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Recent",
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.all(30),
                      child: Row(
                        children: [
                          Workoutdisplay(
                            image: AssetImage("assets/Workout1.jpg"),
                            label: workoutName[0].Workout_name.toString(),
                            index: workoutName[0].Workout_id,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Workoutdisplay(
                            image: AssetImage("assets/Workout2.jpg"),
                            label: workoutName[1].Workout_name.toString(),
                            index: workoutName[1].Workout_id,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Workoutdisplay(
                            image: AssetImage("assets/Workout3.jpg"),
                            label: workoutName[2].Workout_name.toString(),
                            index: workoutName[2].Workout_id,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Workoutdisplay(
                            image: AssetImage("assets/Workout4.jpg"),
                            label: workoutName[3].Workout_name.toString(),
                            index: workoutName[3].Workout_id,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Workoutdisplay(
                            image: AssetImage("assets/Workout5.jpg"),
                            label: workoutName[4].Workout_name.toString(),
                            index: workoutName[4].Workout_id,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Workoutdisplay(
                            image: AssetImage("assets/Workout6.jpg"),
                            label: workoutName[5].Workout_name.toString(),
                            index: workoutName[5].Workout_id,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Welcome Back",
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Row(
                            //make grid view builder instead with presets

                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => WorkoutView(
                                        image:
                                            AssetImage("assets/Workout7.jpg"),
                                        index: workoutName[6].Workout_id,
                                        name: workoutName[6]
                                            .Workout_name
                                            .toString(),
                                      ),
                                    ),
                                  );
                                },
                                child: RowDispaly(
                                  image: AssetImage("assets/Workout7.jpg"),
                                  label: workoutName[6].Workout_name.toString(),
                                  height: 48,
                                  width: 48,
                                ),
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => WorkoutView(
                                        image:
                                            AssetImage("assets/Workout2.jpg"),
                                        index: workoutName[1].Workout_id,
                                        name: workoutName[1]
                                            .Workout_name
                                            .toString(),
                                      ),
                                    ),
                                  );
                                },
                                child: RowDispaly(
                                  image: AssetImage("assets/Workout2.jpg"),
                                  label: workoutName[1].Workout_name.toString(),
                                  height: 48,
                                  width: 48,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            //make grid view builder instead with presets

                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => WorkoutView(
                                        image:
                                            AssetImage("assets/Workout5.jpg"),
                                        index: workoutName[4].Workout_id,
                                        name: workoutName[4]
                                            .Workout_name
                                            .toString(),
                                      ),
                                    ),
                                  );
                                },
                                child: RowDispaly(
                                  image: AssetImage("assets/Workout5.jpg"),
                                  label: workoutName[4].Workout_name.toString(),
                                  height: 48,
                                  width: 48,
                                ),
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => WorkoutView(
                                        image:
                                            AssetImage("assets/Workout3.jpg"),
                                        index: workoutName[2].Workout_id,
                                        name: workoutName[2]
                                            .Workout_name
                                            .toString(),
                                      ),
                                    ),
                                  );
                                },
                                child: RowDispaly(
                                  image: AssetImage("assets/Workout3.jpg"),
                                  label: workoutName[2].Workout_name.toString(),
                                  height: 48,
                                  width: 48,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            //load presets

                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => WorkoutView(
                                        image:
                                            AssetImage("assets/Workout6.jpg"),
                                        index: workoutName[5].Workout_id,
                                        name: workoutName[5]
                                            .Workout_name
                                            .toString(),
                                      ),
                                    ),
                                  );
                                },
                                child: RowDispaly(
                                  image: AssetImage("assets/Workout6.jpg"),
                                  label: workoutName[5].Workout_name.toString(),
                                  height: 48,
                                  width: 48,
                                ),
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => WorkoutView(
                                        image:
                                            AssetImage("assets/Workout1.jpg"),
                                        index: workoutName[0].Workout_id,
                                        name: workoutName[0]
                                            .Workout_name
                                            .toString(),
                                      ),
                                    ),
                                  );
                                },
                                child: RowDispaly(
                                  image: AssetImage("assets/Workout1.jpg"),
                                  label: "Placeholder",
                                  height: 48,
                                  width: 48,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 40),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            "Based on your recent",
                            style: Theme.of(context).textTheme.headline6,
                            textAlign: TextAlign.right,
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: Row(
                            children: [
                              Workoutdisplay(
                                image: AssetImage("assets/Workout1.jpg"),
                                label: workoutName[0].Workout_name.toString(),
                                index: workoutName[0].Workout_id,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Workoutdisplay(
                                image: AssetImage("assets/Workout7.jpg"),
                                label: workoutName[6].Workout_name.toString(),
                                index: workoutName[6].Workout_id,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Workoutdisplay(
                                image: AssetImage("assets/Workout6.jpg"),
                                label: workoutName[5].Workout_name.toString(),
                                index: workoutName[5].Workout_id,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Workoutdisplay(
                                image: AssetImage("assets/Workout4.jpg"),
                                label: workoutName[3].Workout_name.toString(),
                                index: workoutName[3].Workout_id,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Workoutdisplay(
                                image: AssetImage("assets/Workout2.jpg"),
                                label: workoutName[1].Workout_name.toString(),
                                index: workoutName[1].Workout_id,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Workoutdisplay(
                                image: AssetImage("assets/Workout3.jpg"),
                                label: workoutName[2].Workout_name.toString(),
                                index: workoutName[2].Workout_id,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            "Recommended Days",
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: Row(
                            children: [
                              Workoutdisplay(
                                image: AssetImage("assets/Workout1.jpg"),
                                label: workoutName[0].Workout_name.toString(),
                                index: workoutName[0].Workout_id,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Workoutdisplay(
                                image: AssetImage("assets/Workout2.jpg"),
                                label: workoutName[1].Workout_name.toString(),
                                index: workoutName[1].Workout_id,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Workoutdisplay(
                                image: AssetImage("assets/Workout5.jpg"),
                                label: workoutName[4].Workout_name.toString(),
                                index: workoutName[4].Workout_id,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Workoutdisplay(
                                image: AssetImage("assets/Workout4.jpg"),
                                label: workoutName[3].Workout_name.toString(),
                                index: workoutName[3].Workout_id,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Workoutdisplay(
                                image: AssetImage("assets/Workout7.jpg"),
                                label: workoutName[6].Workout_name.toString(),
                                index: workoutName[6].Workout_id,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Workoutdisplay(
                                image: AssetImage("assets/Workout6.jpg"),
                                label: workoutName[5].Workout_name.toString(),
                                index: workoutName[5].Workout_id,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ]),
            ),
          ),
        )
      ],
    ));
  }
}
