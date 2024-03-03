import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BlogScreen extends StatefulWidget {
  const BlogScreen({Key? key}) : super(key: key);

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
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


              return Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(10.0),
                      // image: DecorationImage(
                      //   image: NetworkImage(data['productImageUrl'] as String),
                      //
                      //   fit: BoxFit.cover,
                      // ),
                    ),
                    child: Image(image: NetworkImage(data['productImageUrl'] as String),)

                    // You may want to adjust the width of the container based on your needs
                  ),
                  const SizedBox(height: 10),
                  Text('Title: ${data['title']}'),

                  const SizedBox(height: 10),
                  Text('Description: ${data['Description']}'),

                ],
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
