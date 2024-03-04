import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_shopping_cart/model/cart_model.dart';
import 'package:persistent_shopping_cart/persistent_shopping_cart.dart';

class HomePageTabBage extends StatefulWidget {
  const HomePageTabBage({super.key});

  @override
  State<HomePageTabBage> createState() => _HomePageTabBageState();
}

class _HomePageTabBageState extends State<HomePageTabBage> {
  CollectionReference? productsRef;
  DocumentSnapshot? productId;

  getUserDetails() async {
    // String uid = FirebaseAuth.instance.currentUser!.uid;

    productId =
        await FirebaseFirestore.instance.collection('products').doc().get();

    setState(() {});
    //print(userSnapshot! as Map<String, dynamic>);
  }

  @override
  void initState() {
    super.initState();

    productsRef = FirebaseFirestore.instance.collection('products');
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
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
          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              var data = products[index].data() as Map<String, dynamic>;
              print(data['productImageUrl'] as String);

              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  child: Row(
                    children: [
                      CachedNetworkImage(
                        height: 100,
                        width: 100,
                        imageUrl: data['productImageUrl'],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data['title'],
                              textAlign: TextAlign.start,
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              data['description'],
                              maxLines: 2,
                              textAlign: TextAlign.start,
                            ),
                            PersistentShoppingCart()
                                .showAndUpdateCartItemWidget(
                                    inCartWidget: Container(
                                      height: 30,
                                      width: 70,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(color: Colors.red),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Remove',
                                          style: Theme.of(context).textTheme.bodySmall,
                                        ),
                                      ),
                                    ),
                                    notInCartWidget:  Container(
                                      height: 30,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.green),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 5),
                                        child: Center(
                                          child: Text(
                                            'Add to cart',
                                            style: Theme.of(context).textTheme.bodySmall,
                                          ),
                                        ),
                                      ),
                                    ),
                                    product: PersistentShoppingCartItem(
                                        productId: index.toString(),
                                        productName: data[index]['title'],
                                        productDescription: data[index]['description'],
                                        unitPrice: 10.0,
                                        quantity: 1,
                                      productThumbnail: data[index]['productImageUrl'],

                                    ),

                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        } else {
          return const Center(
            child: Text('No data available.'),
          );
        }
      },
    );
  }
}

// ListTile(
// leading: Container(
// // height: 100,
// width: 100,
// decoration: BoxDecoration(
// image: DecorationImage(image: NetworkImage(data['productImageUrl'] as String),fit: BoxFit.cover),
//
// ),
// ),
// // leading: Image(
// //   height: 200,
// //   image: NetworkImage(data['productImageUrl'] as String),
// // ),
// title: Text(data['title']),
// subtitle: Text(data['description']),
// trailing: IconButton(
// onPressed: () {},
// icon: const Icon(Icons.favorite_border)),
// );
