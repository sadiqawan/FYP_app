import 'package:final_year_project/custom_widget/my_account_custom_buttons.dart';
import 'package:final_year_project/screens/util_screen/about_screen.dart';
import 'package:final_year_project/screens/util_screen/blog_screen.dart';
import 'package:final_year_project/screens/util_screen/contact_screen.dart';
import 'package:final_year_project/screens/util_screen/profile_screen.dart';
import 'package:final_year_project/screens/util_screen/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_shopping_cart/persistent_shopping_cart.dart';

import '../../custom_widget/custom_darawer.dart';
import '../cart_screen.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({super.key});

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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


      ),
      drawer:const  Drawer(
          child:  CustomDrawer()
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              const Center(
                child: Text(
                  'MY ACCOUNT',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
              const SizedBox(
                height: 45,
              ),
              SizedBox(
                height: 400,
                child: GridView(
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.only(top: 15),
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    children: [
                      MyAccountButton(
                        text: 'SETTING',
                        icon: Icons.settings,
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const SettingScreen()));
                        },
                      ),
                      MyAccountButton(
                        text: 'PROFILE',
                        icon: Icons.person,
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const ProfileScreen()));
                        },
                      ),
                      MyAccountButton(
                          text: 'PASSWORD', icon: Icons.lock, onTap: () {}),
                      MyAccountButton(
                        text: 'ORDER',
                        icon: Icons.shopping_bag,
                        onTap: () {},
                      ),
                      MyAccountButton(
                        text: 'ADDRESS',
                        icon: Icons.location_on_outlined,
                        onTap: () {},
                      ),
                      MyAccountButton(
                        text: 'EMAIL',
                        icon: Icons.email_outlined,
                        onTap: () {},
                      ),
                    ]),
              ),
              const Divider(
                color: Colors.black,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(FontAwesomeIcons.twitter),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(FontAwesomeIcons.instagram),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(FontAwesomeIcons.youtube),
                  ),
                ],
              ),
              const Divider(
                color: Colors.black,
              ),
              const Text('support@email.com'),
              const Text('+92-11111111'),
              const Text('8:00 - 12:00 EVERYDAY'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const AboutScreen()));
                      },
                      child: const Text('ABOUT')),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const ContactScreen()));
                      },
                      child: const Text('CONTACT')),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const BlogScreen()));
                      },
                      child: const Text('BLOG')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
