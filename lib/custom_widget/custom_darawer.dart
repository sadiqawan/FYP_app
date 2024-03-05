import 'package:final_year_project/custom_tabs/home_screen_tabs/home_page_tab_Tshart.dart';
import 'package:final_year_project/custom_tabs/home_screen_tabs/home_page_tab_bage.dart';
import 'package:final_year_project/custom_tabs/home_screen_tabs/home_page_tabe_dress.dart';
import 'package:final_year_project/screens/util_screen/contact_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
                  Expanded(child: TextButton(onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePageTabDress()));
                  }, child: const Text('Dresses'))),
                ],
              ), Row(
                children: [
                  Expanded(child: TextButton(onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePageTabBage()));

                  }, child: const Text('Bags'))),
                ],
              ), Row(
                children: [
                  Expanded(child: TextButton(onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeScreen()));

                  }, child: const Text('T-shart'))),
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
          // ListTile(
          //   leading: Icon(Icons.home),
          //   title: const Text('Home'),
          //   onTap: () {
          //
          //     Navigator.of(context).pop();
          //     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
          //       return HomeScreen();
          //     }));
          //   },
          // ),
          // ListTile(
          //   leading: Icon(Icons.phone),
          //   title: const Text('Contact Us'),
          //   onTap: () {
          //
          //     Navigator.of(context).pop();
          //     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
          //       return ContactScreen();
          //     }));
          //   },
          // ),
          // ExpansionTile(
          //   leading: Icon(Icons.style_rounded),
          //   title: const Text('Courses'),
          //   children: [
          //     const Text('App Dev'),
          //     const Text('Data Analytics'),
          //     const Text('ECommerce'),
          //   ],
          // ),

          // ListTile(
          //   leading: Icon(Icons.phone),
          //   title: const Text('About Us'),
          //   onTap: () {},
          // ),

          Divider(),
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
    );
    ;
  }
}
