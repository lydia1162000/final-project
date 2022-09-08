// ignore_for_file: unnecessary_new

import 'dart:async';

import 'package:colblindor2/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//import 'package:register/home.dart';

import '../authentication/repository/authentication_repository.dart';
import '../utils/color_utils.dart';
import 'home.dart';
//import 'login.dart';

//HomePage

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isVisible = false;

  _SplashScreenState() {
    new Timer(const Duration(milliseconds: 2000), () {
      setState(() {
        Provider.of<AuthenticationRepository>(context, listen: false).isLogin()
            ? Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const MyHome()),
                (route) => false)
            : Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => HomePage()),
                (route) => false);
      });
    });

    new Timer(const Duration(milliseconds: 10), () {
      setState(() {
        _isVisible =
            true; // Now it is showing fade effect and navigating to Login page
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        hexStringToColor("#8A02AE"),
        hexStringToColor("5E61F4"),
        hexStringToColor("#DC54FE")
      ])),
      child: Center(
        child: SizedBox(
          height: 195,
          width: 195,
          child: Image.asset('assets/images/Colblindor111.png'),
        ),
      ),
      // decoration: BoxDecoration(
      //     gradient: LinearGradient(colors: [
      //   hexStringToColor("#8A02AE"),
      //   hexStringToColor("5E61F4"),
      //   hexStringToColor("#DC54FE") //
      // ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      // child: AnimatedOpacity(
      //   opacity: _isVisible ? 1.0 : 0,
      //   duration: const Duration(milliseconds: 1200),
      //   child: SizedBox(
      //     width: 200,
      //     height: 200,

      //   ),
      //   // child: Center(
      //   //   child:
      //   //       Image.asset('Colordetect-main/assets/images/Colblindor111.png'),
      //   //   // child: Container(
      //   //   //     height: 140.0,
      //   //   //     width: 140.0,
      //   //   //     decoration: BoxDecoration(
      //   //   //         shape: BoxShape.circle,
      //   //   //         color: Colors.white,
      //   //   //         boxShadow: [
      //   //   //           BoxShadow(
      //   //   //             color: Colors.black.withOpacity(0.3),
      //   //   //             blurRadius: 2.0,
      //   //   //             offset: const Offset(5.0, 3.0),
      //   //   //             spreadRadius: 2.0,
      //   //   //           )
      //   //   //         ]),
      //   //   //     child: Container(
      //   //   //         decoration: const BoxDecoration(
      //   //   //       image: DecorationImage(
      //   //   //         image: AssetImage(
      //   //   //             "Colordetect-main/assets/images/Colblindor111.png"),
      //   //   //       ),
      //   //   //     ))),
      //   // ),
      // ),
    );
  }
}
