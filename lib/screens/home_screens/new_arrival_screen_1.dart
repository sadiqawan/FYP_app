
import 'package:final_year_project/custom_tabs/home_screen_tabs/home_page_tab_all.dart';
import 'package:flutter/material.dart';

import '../my_profile_screens/my_account_screen.dart';

class NewArrivalScreen1 extends StatefulWidget {
  const NewArrivalScreen1({Key? key}) : super(key: key);

  @override
  State<NewArrivalScreen1> createState() => _NewArrivalScreen1State();
}

class _NewArrivalScreen1State extends State<NewArrivalScreen1>
    with SingleTickerProviderStateMixin {


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MyAccount()));
            }, icon: const Icon(Icons.person)),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.shopping_bag_outlined)),
          ],
          centerTitle: true,
          title: const Text('HiFashion'),
          bottom: const TabBar(
              labelColor: Colors.black,

              tabs: [
                Tab(text: 'All'),
                Tab(text: 'Appeal'),
                Tab(text: 'T-shart'),
                Tab(text: 'T-shart'),

              ]),
        ),
        drawer: Drawer(
          child: ListView(
            children: const [],
          ),
        ),
        body:   const TabBarView(
          children: [

          HomePageTabAll(),

            Text('hi'),
            Text('hi'),
            Text('hi'),


          ],
        ),
      ),
    );
  }
}
