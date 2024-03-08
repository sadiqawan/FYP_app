import 'package:final_year_project/screens/home_screens/home_splash_screen.dart';
import 'package:final_year_project/screens/auth_screen/verification_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../custom_widget/login_custom_button.dart';
import '../../screens/auth_screen/forget_password.dart';

class SignInTab extends StatefulWidget {
  const SignInTab({super.key});

  @override
  State<SignInTab> createState() => _SignInTabState();
}

class _SignInTabState extends State<SignInTab> {
  final formKey = GlobalKey<FormState>();
  String? emailC, passwordC;
  bool obscureText = true;

  @override
  void initState() {
    emailC;
    passwordC;
    super.initState();
  }

  @override
  void deactivate() {
    emailC;
    passwordC;
    // TODO: implement deactivate
    super.deactivate();
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
                  'HAVE AN ACCOUNT ?',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  ' Sign in to speed up the checkout\nprocess and manage your orders.',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 25,
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
                  height: 25,
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
                  height: 25,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return const ForgotPasswordScreen();
                      }));
                    }, child: const Text('Forgot password?')),
                const SizedBox(
                  height: 30,
                ),
                CustomButton(
                  text: 'SIGN IN',
                  onTap: () async {
                    try {
                      if (formKey.currentState!.validate()) {
                        FirebaseAuth auth = FirebaseAuth.instance;
                        UserCredential userCre =
                            await auth.signInWithEmailAndPassword(
                          email: emailC.toString(),
                          password: passwordC.toString(),
                        );
                        if (userCre.user!.emailVerified) {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                                builder: (context) => const HomeSplashScreen()),
                          );
                        } else {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return const VerificationScreen();
                          }));
                        }
                      }
                    } on FirebaseAuthException catch (e) {
                      Fluttertoast.showToast(msg: e.message!, fontSize: 25);
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
