import 'package:final_year_project/custom_tabs/home_screen_tabs/home_page_tab_Tshart.dart';
import 'package:final_year_project/custom_tabs/home_screen_tabs/home_page_tab_all.dart';
import 'package:final_year_project/custom_tabs/home_screen_tabs/home_page_tab_bage.dart';
import 'package:final_year_project/custom_tabs/home_screen_tabs/home_page_tabe_dress.dart';
import 'package:final_year_project/custom_widget/custom_darawer.dart';
import 'package:flutter/material.dart';
import 'package:persistent_shopping_cart/persistent_shopping_cart.dart';

import '../cart_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
            PersistentShoppingCart().showCartItemCountWidget(
              cartItemCountWidgetBuilder: (itemCount) => IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CardScreen()),
                  );
                },
                icon: Badge(
                  label:Text(itemCount.toString()) ,
                  child: const Icon(Icons.shopping_bag_outlined),
                ),
              ),
            ),
          ],
          centerTitle: true,
          title: const Text('HiFashion'),
          bottom: const TabBar(labelColor: Colors.black, tabs: [
            Tab(text: 'All'),
            Tab(text: 'Dress'),
            Tab(text: 'T-shart'),
            Tab(text: 'Bags'),
          ]),
        ),
        drawer:const  Drawer(
          child:  CustomDrawer()
        ),
        body: const TabBarView(
          children: [
            HomePageTabAll(),
            HomePageTabDress(),
            HomePageTabTshart(),
            HomePageTabBage()
          ],
        ),
      ),
    );
  }
}
