import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'blog_screen.dart';
import 'contact_screen.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('About us')),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 450,
                color: const Color(0xFFF2F2F2),
                child: Column(
                  children: [
                    const Center(
                      child: Text(
                        'FOLLOW US',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Center(
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.facebook,
                              size: 50,
                            ))),
                    SizedBox(
                      height: 320,
                      child: Center(
                        child: GridView.count(
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8,
                          crossAxisCount: 2,
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            Image.asset('images/f1.png'),
                            Image.asset('images/f2.png'),
                            Image.asset('images/f3.png'),
                            Image.asset('images/f4.png'),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),


            const Divider(
              color: Colors.black,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(FontAwesomeIcons.twitter),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(FontAwesomeIcons.instagram),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(FontAwesomeIcons.youtube),
                ),
              ],
            ),
            const Divider(color: Colors.black),
            const Text('support@email.com'),
            const Text('+92-11111111'),
            const Text('8:00 - 12:00 EVERYDAY'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const AboutScreen()));
                    },
                    child: const Text('ABOUT')),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ContactScreen()));
                    },
                    child: const Text('CONTACT')),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const BlogScreen()));
                    },
                    child: const Text('BLOG')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
