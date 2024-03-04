import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:persistent_shopping_cart/persistent_shopping_cart.dart';

class CardScreen extends StatefulWidget {

  const CardScreen({super.key, });

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  CollectionReference? productsRef;

  @override
  void initState() {
    productsRef = FirebaseFirestore.instance.collection('products');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PersistentShoppingCart().showCartItems(
                cartTileWidget: ({required data}) => Card(
                  child: Row(
                    children: [
                      CachedNetworkImage(
                        height: 100,
                        width: 100,
                        imageUrl: data.productImages.toString(),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data.productName,
                              textAlign: TextAlign.start,
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),Text(
                              data.productDetails.toString(),
                              textAlign: TextAlign.start,
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          const  SizedBox(height: 5,),
                            Row(
                              children: [
                                Text(
                                  data.unitPrice.toString(),
                                  maxLines: 2,
                                  textAlign: TextAlign.start,
                                ),
                                IconButton(onPressed: (){
                                  PersistentShoppingCart().removeFromCart(data.productId);
                                }, icon: const Icon(Icons.delete))
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                showEmptyCartMsgWidget: const Center(child:   Text('No data'))),
          ),

        ],
      ),
    );
  }
}
