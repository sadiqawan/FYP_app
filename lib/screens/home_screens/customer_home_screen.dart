import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:final_year_project/screens/home_screens/blog_screen.dart';
import 'package:final_year_project/screens/home_screens/favrite_screen.dart';
import 'package:final_year_project/screens/my_profile_screens/my_account_screen.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

class CustomerHomeScreen extends StatefulWidget {
  const CustomerHomeScreen({super.key});

  @override
  State<CustomerHomeScreen> createState() => _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends State<CustomerHomeScreen> {
  List<Widget> pages = [
    HomeScreen(),
    BlogScreen(),
    FavriteScreen(),
    MyAccount()
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
          color: Colors.black,
          index: _currentIndex,
          backgroundColor: Colors.white,
          items: [
            Icon(
              Icons.home_filled,
              color: Colors.white,
            ),
            Icon(
              Icons.leaderboard_outlined,
              color: Colors.white,
            ),
            Icon(
              Icons.favorite_border,
              color: Colors.white,
            ),
            Icon(
              Icons.person,
              color: Colors.white,
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          }),
      body: pages[_currentIndex],
    );
  }
}
