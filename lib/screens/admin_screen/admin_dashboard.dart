import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_year_project/custom_widget/login_custom_button.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:gap/gap.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({Key? key}) : super(key: key);

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;

  @override
  void initState() {
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  File? _imageFile;
  DocumentSnapshot? userSnapshot;
  bool showLocalImage = false;
// image picker

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);

    setState(() {
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
        setState(() {
          showLocalImage = true;
        });
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        actions: [

          IconButton(
              onPressed: () {}, icon: const Icon(Icons.person)),
        ],
        centerTitle: true,
        title: const Text('AdminDashboard'),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
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
              TextField(
                controller: _descriptionController,
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
                icon: const Icon(Icons.file_present_sharp, size: 100,),
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
              CustomButton(text: 'Uploade', onTap: (){


              })

            ],
          ),
        ),
      ),
    );
  }
}
