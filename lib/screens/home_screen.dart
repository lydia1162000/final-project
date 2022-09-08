//import 'dart:html';

import 'package:colblindor2/screens/chat_screen.dart';
import 'package:colblindor2/screens/colorTexture/detect_screen.dart';
import 'package:colblindor2/screens/colorTexture/helper.dart';
import 'package:colblindor2/screens/food.dart';
import 'package:colblindor2/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import '../authentication/repository/authentication_repository.dart';
import '../authentication/repository/user_repo.dart';
import 'colorTexture/Last.dart';
import 'home.dart';
import 'new.dart';

class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<UserRepository>(context, listen: false).getUser();

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      drawer: Consumer<UserRepository>(
        builder: (context, value, child) {
          return Drawer(
            // backgroundColor: HexColor('#ece6ed'),
            width: size.width * .7,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: size.height * .05),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Image.asset(
                          'assets/images/loginIcon.png',
                          height: size.height * 0.14,
                          width: size.width * 0.5,
                        ),
                      ),
                      Text(value.user.name ?? "",
                          style: GoogleFonts.questrial(
                              textStyle: TextStyle(
                                  fontSize: size.height * .03,
                                  color: Colors.black))),

                      // style: GoogleFonts.questrial(
                      //   textStyle: TextStyle(
                      //    fontSize: size.height * .03,
                      //       color: Color.fromARGB(255, 62, 62, 62)))),
                      Text(value.user.email ?? "",
                          style: GoogleFonts.questrial(
                              textStyle: TextStyle(
                                  fontSize: size.height * .02,
                                  color: Colors.black))),
                    ],
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) {
                      return const MyHome();
                    })));
                  },
                  leading: Icon(
                    Icons.home,
                    size: size.height * .04,
                  ),
                  title: Text('Home ',
                      style: GoogleFonts.questrial(
                          textStyle: TextStyle(
                              fontSize: size.height * .03,
                              color: const Color.fromARGB(255, 62, 62, 62)))),
                ),
                //fontSize: size.height * .03
                //   style: GoogleFonts.questrial(
                //     textStyle: const TextStyle(
                //         fontSize: 23, color: Color.fromARGB(255, 77, 76, 76)))),
                // ),
                ListTile(
                  onTap: (() {
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) {
                      return const MyProfile();
                    })));
                  }),
                  leading: Icon(
                    Icons.person,
                    size: size.height * .04,
                  ),
                  title: Text('Profile  ',
                      style: GoogleFonts.questrial(
                          textStyle: TextStyle(
                              fontSize: size.height * .03,
                              color: const Color.fromARGB(255, 62, 62, 62)))),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) {
                      return const Food();
                    })));
                  },
                  leading: Icon(
                    Icons.shopping_basket,
                    size: size.height * .04,
                  ),
                  title: Text('Helping cards ',
                      style: GoogleFonts.questrial(
                          textStyle: TextStyle(
                              fontSize: size.height * .03,
                              color: const Color.fromARGB(255, 62, 62, 62)))),
                ),
                ListTile(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const Last()),
                    );
                  },
                  leading: Icon(
                    Icons.color_lens,
                    size: size.height * .04,
                  ),
                  title: Text('color schem ',
                      style: GoogleFonts.questrial(
                          textStyle: TextStyle(
                              fontSize: size.height * .03,
                              color: const Color.fromARGB(255, 62, 62, 62)))),
                ),
                ListTile(
                  onTap: () {
                    Provider.of<AuthenticationRepository>(context,
                            listen: false)
                        .signOut();
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  leading: Icon(
                    Icons.logout,
                    size: size.height * .04,
                  ),
                  title: Text('Log out  ',
                      style: GoogleFonts.questrial(
                          textStyle: TextStyle(
                              fontSize: size.height * .03,
                              color: const Color.fromARGB(255, 62, 62, 62)))),
                )
              ],
            ),
          );
        },
      ),
      backgroundColor: HexColor('#ece6ed'),
      appBar: AppBar(
        // leading: IconButton(
        //     onPressed: () {
        //       Provider.of<AuthenticationRepository>(context, listen: false)
        //           .signOut();
        //       Navigator.of(context).pushAndRemoveUntil(
        //           MaterialPageRoute(builder: (context) => HomePage()),
        //           (route) => false);
        //     },
        //     icon: const Icon(Icons.logout)),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 103, 22, 106),
        elevation: 0.0,
        toolbarHeight: 60,
        title: Text('Choose One',
            style: GoogleFonts.meriendaOne(
              fontSize: 23,
              fontWeight: FontWeight.w600,
            )),

        // flexibleSpace: Container(
        //   decoration: BoxDecoration(
        //       borderRadius: const BorderRadius.only(
        //           bottomLeft: Radius.circular(30),
        //           bottomRight: Radius.circular(30)),
        //       gradient: LinearGradient(colors: [
        //         hexStringToColor("CB2B93"),
        //         hexStringToColor("9546C4"),
        //         hexStringToColor("9546C4")
        //       ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        // ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(
              vertical: (size.height * .1), horizontal: (size.width * .05)),
          //,
          child: Column(
            children: [
              InkWell(
                onTap: (() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) {
                    return const New();
                  })));
                }),
                child: Container(
                  height: 120,
                  // width: 350,
                  color: Colors.white,
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Container(
                              child: Image.asset(
                            'assets/images/Knowledge.png',
                            height: 80,
                          ))),
                      Expanded(
                          flex: 1,
                          child: Container(
                              child: Text(
                            'Types of Color Blindness',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.questrial(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ))),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: (() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) {
                    return DetectScreen();
                  })));
                }),
                child: Container(
                  height: 120,
                  // width: 350,
                  color: Colors.white,
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Image.asset(
                            'assets/images/Camera.png',
                            height: 80,
                          )),
                      Expanded(
                          flex: 1,
                          child: Text(
                            'Open Camera',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.questrial(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          )),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: (() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) {
                    return const ColblindorHelp();
                  })));
                }),
                child: Container(
                  height: 120,
                  //   width: 350,
                  color: Colors.white,
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Image.asset(
                            'assets/images/palette.png',
                            height: 80,
                          )),
                      Expanded(
                          flex: 1,
                          child: Text(
                            'Colblindor Helper',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.questrial(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          )),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: (() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) {
                    return const ChatScreen();
                  })));
                }),
                child: Container(
                  height: 120,
                  //width: 350,
                  color: Colors.white,
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Container(
                              child: Image.asset(
                            'assets/images/Chatting.png',
                            height: 80,
                          ))),
                      Expanded(
                        flex: 1,
                        child: Container(
                          child: Text(
                            'Global Chat',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.questrial(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
/*
 - asset/tri.png
    - asset/pro.png
    - asset/deu.png
    - asset/star-pot.png
    - asset/Next-p.png
    - asset/Next-tri.png
    - asset/Next-d.png
    - asset/star-tri.png
    - asset/star-pot.png
    - asset/Rectangle.png
    - asset/messaging.png
    - asset/Camera.png
    - asset/Chatting.png
    - asset/Knowledge.png
    - asset/palette.png
    - asset/mono.png
*/
