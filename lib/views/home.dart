// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:flutter/material.dart';

import '../widgets/workout_display.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      alignment: Alignment.topLeft,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * .7,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 49, 0, 185).withOpacity(0.7),
                Color.fromARGB(255, 255, 0, 0).withOpacity(0.01),
              ],
            ),
          ),
        ),
        SingleChildScrollView(
          physics: BouncingScrollPhysics(),
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
                      children: [
                        Text(
                          "Recent",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        Row(
                          children: [
                            Icon(Icons.history),
                            SizedBox(
                              width: 30,
                            ),
                            Icon(Icons.settings)
                          ],
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
                          image: AssetImage("assets/Placeholder.jpg"),
                          label: "Placeholder",
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Workoutdisplay(
                          image: AssetImage("assets/Placeholder.jpg"),
                          label: "Placeholder",
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Workoutdisplay(
                          image: AssetImage("assets/Placeholder.jpg"),
                          label: "Placeholder",
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Workoutdisplay(
                          image: AssetImage("assets/Placeholder.jpg"),
                          label: "Placeholder",
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Workoutdisplay(
                          image: AssetImage("assets/Placeholder.jpg"),
                          label: "Placeholder",
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Workoutdisplay(
                          image: AssetImage("assets/Placeholder.jpg"),
                          label: "Placeholder",
                        ),
                        SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Text(
                          "Welcome Back",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        GridView.extent(
                          maxCrossAxisExtent: 200,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Image.asset(
                                    "assets/Placeholder.jpg",
                                    width: 48,
                                    height: 48,
                                  ),
                                  Text("PlaceHolder")
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ]),
          ),
        )
      ],
    ));
  }
}
