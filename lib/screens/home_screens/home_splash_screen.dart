import 'package:final_year_project/custom_widget/login_custom_button.dart';
import 'package:final_year_project/screens/customer_home_screen.dart';

import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

class HomeSplashScreen extends StatelessWidget {
  const HomeSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('HiFashion',style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/homeScreenImage.png'),
                  fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    'Luxury\n Fashion\n & Accessories',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w800,
                      // fontFamily: GoogleFonts.bodoniModa().fontFamily,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                ),
                CustomButton(
                  text: 'EXPLORE COLLECTION',
                  onTap: () {
                    // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const NewArrivalScreen1()));
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                      return const CustomerDashboard();
                    }));
                  },
                  backgroundColor: Colors.black,
                  textStyle: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
