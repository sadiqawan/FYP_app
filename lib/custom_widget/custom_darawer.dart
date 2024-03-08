import 'package:final_year_project/custom_tabs/home_screen_tabs/home_page_tab_bage.dart';
import 'package:final_year_project/custom_tabs/home_screen_tabs/home_page_tabe_dress.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../screens/auth_screen/login_screen.dart';
import '../screens/home_screens/home_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
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
          ExpansionTile(
            title: const Text('New'),
            children: [
              Row(
                children: [
                  Expanded(
                      child: TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    const HomePageTabDress()));
                          },
                          child: const Text('Dresses'))),
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const HomePageTabBage()));
                          },
                          child: const Text('Bags'))),
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const HomeScreen()));
                          },
                          child: const Text('T-shart'))),
                ],
              ),
            ],
          ),
          const ListTile(
            leading: Icon(Icons.home_filled),
            title: Text('Home'),
          ),
          const ListTile(
            leading: Icon(Icons.leaderboard_outlined),
            title: Text('Blog'),
          ),
          const ListTile(
            leading: Icon(Icons.favorite_border),
            title: Text('Favrite'),
          ),
          const ListTile(
            leading: Icon(Icons.phone),
            title: Text('Contact'),
          ),
          const Divider(
            color: Colors.black,
          ),
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
          const Divider(
            color: Colors.black,
          ),
          ListTile(
            leading: const Icon(Icons.logout_sharp),
            title: const Text('LogOut'),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Confirmation'),
                      content: const Row(
                        children: [
                          Icon(Icons.logout),
                          SizedBox(
                            width: 10,
                          ),
                          Text('Are you sure to logout')
                        ],
                      ),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('No')),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);

                              FirebaseAuth.instance.signOut();

                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(builder: (context) {
                                return const LoginScreen();
                              }));
                            },
                            child: const Text('Yes')),
                      ],
                    );
                  });
            },
          ),
        ],
      ),
    );
  }
}
