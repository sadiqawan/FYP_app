import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePageTabAll extends StatefulWidget {
  const HomePageTabAll({Key? key}) : super(key: key);

  @override
  State<HomePageTabAll> createState() => _HomePageTabAllState();
}

class _HomePageTabAllState extends State<HomePageTabAll> {
 CollectionReference? productsRef; // Declaring it as non-nullable

  @override
  void initState() {
    super.initState();
    productsRef = FirebaseFirestore.instance.collection('products');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            const Center(
              child: Text(
                'Just for You',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
            const SizedBox(height: 20),
            StreamBuilder<QuerySnapshot>(
              stream: productsRef?.snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                  List products = snapshot.data!.docs;

                  return CarouselSlider(
                    items: products.map((doc) {
                      var data = doc.data() as Map<String, dynamic>;
                      return Container(
                        margin: const EdgeInsets.all(8.0),
                        width: 300,
                        decoration: BoxDecoration(

                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                            image:   NetworkImage(data['productImageUrl'] as String),
                            fit: BoxFit.cover,
                          ),

                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: 10),
                            Text('Title: ${data['title']}'),
                          ],
                        ),
                      );
                    }).toList(),
                    options: CarouselOptions(
                      height: 400,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.8,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration: const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.3,
                      scrollDirection: Axis.horizontal,
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
            const SizedBox(height: 20),
            const Center(
              child: Text(
                'New Arrival',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
            const SizedBox(height: 20),
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
            const Divider(color: Colors.black),
            const Text('support@email.com'),
            const Text('+92-11111111'),
            const Text('8:00 - 12:00 EVERYDAY'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(onPressed: () {}, child: const Text('ABOUT')),
                TextButton(onPressed: () {}, child: const Text('CONTACT')),
                TextButton(onPressed: () {}, child: const Text('BLOG')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}




























// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:final_year_project/custom_widget/login_custom_button.dart';
// import 'package:final_year_project/models/onbording_screen_model.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//
// class HomePageTabAll extends StatefulWidget {
//   const HomePageTabAll({super.key});
//
//   @override
//   State<HomePageTabAll> createState() => _HomePageTabAllState();
// }
//
// class _HomePageTabAllState extends State<HomePageTabAll> {
//   DocumentSnapshot? productsSnapshot;
//
//   getProductsDetails() async {
//     String uid = FirebaseFirestore.instance.collection('products').id;
//     productsSnapshot =
//         await FirebaseFirestore.instance.collection('products').doc(uid).get();
//     setState(() {
//
//     });
//   }
//   @override
//   void initState() {
//     getProductsDetails();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(12.0),
//       child: SingleChildScrollView(
//         child: Column(
//           children: [
//             const Center(
//               child: Text(
//                 'Just for You',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 25,
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 45,
//             ),
//             Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: CarouselSlider(
//                     items: onboardingData.length,
//                     options: CarouselOptions(
//                       height: 400,
//                       aspectRatio: 16 / 9,
//                       viewportFraction: 0.8,
//                       initialPage: 0,
//                       enableInfiniteScroll: true,
//                       reverse: false,
//                       autoPlay: true,
//                       autoPlayInterval: Duration(seconds: 3),
//                       autoPlayAnimationDuration: Duration(milliseconds: 800),
//                       autoPlayCurve: Curves.fastOutSlowIn,
//                       enlargeCenterPage: true,
//                       enlargeFactor: 0.3,
//                       scrollDirection: Axis.horizontal,
//                     ))),
//             const Center(
//               child: Text(
//                 'New Arrival',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 25,
//                 ),
//               ),
//             ),
//
//
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 IconButton(
//                   onPressed: () {},
//                   icon: const Icon(FontAwesomeIcons.twitter),
//                 ),
//                 IconButton(
//                   onPressed: () {},
//                   icon: const Icon(FontAwesomeIcons.instagram),
//                 ),
//                 IconButton(
//                   onPressed: () {},
//                   icon: const Icon(FontAwesomeIcons.youtube),
//                 ),
//               ],
//             ),
//             const Divider(
//               color: Colors.black,
//             ),
//             const Text('support@email.com'),
//             const Text('+92-11111111'),
//             const Text('8:00 - 12:00 EVERYDAY'),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 TextButton(onPressed: () {}, child: const Text('ABOUT')),
//                 TextButton(onPressed: () {}, child: const Text('CONTACT')),
//                 TextButton(onPressed: () {}, child: const Text('BLOG')),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
