// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, camel_case_types

import 'dart:math';

import 'package:capstone_project/DB/DB.dart';

import 'package:capstone_project/model/liftcitl.dart';
import 'package:capstone_project/views/home.dart';
import 'package:capstone_project/views/library.dart';
import 'package:capstone_project/widgets/row_diaplay.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../widgets/back_home.dart';
import '../widgets/list_builder.dart';

List<String> imagePath = [
  'assets/Workout1.jpg',
  'assets/Workout2.jpg',
  'assets/Workout3.jpg',
  'assets/Workout4.jpg',
  'assets/Workout5.jpg',
  'assets/Workout6.jpg',
  'assets/Workout7.jpg'
];

class new_WorkoutView extends StatefulWidget {
  const new_WorkoutView({
    super.key,
  });

  @override
  State<new_WorkoutView> createState() => _new_WorkoutViewState();
}

class _new_WorkoutViewState extends State<new_WorkoutView> {
  final myController = TextEditingController();
  var dbHelper = DB();
  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();
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
                          ),
                          SizedBox(height: 16),
                          Text('Please enter a name for a new Workout'),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextFormField(
                                    // The validator receives the text that the user has entered.
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please the Name of your workout';
                                      }
                                      return null;
                                    },
                                    controller: myController,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      // Validate returns true if the form is valid, or false otherwise.
                                      if (_formKey.currentState!.validate()) {
                                        // If the form is valid, display a snackbar. In the real world,
                                        // you'd often call a server or save the information in a database.
                                        dbHelper.insertWorkout(
                                            myController.text,
                                            imagePath[Random().nextInt(8)]
                                                .toString());
                                      }
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Submit'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 60,
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
