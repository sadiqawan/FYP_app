import 'package:final_year_project/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

import 'custom_button.dart';

class SignInTab extends StatefulWidget {
  const SignInTab({super.key});

  @override
  State<SignInTab> createState() => _SignInTabState();
}

class _SignInTabState extends State<SignInTab> {

  TextEditingController? emailC, passwordC;

  @override
  Widget build(BuildContext context) {
    return  ListView(children: [
      Form(
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
                TextField(
                  controller: emailC,
                  decoration: const InputDecoration(hintText: 'Email Adress'),
                ),
                const SizedBox(
                  height: 25,
                ),
                TextField(
                  controller: passwordC,
                  decoration: const InputDecoration(hintText: 'Password'),
                ),
                const SizedBox(
                  height: 25,
                ),
                TextButton(
                    onPressed: () {}, child: const Text('Forgot password?')),
                const SizedBox(
                  height: 30,
                ),
                CustomButton(
                  text: 'SIGN IN',
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const WelcomeScreen()));
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
