import 'package:final_year_project/custom_widget/custom_button.dart';
import 'package:final_year_project/screens/my_account_screens/my_account_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: const [],
        ),
      ),
      appBar: AppBar(
        actions: [
          // IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) =>const  MyAccount()));
          }, icon: const Icon(Icons.person)),
        ],
        centerTitle: true,
        title: const Text('HiFashion'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text('WELCOME', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25,),
                textAlign: TextAlign.center,),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.4,
            ),
            CustomButton(
              text: 'SIGN IN',
              backgroundColor: Colors.black,
              textStyle: const  TextStyle(color: Colors.white),
              onTap: () {

              },
            )
          ],
        ),
      ),
    );
  }
}
