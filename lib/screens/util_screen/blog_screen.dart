import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_year_project/screens/home_screens/favrite_screen.dart';

class BlogScreen extends StatefulWidget {
  const BlogScreen({Key? key}) : super(key: key);

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  CollectionReference? productsRef;
  Set<String> favorites = {}; // Set to store favorite product IDs

  @override
  void initState() {
    super.initState();
    productsRef = FirebaseFirestore.instance.collection('products');
  }

  // Function to toggle favorite status
  void _toggleFavorite(String productId) {
    setState(() {
      if (favorites.contains(productId)) {
        favorites.remove(productId);
      } else {
        favorites.add(productId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.shopping_bag_outlined)),
        ],
        centerTitle: true,
        title: const Text('HiFashion'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: productsRef!.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
            List<QueryDocumentSnapshot> products = snapshot.data!.docs;
            return Padding(
              padding: const EdgeInsets.all(13.0),
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  var data = products[index].data() as Map<String, dynamic>;
                  String productId = products[index].id;
                  bool isFavorite = favorites
                      .contains(productId); // Check if the product is favorited
                  return Column(
                    children: [
                      CachedNetworkImage(
                        fit: BoxFit.cover,
                        height: MediaQuery.of(context).size.height * 0.4,
                        width: MediaQuery.of(context).size.width * 0.9,
                        imageUrl: data['productImageUrl'] as String,
                      ),
                      const SizedBox(height: 10),
                      Container(
                        color: Colors.black12,
                        height: 60,
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Title: ${data['title']}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      'Description: ${data['Description']}',
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: IconButton(
                                onPressed: () {
                                  _toggleFavorite(productId);
                                },
                                icon: Icon(
                                  isFavorite
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: isFavorite ? Colors.red : null,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  );
                },
              ),
            );
          } else {
            return const Center(
              child: Text('No data available.'),
            );
          }
        },
      ),
    );
  }
}
