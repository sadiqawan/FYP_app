import 'package:flutter/material.dart';

class NewArrivalScreen1 extends StatefulWidget {
  const NewArrivalScreen1({super.key});

  @override
  State<NewArrivalScreen1> createState() => _NewArrivalScreen1State();
}

class _NewArrivalScreen1State extends State<NewArrivalScreen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // actions: [
        //   IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        //   IconButton(
        //       onPressed: () {},
        //       icon: const Icon(Icons.shopping_bag_outlined)),
        // ],
        centerTitle: true,
        title: const Text(
          'HiFashion',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: const [],
        ),
      ),
      body:  Column(
        children: [
       const    Center(

            child: Text('NEW ARRIVAL',style: TextStyle(fontWeight: FontWeight.bold , fontSize: 25,), ),
          ),
        const   Divider(),

        ],
      ),
    );
  }
}
