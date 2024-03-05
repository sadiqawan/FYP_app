import 'package:final_year_project/custom_widget/login_custom_button.dart';
import 'package:flutter/material.dart';
import 'package:persistent_shopping_cart/persistent_shopping_cart.dart';

import '../cart_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late TextEditingController firstnameC, lastnameC, emailC, phoneC;

  @override
  void initState() {
    firstnameC = TextEditingController();
    lastnameC = TextEditingController();
    emailC = TextEditingController();
    phoneC = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    firstnameC.dispose();
    lastnameC.dispose();
    emailC.dispose();
    phoneC.dispose();
    super.dispose();
  }

  // Function to open bottom sheet
  void _openImagePickerBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Wrap(
          children: [
            ListTile(
              leading: Icon(Icons.camera),
              title: Text('Camera'),
              onTap: () {
                // Handle camera option
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.photo),
              title: Text('Gallery'),
              onTap: () {
                // Handle gallery option
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    String imageUrl =
        'https://firebasestorage.googleapis.com/v0/b/fyp-01-a1800.appspot.com/o/8dJqaSmkNEhUkXanPE7X-1?alt=media&token=cb6dea97-ba33-44e5-9e98-4307e17b545e';

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
                label: Text(itemCount.toString()),
                child: const Icon(Icons.shopping_bag_outlined),
              ),
            ),
          ),
        ],
        centerTitle: true,
        title: const Text('HiFashion'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Center(
              child: Text(
                'PROFILE',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 16.0),
            const Center(
                child: Text(
              'Use your Google account easily login',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            const SizedBox(height: 16.0),
            CustomButton(
              text: 'CONNECT WITH GOOGLE',
              textStyle: const TextStyle(color: Colors.white),
              icon: Icons.g_mobiledata_sharp,IconColor: Colors.white,

              onTap: () {},
              backgroundColor: Colors.black,
            ),
         const    SizedBox(height: 16.0),
            ListTile(
              leading: CircleAvatar(

                backgroundImage: NetworkImage(imageUrl),

              ),
              title: const Text('Open fashion'),
              trailing: IconButton(onPressed:  _openImagePickerBottomSheet, icon: const Icon(Icons.upload)),
              onTap: () {},
            ),
         const   SizedBox(height: 16.0),
            TextField(
              controller: firstnameC,
              decoration: const InputDecoration(labelText: 'First Name',border: OutlineInputBorder()),

            ),
            const  SizedBox(height: 16.0),

            TextField(
              controller: lastnameC,
              decoration:const InputDecoration(labelText: 'Last Name',border: OutlineInputBorder()),
            ),
            const  SizedBox(height: 16.0),

            TextField(
              controller: emailC,
              decoration: const InputDecoration(labelText: 'Email',border: OutlineInputBorder()),
            ),
            const  SizedBox(height: 16.0),

            TextField(
              controller: phoneC,
              keyboardType: TextInputType.number,
              decoration:const InputDecoration(labelText: 'Phone Number', border: OutlineInputBorder()),
            ),
            Spacer(),

            const  SizedBox(height: 16.0),
            CustomButton(
              text: 'SAVE',
              textStyle: const TextStyle(color: Colors.white),
              icon: Icons.person,IconColor: Colors.white,

              onTap: () {},
              backgroundColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
