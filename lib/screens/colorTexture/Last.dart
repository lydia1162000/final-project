import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import '../matchingClothes.dart';
//import 'package:new_page/page2.dart';

class Last extends StatelessWidget {
  const Last({Key? key}) : super(key: key);

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
              height: 16,
            ),
            Image.asset(
              "assets/images/light.png",
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("with",
                    style: GoogleFonts.questrial(
                        textStyle: const TextStyle(
                            fontSize: 25, color: Colors.black))),
                const SizedBox(
                  width: 3.5,
                ),
                Text("Colblindor",
                    style: GoogleFonts.merienda(
                        textStyle: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w900,
                            color: Color.fromARGB(255, 103, 22, 106)))),
              ],
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
                textAlign: TextAlign.center,
                "wearing matching color clothes is NEVER a problem for you! These are all the color shades that go GREAT together ",
                style: GoogleFonts.questrial(
                    textStyle: const TextStyle(
                        fontSize: 23, color: Color.fromARGB(255, 77, 76, 76)))),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(90)),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Page2()));
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
                  "Check Them Now !",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
