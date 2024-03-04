import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:persistent_shopping_cart/persistent_shopping_cart.dart';
import 'package:final_year_project/custom_widget/login_custom_button.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  late CollectionReference productsRef;

  @override
  void initState() {
    super.initState();
    productsRef = FirebaseFirestore.instance.collection('products');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Shopping Cart')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
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
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data.productName,
                              textAlign: TextAlign.start,
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              data.productDetails.toString(),
                              textAlign: TextAlign.start,
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Text(
                                  data.unitPrice.toString(),
                                  maxLines: 2,
                                  textAlign: TextAlign.start,
                                ),
                                IconButton(
                                  onPressed: () {
                                    PersistentShoppingCart()
                                        .removeFromCart(data.productId);
                                  },
                                  icon: const Icon(Icons.delete),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          IconButton(
                            onPressed: () {
                              PersistentShoppingCart().incrementCartItemQuantity(data.productId);
                            },
                            icon: const Icon(Icons.add),
                          ),
                          Text(data.quantity.toString()),
                          IconButton(
                            onPressed: () {
                              PersistentShoppingCart().decrementCartItemQuantity(data.productId);
                            },
                            icon: const Icon(Icons.remove),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                showEmptyCartMsgWidget: const Center(child: Text('No data')),
              ),
            ),
            PersistentShoppingCart().showTotalAmountWidget(
              cartTotalAmountWidgetBuilder: (totalAmount) {
                return Column(
                  children: [
                    const Divider(color: Colors.black,),
                    Visibility(
                      visible: totalAmount == 0.0 ? false : true,
                      child: Column(
                        children: [
                          const Text('TOTAL',style:  TextStyle(fontWeight: FontWeight.bold, fontSize: 30), ),
                          const Divider(color: Colors.black,),

                          Text(totalAmount.toString() , style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
                        ],
                      ),
                    ),
                    CustomButton(
                      text: 'BUY NOW',
                      onTap: () {},
                      backgroundColor: Colors.black12,
                      icon: Icons.shopping_bag_outlined,
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
