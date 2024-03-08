import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_year_project/custom_widget/login_custom_button.dart';
import 'package:final_year_project/screens/customer_home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:gap/gap.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({Key? key}) : super(key: key);

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  // List<File> images = [];
  // List<String> photos = [];
  CollectionReference? productsRef;
  DocumentSnapshot? productSnapshot;
  String? _selectedCategory;
  List<String> listOfCategories = ['Dress', 'T-shart', 'Bags'];
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;

  getProductDetails() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;

    productSnapshot =
        await FirebaseFirestore.instance.collection('products').doc(uid).get();

    setState(() {});
  }

  @override
  void initState() {
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();

    productsRef = FirebaseFirestore.instance.collection('products');
    getProductDetails();

    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  File? _imageFile;
  int counter = 0;
  DocumentSnapshot? userSnapshot;
  bool showLocalImage = false;

// image picker

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);

    setState(() {
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
        showLocalImage = true;
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                setState(() {});
              },
              icon: const Icon(Icons.refresh)),
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const CustomerDashboard()));
              },
              icon: const Icon(Icons.drive_file_move)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.person)),
        ],
        centerTitle: true,
        title: const Text('AdminDashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(
                  hintText: 'Title of the product',
                  suffixIcon: Icon(Icons.short_text_sharp),
                ),
              ),
              const Gap(16),
              DropdownButton<String>(
                hint: const Text('Select a Category of product'),
                isExpanded: true,
                value: _selectedCategory,
                items: listOfCategories.map((category) {
                  return DropdownMenuItem<String>(
                    value: category,
                    child: Text(
                        category), // Display category as text in the dropdown
                  );
                }).toList(),
                onChanged: (selectedValue) {
                  setState(() {
                    _selectedCategory = selectedValue!;
                  });
                },
              ),
              const Gap(16),
              TextField(
                controller: _descriptionController,
                maxLines: 4,
                decoration: const InputDecoration(
                  hintText: 'Description........',
                  suffixIcon: Icon(Icons.short_text_sharp),
                ),
              ),
              const Gap(16),
              IconButton(
                onPressed: () {
                  _pickImage(ImageSource.gallery);
                },
                icon: const Icon(
                  Icons.file_present_sharp,
                  size: 100,
                ),
              ),
              const Gap(16),
              _imageFile != null
                  ? Image.file(
                      _imageFile!,
                      height: 400,
                      width: 350,
                      fit: BoxFit.cover,
                    )
                  : Container(),
              const Gap(16),
              CustomButton(
                text: 'Upload',
                onTap: () async {
                  if (_titleController != null &&
                      _imageFile != null &&
                      _descriptionController != null &&
                      _selectedCategory != null) {
                    DocumentReference productRep =
                        FirebaseFirestore.instance.collection('products').doc();

                    await productRep.set({
                      'title': _titleController.text.trim(),
                      'category': _selectedCategory,
                      'description': _descriptionController.text.trim(),
                      'postedOn': DateTime.now().millisecondsSinceEpoch,
                      'postedBy': FirebaseAuth.instance.currentUser!.uid,
                      'postedByName':
                          FirebaseAuth.instance.currentUser!.displayName,
                      'productImageUrl': null,
                    });

                    // upload image to storage
                    if (_imageFile != null) {
                      // uplode to storage
                      FirebaseStorage storage = FirebaseStorage.instance;
                      var fileName = '${productRep.id}-$counter';

                      UploadTask uploadTask = storage
                          .ref()
                          .child(fileName)
                          .putFile(_imageFile!,
                              SettableMetadata(contentType: 'image/png'));
                      TaskSnapshot taskSnapshot =
                          await uploadTask.whenComplete(() {});
                      //get url of the image
                      String url = await taskSnapshot.ref.getDownloadURL();

                      counter++;
                      // save these urls to firestore
                      productRep.update({'productImageUrl': url});
                      Fluttertoast.showToast(msg: 'Uploaded successfully');
                      setState(() {
                        _selectedCategory;
                        _titleController;

                        _descriptionController;
                        _imageFile;
                      });
                    }
                  } else {
                    Fluttertoast.showToast(
                        msg: 'Pleas provide the following given filled...');
                  }
                },
              ),
              const SizedBox(
                height: 10,
              ),
              StreamBuilder<QuerySnapshot>(
                stream: productsRef!.snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List productsref = snapshot.data!.docs;
                    if (productsref.isEmpty) {
                      return const Center(
                        child: Column(
                          children: [
                            Center(child: Text('No products listed yet')),
                  SpinKitSpinningLines(color: Colors.black)
                          ],
                        ),
                      );
                    }

                    return ListView.builder(
                      shrinkWrap: true,
                      // Add this line
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: productsref.length,
                      itemBuilder: (context, index) {
                        var productSnapshot =
                            productsref[index].data() as Map<String, dynamic>;
                        return Column(
                          children: [

                            if (productSnapshot['productImageUrl'] !=
                                null) // Ensure image URL is not null
                              SizedBox(
                                width: double.infinity,
                                child:  productSnapshot.isEmpty ? const SpinKitSpinningLines(color: Colors.black):
                                Image.network(
                                  productSnapshot['productImageUrl'] as String,
                                ),
                              ),
                            const SizedBox(height: 10),
                            Text('Title: ${productSnapshot['title']}'),
                            const SizedBox(height: 10),
                            Text(
                                'Description: ${productSnapshot['description']}'),
                          ],
                        );
                      },
                    );
                  } else {
                    return const Center(
                      child: SpinKitSpinningLines(color: Colors.black,)
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
