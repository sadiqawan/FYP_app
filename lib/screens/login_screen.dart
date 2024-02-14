import 'package:final_year_project/custom_widget/register_tab.dart';
import 'package:final_year_project/custom_widget/sigin_tab.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.shopping_bag_outlined)),
          ],
          centerTitle: true,
          title: const Text('HiFashion'),
          bottom: const TabBar(
              labelColor: Colors.black,
             
              tabs: [
            Tab(text: 'SIGN IN'),
            Tab(text: 'REGISTER'),
          ]),
        ),
        drawer: Drawer(
          child: ListView(
            children: const [],
          ),
        ),
        body: const TabBarView(
          children: [
            SignInTab(),
            RegisterTab(),
          ],
        ),
      ),
    );
  }
}
