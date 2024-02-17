import 'package:final_year_project/custom_widget/login_custom_button.dart';
import 'package:final_year_project/models/onbording_screen_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePageTabAll extends StatefulWidget {
  const HomePageTabAll({super.key});

  @override
  State<HomePageTabAll> createState() => _HomePageTabAllState();
}

class _HomePageTabAllState extends State<HomePageTabAll> {
  final PageController _pageController = PageController(initialPage: 0);

  final OnboardingData = onboardingData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Center(
              child: Text(
                'Just for You',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
            const SizedBox(
              height: 45,
            ),
            SizedBox(
              height: 340,

              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: PageView.builder(
                    itemCount: OnboardingData.length,
                    controller: _pageController,
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.black26,

                        child: Column(
                          children: [
                                           Padding(
                         padding: const EdgeInsets.all(20.0),
                         child: Image.asset(OnboardingData[index].image,height: 200,),
                                           ),
                            Text(OnboardingData[index].title,),
                            Text(OnboardingData[index].text),



                          ],
                        ),
                      );
                    }),
              ),
            ),
            const Center(
              child: Text(
                'New Arrival',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
            const SizedBox(height: 20,),
            SizedBox(
              height: 360,
              child: GridView(

                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  children: [
                    SizedBox(
                        child: Column(
                          children: [
                            Image.asset('images/img.png', height: 150,),
                          ],
                        )),
                    SizedBox(
                        child: Column(
                          children: [
                            Image.asset('images/img.png', height: 150,),
                          ],
                        )),
                    SizedBox(
                        child: Column(
                          children: [
                            Image.asset('images/img.png', height: 150,),
                          ],
                        )),
                    SizedBox(
                        child: Column(
                          children: [
                            Image.asset('images/img.png', height: 150,),
                          ],
                        )),


                  ]),
            ),
            const SizedBox(height: 30,),
            CustomButton(
              text: 'EXPLORE  >',
              backgroundColor: Colors.black,
              onTap: () {},
              icon: Icons.arrow_forward_ios,
              textStyle: const TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
            ),

            const Divider(
              color: Colors.black,
            ),
            Image.asset('images/img.png'),
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
            const Divider(
              color: Colors.black,
            ),
            const Text('support@email.com'),
            const Text('+92-11111111'),
            const Text('8:00 - 12:00 EVERYDAY'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(onPressed: () {}, child: const Text('ABOUT')),
                TextButton(onPressed: () {}, child: const Text('CONTACT')),
                TextButton(onPressed: () {}, child: const Text('BLOG')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
