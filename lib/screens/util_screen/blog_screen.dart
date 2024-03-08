import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:persistent_shopping_cart/persistent_shopping_cart.dart';
import 'package:provider/provider.dart';
import 'package:final_year_project/provider_classes/favorite_provider.dart';

import '../../custom_widget/custom_darawer.dart';
import '../cart_screen.dart';

class BlogScreen extends StatefulWidget {
  const BlogScreen({Key? key}) : super(key: key);

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  Future<QuerySnapshot>? productsFuture;

  @override
  void initState() {
    super.initState();
    productsFuture = FirebaseFirestore.instance.collection('products').get();
  }

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
          centerTitle: true,
          title: const Text('BLOG'),

        ),
        drawer:const  Drawer(
            child:  CustomDrawer()
        ),
      body: Consumer<FavoriteProvider>(
        builder: (context, value, child) {
          return FutureBuilder<QuerySnapshot>(
            future: productsFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: SpinKitSpinningLines(color: Colors.black),
                );
              }
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }
              if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                List<QueryDocumentSnapshot> products = snapshot.data!.docs;
                return Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      var data = products[index].data() as Map<String, dynamic>;

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
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
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
                                        value.favoriteItem.contains(index)
                                            ? value.removeFavorite(index)
                                            : value.setFavorite(index);
                                      },
                                      icon: Icon(
                                        value.favoriteItem.contains(index)
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        color: Colors.red,
                                      ),
                                    ))
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
                // Show circular progress indicator when no data is available
                return const Center(
                  child: Text('No data found'),
                );
              }
            },
          );
        },
      )
    );
  }
}
