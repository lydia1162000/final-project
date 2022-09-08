import 'package:carousel_slider/carousel_slider.dart';
import 'package:colblindor2/screens/signin_screen.dart';
import 'package:colblindor2/screens/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../reusable_widgets/reusable_widget.dart';
import '../utils/color_utils.dart';
//import 'package:hexcolor/hexcolor.dart';
//import 'package:register/signup.dart';

//import 'login.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _currentIndex;

  List imgList = [
    "images/p1.png",
    "images/p2.png",
    "images/p3.png",
    "images/p4.png",
    "images/p5.png",
    "images/p6.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: const Drawer(),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            hexStringToColor("CB2B93"),
            /**CB2B93 */
            hexStringToColor("9546C4"),
            hexStringToColor("5E61F4")
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          // we will give media query height
          // double.infinity make it big as my parent allows
          // while MediaQuery make it big as per the screen
          padding: EdgeInsets.fromLTRB(
              20, MediaQuery.of(context).size.height * 0.1, 20, 20),
          child: Column(
            // even space distribution
            //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              /* const SizedBox(
                height: 30,
              ),*/
              CarouselSlider(
                options: CarouselOptions(
                    height: 300,
                    initialPage: 0,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    onPageChanged: (index, _) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    enableInfiniteScroll: true,
                    pauseAutoPlayOnTouch: false,
                    reverse: true,
                    //scrollDirection: Axis.vertical,
                    autoPlayInterval: const Duration(seconds: 3)),
                items: imgList.map((imageUrl) {
                  return SizedBox(
                    width: double.infinity,
                    //margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Image.asset(
                      imageUrl,
                      fit: BoxFit.fill,
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(
                height: 20,
              ),
              /* Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildContainer(0),
                  buildContainer(1),
                  buildContainer(2),
                  buildContainer(3),
                  buildContainer(4),
                  buildContainer(5),
                ],
              ),*/
              Column(
                children: <Widget>[
                  Text("Colblindor",
                      style: GoogleFonts.meriendaOne(
                        fontSize: 27,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      )),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                      "A dream come true, now you can know the colors precisely and chat globally with many people",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.questrial(
                          textStyle: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                      ))),
                ],
              ),

              /*Container(
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/welcome.png")
                  )
                ),
              ),*/
              const SizedBox(
                height: 7,
              ),
              Column(
                children: <Widget>[
                  // the login button
                  firebaseUIButton(context, "Sign In", () {
                    FirebaseAuth.instance;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignInScreen()));
                  }),
                  /*MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    // defining the shape
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(50)),
                    child: Text(
                      "Login",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                  ),*/
                  // creating the signup button

                  firebaseUIButton(context, "Sign up", () {
                    FirebaseAuth.instance;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpScreen()));
                  }),
                  /*MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignupPage()));
                    },
                    color: HexColor('#8A02AE'),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    child: const Text(
                      "Sign up",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    ),
                  )*/
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Container buildContainer(index) {
    return Container(
      width: 10,
      height: 10,
      margin: const EdgeInsets.symmetric(horizontal: 3),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _currentIndex == index ? Colors.black : Colors.grey,
      ),
    );
  }
}
