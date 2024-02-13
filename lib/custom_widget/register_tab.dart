import 'package:flutter/material.dart';

import 'custom_button.dart';

class RegisterTab extends StatefulWidget {
  const RegisterTab({super.key});

  @override
  State<RegisterTab> createState() => _RegisterTabState();
}

class _RegisterTabState extends State<RegisterTab> {
  TextEditingController? emailC, passwordC;
  TextEditingController? name;

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Form(
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
                TextField(
                  controller: name,
                  decoration: const InputDecoration(hintText: 'First name'),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: emailC,
                  decoration: const InputDecoration(hintText: 'Email Adress'),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: passwordC,
                  decoration: const InputDecoration(hintText: 'Password'),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextButton(
                    onPressed: () {}, child: const Text('Forgot password?')),
                const SizedBox(
                  height: 15,
                ),
                CustomButton(
                  text: 'SIGN IN',
                  onTap: () {},
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
