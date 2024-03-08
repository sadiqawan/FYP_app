import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:final_year_project/screens/util_screen/blog_screen.dart';
import 'package:final_year_project/screens/my_profile_screens/my_account_screen.dart';
import 'home_screens/favrite_screen.dart';
import 'home_screens/home_screen.dart';

class CustomerDashboard extends StatefulWidget {
  const CustomerDashboard({Key? key}) : super(key: key);

  @override
  State<CustomerDashboard> createState() => _CustomerDashboardState();
}

class _CustomerDashboardState extends State<CustomerDashboard> {
  final List<Widget> pages = [
    const HomeScreen(),
    const BlogScreen(),
    const FavoriteScreen(),
    const MyAccount(),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.black,
        index: _currentIndex,
        backgroundColor: Colors.white,
        items: const [
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
        },
      ),
      body: pages[_currentIndex],
    );
  }
}
