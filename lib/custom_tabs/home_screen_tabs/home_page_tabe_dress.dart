import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:persistent_shopping_cart/model/cart_model.dart';
import 'package:persistent_shopping_cart/persistent_shopping_cart.dart';

class HomePageTabDress extends StatefulWidget {
  const HomePageTabDress({super.key});

  @override
  State<HomePageTabDress> createState() => _HomePageTabDressState();
}

class _HomePageTabDressState extends State<HomePageTabDress> {
  CollectionReference? productsRef;

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
                                productId: products[index].id,
                                productName: data['title'] ?? '',
                                productDescription: data['description'],
                                unitPrice: 10.0,
                                quantity: 1,
                                productThumbnail: data['productImageUrl'] ,
                              ),
                            ),
                          ],
                        ),
                      )
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


