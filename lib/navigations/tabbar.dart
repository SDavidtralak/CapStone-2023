// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:capstone_project/views/home.dart';
import 'package:capstone_project/views/library.dart';

import 'package:capstone_project/views/search.dart';
import 'package:flutter/material.dart';

class Tabbar extends StatefulWidget {
  const Tabbar({Key? key}) : super(key: key);

  @override
  State<Tabbar> createState() => _TabbarState();
}

class _TabbarState extends State<Tabbar> {
  int _selectedTab = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedTab,
          onTap: (index) {
            setState(() {
              _selectedTab = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search_outlined),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.library_books_outlined),
              label: "Library",
            ),
          ]),
      body: Stack(
        children: [
          renderView(
            0,
            HomeView(),
          ),
          renderView(
            1,
            SearchView(),
          ),
          renderView(
            2,
            LibraryView(),
          ),
        ],
      ),
    );
  }

  Widget renderView(int tabIndex, Widget view) {
    return IgnorePointer(
        ignoring: _selectedTab != tabIndex,
        child: Opacity(
          opacity: _selectedTab == tabIndex ? 1 : 0,
          child: view,
        ));
  }
}
