import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_year_project/screens/auth_screen/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../custom_widget/login_custom_button.dart';

class RegisterTab extends StatefulWidget {
  const RegisterTab({super.key});

  @override
  State<RegisterTab> createState() => _RegisterTabState();
}

class _RegisterTabState extends State<RegisterTab> {
  final formKey = GlobalKey<FormState>();
  String? emailC, passwordC, nameC;
  bool obscureText = true;

  @override
  void initState() {
    emailC;
    passwordC;
    nameC;
    obscureText;
    super.initState();
  }

  @override
  void dispose() {
    emailC;
    passwordC;
    nameC;
    obscureText;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'NEW TO OPENFASHION ?',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  ' Sign in to speed up the checkout\n process and manage \nyour orders.',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 25,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: 'First name', prefixIcon: Icon(Icons.person)),
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Please provide name';
                    }
                    nameC = text.trim();
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: 'Email Address',
                      prefixIcon: Icon(Icons.person)),
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Please provide value';
                    }
                    emailC = text.trim();
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  obscureText: obscureText,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            obscureText = !obscureText;
                          });
                        },
                        icon: Icon(
                          obscureText ? Icons.visibility_off : Icons.visibility,
                        )),
                  ),
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Please provide value';
                    }
                    passwordC = text.trim();
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomButton(
                  text: 'REGISTER',
                  onTap: () async {
                    try {
                      if (formKey.currentState!.validate()) {
                        FirebaseAuth auth = FirebaseAuth.instance;
                        UserCredential? userC =
                            await auth.createUserWithEmailAndPassword(
                                email: emailC.toString().trim(),
                                password: passwordC.toString().trim());
                        if (userC.user != null) {
                          FirebaseFirestore firebaseFirestore =
                              FirebaseFirestore.instance;
                          firebaseFirestore
                              .collection('users')
                              .doc(userC.user!.uid)
                              .set({
                            'name': nameC,
                            'email': emailC,
                            'password': passwordC,
                            'uid': userC.user!.uid,
                            'createdOn': DateTime.now().millisecondsSinceEpoch,
                            'photo': null,
                          });
                          Fluttertoast.showToast(msg: 'Success', fontSize: 30);
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()));
                        }
                      }
                    } on FirebaseAuthException catch (e) {
                      print(e.code);
                      print(e.message!);
                      Fluttertoast.showToast(msg: e.message!, fontSize: 30);
                    }
                  },
                  backgroundColor: Colors.black,
                  textStyle: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                const SizedBox(
                  height: 25,
                ),
                const Text('OR'),
                const SizedBox(
                  height: 25,
                ),
                CustomButton(
                  text: 'SIGN IN WITH APPLE',
                  onTap: () {},
                  icon: Icons.apple_outlined,
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(
                  height: 25,
                ),
                const SizedBox(
                  height: 12,
                ),
                CustomButton(
                    text: 'SIGN IN WITH FACEBOOK',
                    onTap: () {},
                    icon: Icons.facebook,
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18)),
              ],
            ),
          )),
    ]);
  }
}
