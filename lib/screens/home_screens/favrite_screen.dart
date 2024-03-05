import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cached_network_image/cached_network_image.dart';

class FavoriteScreen extends StatelessWidget {


  const FavoriteScreen({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      // body: StreamBuilder<QuerySnapshot>(
      //   stream: FirebaseFirestore.instance.collection('products').snapshots(),
      //   builder: (context, snapshot) {
      //     if (snapshot.hasError) {
      //       return Text('Error: ${snapshot.error}');
      //     }
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return const Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     }
      //     if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
      //       List<QueryDocumentSnapshot> products = snapshot.data!.docs;
      //       List<Map<String, dynamic>> favoriteProducts = products
      //           .where((product) => favorites.contains(product.id))
      //           .map((product) => product.data() as Map<String, dynamic>)
      //           .toList();
      //       return Padding(
      //         padding: const EdgeInsets.all(13.0),
      //         child: ListView.builder(
      //           itemCount: favoriteProducts.length,
      //           itemBuilder: (context, index) {
      //             var data = favoriteProducts[index];
      //             return Column(
      //               children: [
      //                 Image.network(
      //                   data['productImageUrl'] as String,
      //                   fit: BoxFit.cover,
      //                   height: MediaQuery.of(context).size.height * 0.4,
      //                   width: MediaQuery.of(context).size.width * 0.9,
      //                 ),
      //                 const SizedBox(height: 10),
      //                 Container(
      //                   color: Colors.black12,
      //                   height: 60,
      //                   child: Row(
      //                     children: [
      //                       Expanded(
      //                         child: Column(
      //                           crossAxisAlignment: CrossAxisAlignment.start,
      //                           children: [
      //                             Expanded(
      //                               child: Text(
      //                                 'Title: ${data['title']}',
      //                                 style: const TextStyle(
      //                                   fontWeight: FontWeight.bold,
      //                                 ),
      //                               ),
      //                             ),
      //                             Expanded(
      //                               child: Text(
      //                                 'Description: ${data['Description']}',
      //                                 overflow: TextOverflow.ellipsis,
      //                               ),
      //                             ),
      //                           ],
      //                         ),
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //                 const SizedBox(height: 10),
      //               ],
      //             );
      //           },
      //         ),
      //       );
      //     } else {
      //       return const Center(
      //         child: Text('No data available.'),
      //       );
      //     }
      //   },
      // ),
    );
  }
}