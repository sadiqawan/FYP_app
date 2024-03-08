import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_year_project/screens/util_screen/about_screen.dart';
import 'package:final_year_project/screens/util_screen/blog_screen.dart';
import 'package:final_year_project/screens/util_screen/contact_screen.dart';
import 'package:final_year_project/screens/util_screen/explore_more_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../custom_widget/login_custom_button.dart';

class HomePageTabAll extends StatefulWidget {
  const HomePageTabAll({Key? key}) : super(key: key);

  @override
  State<HomePageTabAll> createState() => _HomePageTabAllState();
}

class _HomePageTabAllState extends State<HomePageTabAll> {
  CollectionReference? productsRef;

  @override
  void initState() {
    super.initState();
    productsRef = FirebaseFirestore.instance.collection('products');
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
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
              stream: productsRef!.snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: SpinKitSpinningLines(color: Colors.black),
                  );
                }
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
                            image:
                                NetworkImage(data['productImageUrl'] as String),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: 10),
                            Text(
                              '${data['title']}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                    options: CarouselOptions(
                      height: 340,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.8,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.3,
                      scrollDirection: Axis.horizontal,
                    ),
                  );
                } else {
                  return const Center(
                    child: Text('No data available.'),
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
            SizedBox(
              height: 400,
              child: StreamBuilder<QuerySnapshot>(
                stream: productsRef!.snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: SpinKitSpinningLines(color: Colors.black),
                    );
                  }
                  if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                    List products = snapshot.data!.docs;
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: GridView(
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        children: products.map((doc) {
                          var data = doc.data() as Map<String, dynamic>;
                          String productImageUrl =
                              data['productImageUrl'] ?? '';
                          String title = data['title'] ?? '';
                          // String description = data['description'] ?? '';
                          return Column(
                            children: [
                              Expanded(
                                flex: 5,
                                child: Container(
                                  decoration: const BoxDecoration(),
                                  child: Image(
                                    image: NetworkImage(productImageUrl),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),

                              Expanded(
                                flex: 1,
                                child: Text(
                                  title,
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              //
                            ],
                          );
                        }).toList(),
                      ),
                    );
                  } else {
                    return const Center(
                      child: Text('No data available.'),
                    );
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: CustomButton(
                text: 'EXPLORE MORE',
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ExploreMoreScreen()));
                },
                backgroundColor: Colors.black,
                textStyle: const TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Divider(
              color: Colors.black,
            ),
            const Center(
              child: Text(
                'COLLECTION',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
            const Divider(
              color: Colors.black,
            ),
            Row(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width * 0.4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                      image: AssetImage('images/s3.png'),
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width * 0.4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                        image: AssetImage('images/s2.png'),
                      )),
                ),
              ],
            ),

            // CachedNetworkImage(
            //   fit: BoxFit.cover,
            //   height: MediaQuery.of(context).size.height * 0.4,
            //   width: MediaQuery.of(context).size.width * 0.9,
            //   imageUrl: ,
            // ),

            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 400,
                color: const Color(0xFFF2F2F2),
                child: Column(
                  children: [
                    const Center(
                      child: Text(
                        'HiFashion',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    const Center(
                      child: Text(
                        textAlign: TextAlign.center,
                        'Making a luxurious lifestyle accessible for a generous group of women is our daily drive.',
                        style: TextStyle(),
                      ),
                    ),
                    SizedBox(
                      height: 300,
                      child: Center(
                        child: GridView.count(
                          crossAxisCount: 2,
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('images/s1.png'),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  textAlign: TextAlign.center,
                                  'Sustainable process from start to finish',
                                )
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('images/s2.png'),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  textAlign: TextAlign.center,
                                  'Sustainable process from start to finish',
                                )
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('images/s3.png'),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  textAlign: TextAlign.center,
                                  'Sustainable process from start to finish',
                                )
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('images/s4.png'),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  textAlign: TextAlign.center,
                                  'Sustainable process from start to finish',
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 450,
                color: const Color(0xFFF2F2F2),
                child: Column(
                  children: [
                    const Center(
                      child: Text(
                        'FOLLOW US',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Center(
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.facebook,
                              size: 50,
                            ))),
                    SizedBox(
                      height: 320,
                      child: Center(
                        child: GridView.count(
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8,
                          crossAxisCount: 2,
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            Image.asset('images/f1.png'),
                            Image.asset('images/f2.png'),
                            Image.asset('images/f3.png'),
                            Image.asset('images/f4.png'),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
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
            const Divider(color: Colors.black),
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
    );
  }
}
