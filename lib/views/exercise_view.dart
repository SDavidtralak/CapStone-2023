// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:capstone_project/views/home.dart';
import 'package:capstone_project/widgets/row_diaplay.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../widgets/back_home.dart';
import '../widgets/list_builder.dart';

class ExerciseView extends StatefulWidget {
  const ExerciseView({super.key});

  @override
  State<ExerciseView> createState() => _ExerciseViewState();
}

class _ExerciseViewState extends State<ExerciseView> {
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
                            //try to figurre out images for database or make them static and call pathing in database.
                            child: Image(
                              image: AssetImage("assets/Placeholder.jpg"),
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
                                //inject name by database
                                Text(
                                  "kfkfkfk kffkfkfk kfkfkfk fkkffkfkfkf kkfkfkfk",
                                  style: Theme.of(context).textTheme.caption,
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Row(
                                  children: [
                                    Image(
                                      image:
                                          AssetImage("assets/Placeholder.jpg"),
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
                                Text(
                                  "KFKFKFKFKFKFK",
                                  style: Theme.of(context).textTheme.caption,
                                ),
                                SizedBox(
                                  height: 120,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.blue),
                                  ),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Column(
                                      //inject by database
                                      children: [
                                        Text("Rep ranges:"),
                                        SizedBox(
                                          height: 40,
                                        ),
                                        //inject by database
                                        Text("Muscle groups"),
                                        SizedBox(
                                          height: 40,
                                        ),
                                        //inject by database
                                        Text("descriptions"),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 60,
                          ),
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Row(),
                              Positioned(
                                right: 168,
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
                                    Icons.star_half,
                                    size: 38,
                                  ),
                                ),
                              ),
                            ],
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
          )
        ],
      ),
    );
  }
}
