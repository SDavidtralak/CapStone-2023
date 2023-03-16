// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields, unused_element, no_leading_underscores_for_local_identifiers, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../widgets/list_builder.dart';
import '../DB/DB.dart';
import 'package:capstone_project/model/liftcitl.dart';

List<String> exerciseName = [];

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    var dbHelper = DB();
    List<String> _exerciseName = await dbHelper.getExerciseName();
    setState(() {
      exerciseName = _exerciseName;
    });
  }

  bool _searchBoolean = false;
  Widget _searchTextField() {
    return TextField(
      autofocus: true,
      cursorColor: Colors.black,
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(hintText: 'Search'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: !_searchBoolean ? Text("Search") : _searchTextField(),
        backgroundColor: Colors.white54,
        actions: !_searchBoolean
            ? [
                IconButton(
                  icon: Icon(Icons.search_outlined),
                  onPressed: () {
                    setState(() {
                      _searchBoolean = true;
                    });
                  },
                ),
              ]
            : [
                IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    setState(() {
                      _searchBoolean = false;
                    });
                  },
                ),
              ],
      ),
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
                    ListDisplay(
                      textDisplay: exerciseName,
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
