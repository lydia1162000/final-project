import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../food.dart';
import 'Last.dart';
//import 'package:newaddition/food.dart';

class ColblindorHelp extends StatelessWidget {
  const ColblindorHelp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        elevation: 0,
        foregroundColor: Colors.grey,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        // backgroundColor: Color.fromARGB(255, 124, 8, 145),

        // title: Text(
        //   "Colblindor helper",
        //   style: GoogleFonts.meriendaOne(
        //       // color: Colors.white,
        //       color: Color.fromARGB(255, 78, 39, 85),
        //       fontWeight: FontWeight.w900),
        // ),
        // flexibleSpace: Container(
        //   decoration: BoxDecoration(
        //       borderRadius: BorderRadius.only(
        //           bottomLeft: Radius.circular(30),
        //           bottomRight: Radius.circular(30)),
        //       gradient: LinearGradient(colors: [
        //         Color(0xFF8A02AE),
        //         Color(0xFFDC54FE),
        //       ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
        // ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            SvgPicture.asset(
              "assets/icons/undraw_shared_goals_re_jvqd.svg",
              height: 227,
              width: 227,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Colblindor",
                    style: GoogleFonts.merienda(
                        textStyle: const TextStyle(
                            fontSize: 31,
                            fontWeight: FontWeight.w900,
                            color: Color.fromARGB(255, 103, 22, 106)))),
                const SizedBox(
                  width: 3.5,
                ),
                Text(
                    textAlign: TextAlign.left,
                    "always here  ",
                    style: GoogleFonts.questrial(
                        textStyle: const TextStyle(
                            fontSize: 23,
                            color: Color.fromARGB(255, 77, 76, 76)))),
              ],
            ),
            // SizedBox(
            //   height: 2,
            // ),
            Text(
                textAlign: TextAlign.center,
                "to be your right hand and make your life much easier , how can we help you? ",
                style: GoogleFonts.questrial(
                    textStyle: const TextStyle(
                        fontSize: 23, color: Color.fromARGB(255, 77, 76, 76)))),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(90)),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Food()));
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.resolveWith((states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.black26;
                      }
                      return const Color.fromARGB(255, 103, 22, 106);
                    }),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)))),
                child: const Text(
                  "Picking Food & Cooking",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
            ),

            // Container(
            //   decoration: BoxDecoration(
            //       color: const Color.fromARGB(255, 78, 39, 85),
            //       borderRadius: BorderRadius.circular(25)),
            //   height: 52,
            //   width: 300,
            //   child: MaterialButton(
            //     onPressed: () {
            //       Navigator.push(context,
            //           MaterialPageRoute(builder: (context) => const Last()));
            //     },
            //     child: Text(
            //       "Picking Outfits",
            //       style: GoogleFonts.merienda(
            //         textStyle: const TextStyle(
            //             fontSize: 18,
            //             fontWeight: FontWeight.bold,
            //             color: Colors.white),
            //       ),
            //     ),
            //   ),
            // ),
            // const SizedBox(
            //   height: 10,
            // ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(90)),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Last()));
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.resolveWith((states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.black26;
                      }
                      return const Color.fromARGB(255, 103, 22, 106);
                    }),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)))),
                child: const Text(
                  "Picking Outfits",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
            ),
            // Container(
            //   decoration: BoxDecoration(
            //       color: const Color.fromARGB(255, 78, 39, 85),
            //       borderRadius: BorderRadius.circular(25)),
            //   height: 52,
            //   width: 300,
            //   child: MaterialButton(
            //     onPressed: () {
            //       Navigator.push(context,
            //           MaterialPageRoute(builder: (context) => const Food()));
            //     },
            //     child: Text(
            //       "Picking Food & Cooking",
            //       style: GoogleFonts.merienda(
            //         textStyle: const TextStyle(
            //             fontSize: 18,
            //             fontWeight: FontWeight.bold,
            //             color: Colors.white),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
