import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../utils/color_utils.dart';
import 'matchingClothes.dart';

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 60,
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: Text(
            "Colblindor",
            style: GoogleFonts.meriendaOne(
                color: Colors.white, fontWeight: FontWeight.w900),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
                gradient: LinearGradient(colors: [
                  hexStringToColor("CB2B93"),
                  hexStringToColor("9546C4"),
                  hexStringToColor("5E61F4")
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          ),

          // actions: [
          //   Padding(
          //     padding: const EdgeInsets.all(5),
          //     child: CircleAvatar(
          //       backgroundImage: AssetImage('assets/images/Logoo.png'),
          //       radius: 24,
          //     ),
          //   )
          // ],
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                  flex: 4,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        image: DecorationImage(
                            image: AssetImage('assets/icons/test4.jpg'),
                            fit: BoxFit.fill)),
                  )),
              // Divider(
              //   color: Color.fromARGB(255, 118, 9, 137),
              //   thickness: 1,
              // ),
              Expanded(
                  flex: 1,
                  child: Center(
                      child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Page2()));
                    },
                    child: Text(
                      "Check them now",
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: HexColor('#8A02AE'),
                      onPrimary: Colors.white,
                      animationDuration: Duration(seconds: 1),
                      shape: StadiumBorder(),
                      padding: EdgeInsets.all(20),
                      elevation: 20,
                      textStyle: TextStyle(fontSize: 17),
                    ),
                  ))),
            ],
          ),
        ));
  }
}
