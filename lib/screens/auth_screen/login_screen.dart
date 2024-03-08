import 'package:final_year_project/custom_tabs/auth_tabs/register_tab.dart';
import 'package:final_year_project/custom_tabs/auth_tabs/sigin_tab.dart';
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
          bottom: const TabBar(labelColor: Colors.black, tabs: [
            Tab(text: 'SIGN IN'),
            Tab(text: 'REGISTER'),
          ]),
        ),
        drawer: Drawer(
        child:   ListView(
            children: [
              DrawerHeader(
                padding: EdgeInsets.zero,
                child: Container(
                  color: Colors.black,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'HiFashion',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      )
                    ],
                  ),
                ),
              ),


            const  Divider(),
              ListTile(
                leading: const Icon(Icons.email_outlined),
                title: const Text('support@email.com'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.location_on_outlined),
                title: const Text('Store Collection'),
                onTap: () {},
              ),
            ],
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
