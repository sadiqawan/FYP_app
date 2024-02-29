import 'dart:async';

import 'package:final_year_project/custom_widget/login_custom_button.dart';
import 'package:final_year_project/screens/home_screens/home_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gap/gap.dart';

import '../my_profile_screens/my_account_screen.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  bool emailVerified = false;
  Timer? timer;

  @override
  void initState() {
    FirebaseAuth.instance.currentUser!.sendEmailVerification();

    timer = Timer.periodic(const Duration(seconds: 10), (timer) {
      verificationCheck();
    });

    super.initState();
  }

  verificationCheck() {
    FirebaseAuth.instance.currentUser!.reload();
    if (FirebaseAuth.instance.currentUser!.emailVerified) {
      timer!.cancel();
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomeSplashScreen()));
    }
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: const [],
        ),
      ),
      appBar: AppBar(
        actions: [
          // IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) =>const  MyAccount()));
          }, icon: const Icon(Icons.person)),
        ],
        centerTitle: true,
        title: const Text('HiFashion'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Verify Your email!',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const Gap(10),
            Text(
                'Email has been sand on ${FirebaseAuth.instance.currentUser!.email}'),
            const Gap(20),
            const SpinKitDualRing(color: Colors.black),
            const Gap(20),
           CustomButton(text: 'Resend', onTap: (){
             setState(() {
               FirebaseAuth.instance.currentUser!
                   .sendEmailVerification();
             });
           })
          ],
        ),
      ),
    );
  }
}
