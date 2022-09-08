import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/color_utils.dart';
import '../utils/fadin_animation.dart';
import 'colorTexture/detect_screen.dart';

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(backgroundColor),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 60,
        elevation: 0,
        foregroundColor: Colors.grey,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        actions: [
          InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: CircleAvatar(
                radius: 23,
                backgroundColor: const Color.fromARGB(255, 245, 242, 242),
                child: InkWell(
                  onTap: (() {
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) {
                      return DetectScreen();
                    })));
                  }),
                  child: const Icon(
                    Icons.camera_alt_outlined,
                    color: Color.fromARGB(255, 143, 143, 143),
                    size: 24,
                  ),
                ),
              ),
            ),
          ),
        ],
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
      body: ListView(
        children: <Widget>[
          FadeAnimation(
            delay: 1,
            child: Container(
              color: Colors.transparent,
              height: 100.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: listofitems(),
              ),
            ),
          ),
          FadeAnimation(
            delay: 1,
            child: Container(
              color: Colors.transparent,
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: listofitems2(),
              ),
            ),
          ),
          FadeAnimation(
            delay: 1.2,
            child: Container(
              color: Colors.transparent,
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: listofitems3(),
              ),
            ),
          ),
          FadeAnimation(
            delay: 1.2,
            child: SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: listofitems4(),
              ),
            ),
          ),
          FadeAnimation(
            delay: 1.2,
            child: SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: listofitems5(),
              ),
            ),
          ),
          FadeAnimation(
            delay: 1.2,
            child: SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: listofitems6(),
              ),
            ),
          ),
          SizedBox(
            height: 3,
          ),
          Text("Here are some Suggestions",
              textAlign: TextAlign.center,
              style: GoogleFonts.questrial(
                  textStyle: const TextStyle(
                      fontSize: 23.5, color: Color.fromARGB(255, 79, 79, 79)))),
          SizedBox(
            height: 3,
          ),
          FadeAnimation(
            delay: 1.5,
            child: SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: listofitems7(),
              ),
            ),
          ),
          FadeAnimation(
            delay: 1.5,
            child: SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: listofitems8(),
              ),
            ),
          ),
          FadeAnimation(
            delay: 1.5,
            child: SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: listofitems9(),
              ),
            ),
          ),
          FadeAnimation(
            delay: 1.5,
            child: SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: listofitems10(),
              ),
            ),
          ),
        ],
      ),

      // body: Center(
      //     child: ElevatedButton(
      //   onPressed: () {
      //     Navigator.pop(context);
      //   },
      //   child: Text("press me back"),
      // )),
    );
  }
}

List<Widget> listofitems() {
  return [
    Container(
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          boxShadow: [shadow],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: const Center(
        child: Image(
          image: AssetImage('assets/images/DARK-PURPLE.png'),
          height: 90,
          width: 90,
        ),
      ),
    ),
    Container(
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          boxShadow: [shadow],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: const Center(
        child: Image(
          image: AssetImage('assets/images/PURPLE.png'),
          height: 90,
          width: 90,
        ),
      ),
    ),
    Container(
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          boxShadow: [shadow],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: const Center(
        child: Image(
          image: AssetImage('assets/images/LIGHT-PURPLE.png'),
          height: 90,
          width: 90,
        ),
      ),
    ),
    Container(
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          boxShadow: [shadow],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: const Center(
        child: Image(
          image: AssetImage('assets/images/LIGHT-GRAY11.png'),
          height: 90,
          width: 90,
        ),
      ),
    ),
    Container(
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          boxShadow: [shadow],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: const Center(
        child: Image(
          image: AssetImage('assets/images/LIGHT-BLUE.png'),
          height: 90,
          width: 90,
        ),
      ),
    ),
    Container(
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          boxShadow: [shadow],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: const Center(
        child: Image(
          image: AssetImage('assets/images/WHITE1.png'),
          height: 90,
          width: 90,
        ),
      ),
    ),

    Container(
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          boxShadow: [shadow],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: const Center(
        child: Image(
          image: AssetImage('assets/images/SILVER.png'),
          height: 90,
          width: 90,
        ),
      ),
    ),
    Container(
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          boxShadow: [shadow],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: const Center(
        child: Image(
          image: AssetImage('assets/images/DARK-BROWN.png'),
          height: 90,
          width: 90,
        ),
      ),
    ),
    Container(
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          boxShadow: [shadow],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: const Center(
        child: Image(
          image: AssetImage('assets/images/BLACK.png'),
          height: 90,
          width: 90,
        ),
      ),
    ),
    // Image(
    //   image: AssetImage('assets/images/red2.png'),
    //   height: 90,
    //   width: 90,
    // ),
    // Image(
    //   image: AssetImage('assets/images/red(3)(4).png'),
    //   height: 90,
    //   width: 90,
    // ),
    // Column(
    //   children: [
    //     Container(
    //       color: Colors.blue,
    //       child: const Image(
    //         image: const AssetImage(
    //             'assets/images/noun-coloradd-blue-1405173-E6011C.png'),
    //         height: 70,
    //         width: 70,
    //       ),
    //     ),
    //     const Text(
    //       'Rad',
    //       style: const TextStyle(color: Colors.amber),
    //     )
    //   ],
    // ),

    // Column(
    //   children: [
    //     const Image(
    //       image: const AssetImage('assets/images/red(3)(4).png'),
    //       height: 90,
    //       width: 90,
    //     ),
    //     const Text(
    //       'RED',
    //       style: TextStyle(color: Colors.red),
    //     )
    //   ],
    // ),
  ];
}

List<Widget> listofitems2() {
  return [
    Container(
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          boxShadow: [shadow],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: const Center(
        child: Image(
          image: AssetImage('assets/images/DARK-BLUE.png'),
          height: 90,
          width: 90,
        ),
      ),
    ),
    Container(
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          boxShadow: [shadow],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: const Center(
        child: Image(
          image: AssetImage('assets/images/blue.png'),
          height: 90,
          width: 90,
        ),
      ),
    ),
    Container(
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          boxShadow: [shadow],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: const Center(
        child: Image(
          image: AssetImage('assets/images/LIGHT-BLUE.png'),
          height: 90,
          width: 90,
        ),
      ),
    ),
    // Image(
    //   image: AssetImage('assets/images/LIGHT-PURPLE.png'),
    //   height: 90,
    //   width: 90,
    // ),
    Container(
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          boxShadow: [shadow],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: const Center(
        child: Image(
          image: AssetImage('assets/images/LIGHT-BROWN.png'),
          height: 90,
          width: 90,
        ),
      ),
    ),
    Container(
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          boxShadow: [shadow],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: const Center(
        child: Image(
          image: AssetImage('assets/images/WHITE1.png'),
          height: 90,
          width: 90,
        ),
      ),
    ),
    Container(
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          boxShadow: [shadow],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: const Center(
        child: Image(
          image: AssetImage('assets/images/LIGHT-GRAY11.png'),
          height: 90,
          width: 90,
        ),
      ),
    ),
    Container(
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          boxShadow: [shadow],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: const Center(
        child: Image(
          image: AssetImage('assets/images/dark-GRAY.png'),
          height: 90,
          width: 90,
        ),
      ),
    ),
    Container(
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          boxShadow: [shadow],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: const Center(
        child: Image(
          image: AssetImage('assets/images/SILVER.png'),
          height: 90,
          width: 90,
        ),
      ),
    ),
    Container(
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          boxShadow: [shadow],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: const Center(
        child: Image(
          image: AssetImage('assets/images/BLACK.png'),
          height: 90,
          width: 90,
        ),
      ),
    ),
  ];
}

List<Widget> listofitems3() {
  return [
    Container(
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          boxShadow: [shadow],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: const Center(
        child: Image(
          image: AssetImage('assets/images/DARK-GREEN.png'),
          height: 90,
          width: 90,
        ),
      ),
    ),
    Container(
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          boxShadow: [shadow],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: const Center(
        child: Image(
          image: AssetImage('assets/images/grean.png'),
          height: 90,
          width: 90,
        ),
      ),
    ),
    Container(
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          boxShadow: [shadow],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: const Center(
        child: Image(
          image: AssetImage('assets/images/LIGHT-GREEN.png'),
          height: 90,
          width: 90,
        ),
      ),
    ),
    // Image(
    //   image: AssetImage('assets/images/LIGHT-YELLOW.png'),
    //   height: 90,
    //   width: 90,
    // ),
    Container(
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          boxShadow: [shadow],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: const Center(
        child: Image(
          image: AssetImage('assets/images/DARK-YELLOW22.png'),
          height: 90,
          width: 90,
        ),
      ),
    ),
    Container(
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          boxShadow: [shadow],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: const Center(
        child: Image(
          image: AssetImage('assets/images/LIGHT-BROWN.png'),
          height: 90,
          width: 90,
        ),
      ),
    ),
    Container(
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          boxShadow: [shadow],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: const Center(
        child: Image(
          image: AssetImage('assets/images/gold.png'),
          height: 90,
          width: 90,
        ),
      ),
    ),
    Container(
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          boxShadow: [shadow],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: const Center(
        child: Image(
          image: AssetImage('assets/images/WHITE1.png'),
          height: 90,
          width: 90,
        ),
      ),
    ),
    Container(
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          boxShadow: [shadow],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: const Center(
        child: Image(
          image: AssetImage('assets/images/BROWN.png'),
          height: 90,
          width: 90,
        ),
      ),
    ),
    Container(
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          boxShadow: [shadow],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: const Center(
        child: Image(
          image: AssetImage('assets/images/BLACK.png'),
          height: 90,
          width: 90,
        ),
      ),
    ),
  ];
}

List<Widget> listofitems4() {
  return [
    Container(
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          boxShadow: [shadow],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: const Center(
        child: Image(
          image: AssetImage('assets/images/DARK-YELLOW22.png'),
          height: 90,
          width: 90,
        ),
      ),
    ),
    Container(
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          boxShadow: [shadow],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: const Center(
        child: Image(
          image: AssetImage('assets/images/yello.png'),
          height: 90,
          width: 90,
        ),
      ),
    ),
    Container(
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          boxShadow: [shadow],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: const Center(
        child: Image(
          image: AssetImage('assets/images/LIGHT-YELLOW.png'),
          height: 90,
          width: 90,
        ),
      ),
    ),
    // Image(
    //   image: AssetImage('assets/images/LIGHT-GREEN.png'),
    //   height: 90,
    //   width: 90,
    // ),
    Container(
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          boxShadow: [shadow],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: const Center(
        child: Image(
          image: AssetImage('assets/images/LIGHT-BROWN.png'),
          height: 90,
          width: 90,
        ),
      ),
    ),
    Container(
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          boxShadow: [shadow],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: const Center(
        child: Image(
          image: AssetImage('assets/images/BROWN.png'),
          height: 90,
          width: 90,
        ),
      ),
    ),
    Container(
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          boxShadow: [shadow],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: const Center(
        child: Image(
          image: AssetImage('assets/images/DARK-BROWN.png'),
          height: 90,
          width: 90,
        ),
      ),
    ),
    Container(
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          boxShadow: [shadow],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: const Center(
        child: Image(
          image: AssetImage('assets/images/gold.png'),
          height: 90,
          width: 90,
        ),
      ),
    ),
    Container(
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          boxShadow: [shadow],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: const Center(
        child: Image(
          image: AssetImage('assets/images/WHITE1.png'),
          height: 90,
          width: 90,
        ),
      ),
    ),
    Container(
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          boxShadow: [shadow],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: const Center(
        child: Image(
          image: AssetImage('assets/images/BLACK.png'),
          height: 90,
          width: 90,
        ),
      ),
    ),
  ];
}

List<Widget> listofitems5() {
  return [
    Container(
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          boxShadow: [shadow],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: const Center(
        child: Image(
          image: AssetImage('assets/images/DARK-ORANGE.png'),
          height: 90,
          width: 90,
        ),
      ),
    ),
    Container(
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          boxShadow: [shadow],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: const Center(
        child: Image(
          image: AssetImage('assets/images/orange.png'),
          height: 90,
          width: 90,
        ),
      ),
    ),
    Container(
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          boxShadow: [shadow],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: const Center(
        child: Image(
          image: AssetImage('assets/images/LIGHT-ORANGE1.png'),
          height: 90,
          width: 90,
        ),
      ),
    ),
    Container(
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          boxShadow: [shadow],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: const Center(
        child: Image(
          image: AssetImage('assets/images/WHITE1.png'),
          height: 90,
          width: 90,
        ),
      ),
    ),
    Container(
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          boxShadow: [shadow],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: const Center(
        child: Image(
          image: AssetImage('assets/images/LIGHT-GRAY11.png'),
          height: 90,
          width: 90,
        ),
      ),
    ),
    Container(
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          boxShadow: [shadow],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: const Center(
        child: Image(
          image: AssetImage('assets/images/dark-GRAY.png'),
          height: 90,
          width: 90,
        ),
      ),
    ),
    Container(
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          boxShadow: [shadow],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: const Center(
        child: Image(
          image: AssetImage('assets/images/SILVER.png'),
          height: 90,
          width: 90,
        ),
      ),
    ),
    Container(
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          boxShadow: [shadow],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: const Center(
        child: Image(
          image: AssetImage('assets/images/BLACK.png'),
          height: 90,
          width: 90,
        ),
      ),
    ),
  ];
}

List<Widget> listofitems6() {
  return [
    Container(
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          boxShadow: [shadow],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: const Center(
        child: Image(
          image: AssetImage('assets/images/Dark-Red.png'),
          height: 90,
          width: 90,
        ),
      ),
    ),
    Container(
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          boxShadow: [shadow],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: const Center(
        child: Image(
          image: AssetImage('assets/images/red.png'),
          height: 90,
          width: 90,
        ),
      ),
    ),
    Container(
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          boxShadow: [shadow],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: const Center(
        child: Image(
          image: AssetImage('assets/images/LIGHT-RED.png'),
          height: 90,
          width: 90,
        ),
      ),
    ),
    // Image(
    //   image: AssetImage('assets/images/DARK-BLUE.png'),
    //   height: 90,
    //   width: 90,
    // ),
    Container(
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          boxShadow: [shadow],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: const Center(
        child: Image(
          image: AssetImage('assets/images/WHITE1.png'),
          height: 90,
          width: 90,
        ),
      ),
    ),
    Container(
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          boxShadow: [shadow],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: const Center(
        child: Image(
          image: AssetImage('assets/images/LIGHT-GRAY11.png'),
          height: 90,
          width: 90,
        ),
      ),
    ),
    Container(
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          boxShadow: [shadow],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: const Center(
        child: Image(
          image: AssetImage('assets/images/dark-GRAY.png'),
          height: 90,
          width: 90,
        ),
      ),
    ),
    Container(
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          boxShadow: [shadow],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: const Center(
        child: Image(
          image: AssetImage('assets/images/SILVER.png'),
          height: 90,
          width: 90,
        ),
      ),
    ),
    Container(
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          boxShadow: [shadow],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: const Center(
        child: Image(
          image: AssetImage('assets/images/BLACK.png'),
          height: 90,
          width: 90,
        ),
      ),
    ),
  ];
}

List<Widget> listofitems7() {
  return [
    // Image(
    //   image: AssetImage('assets/icons/shirts.png'),
    //   height: 80,
    //   width: 80,
    // ),
    Container(
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          boxShadow: [shadow],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: const Center(
        child: Image(
          image: AssetImage('assets/icons/t-shirt.png'),
          height: 80,
          width: 80,
        ),
      ),
    ),
    Container(
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          boxShadow: [shadow],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: const Center(
        child: Image(
          image: AssetImage('assets/images/LIGHT-RED.png'),
          height: 90,
          width: 90,
        ),
      ),
    ),
    Container(
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          boxShadow: [shadow],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: const Center(
        child: Image(
          image: AssetImage('assets/images/LIGHT-BLUE.png'),
          height: 90,
          width: 90,
        ),
      ),
    ),
    Container(
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          boxShadow: [shadow],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: const Center(
        child: Image(
          image: AssetImage('assets/images/LIGHT-PURPLE.png'),
          height: 90,
          width: 90,
        ),
      ),
    ),
    Container(
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          boxShadow: [shadow],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: const Center(
        child: Image(
          image: AssetImage('assets/images/LIGHT-YELLOW.png'),
          height: 90,
          width: 90,
        ),
      ),
    ),
    Container(
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          boxShadow: [shadow],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: const Center(
        child: Image(
          image: AssetImage('assets/images/LIGHT-GREEN.png'),
          height: 90,
          width: 90,
        ),
      ),
    ),
    Container(
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          boxShadow: [shadow],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: const Center(
        child: Image(
          image: AssetImage('assets/icons/newpan.png'),
          height: 75,
          width: 75,
        ),
      ),
    ),

    Container(
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          boxShadow: [shadow],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: const Center(
        child: Image(
          image: AssetImage('assets/images/dark-GRAY.png'),
          height: 90,
          width: 90,
        ),
      ),
    ),
    Container(
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          boxShadow: [shadow],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: const Center(
        child: Image(
          image: AssetImage('assets/images/BLACK.png'),
          height: 90,
          width: 90,
        ),
      ),
    ),
  ];
}

List<Widget> listofitems8() {
  return [
    Container(
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          boxShadow: [shadow],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: const Center(
        child: Image(
          image: AssetImage('assets/icons/pullover.png'),
          height: 80,
          width: 80,
        ),
      ),
    ),
    Container(
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          boxShadow: [shadow],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: const Center(
        child: Image(
          image: AssetImage('assets/images/DARK-PURPLE.png'),
          height: 90,
          width: 90,
        ),
      ),
    ),
    Container(
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          boxShadow: [shadow],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: const Center(
        child: Image(
          image: AssetImage('assets/images/DARK-YELLOW22.png'),
          height: 90,
          width: 90,
        ),
      ),
    ),
    Container(
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          boxShadow: [shadow],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: const Center(
        child: Image(
          image: AssetImage('assets/images/DARK-ORANGE.png'),
          height: 90,
          width: 90,
        ),
      ),
    ),
    Container(
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          boxShadow: [shadow],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: const Center(
        child: Image(
          image: AssetImage('assets/images/Dark-Red.png'),
          height: 90,
          width: 90,
        ),
      ),
    ),
    Container(
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          boxShadow: [shadow],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: const Center(
        child: Image(
          image: AssetImage('assets/icons/newpan.png'),
          height: 75,
          width: 75,
        ),
      ),
    ),
    Container(
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          boxShadow: [shadow],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: const Center(
        child: Image(
          image: AssetImage('assets/images/WHITE1.png'),
          height: 90,
          width: 90,
        ),
      ),
    ),
    Container(
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          boxShadow: [shadow],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: const Center(
        child: Image(
          image: AssetImage('assets/images/LIGHT-GRAY11.png'),
          height: 90,
          width: 90,
        ),
      ),
    ),
  ];
}

List<Widget> listofitems9() {
  return [
    Container(
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          boxShadow: [shadow],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: const Center(
        child: Image(
          image: AssetImage('assets/icons/smiling-girl.png'),
          height: 75,
          width: 75,
        ),
      ),
    ),
    Container(
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          boxShadow: [shadow],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: const Center(
        child: Image(
          image: AssetImage('assets/icons/color-palette1.png'),
          height: 70,
          width: 70,
        ),
      ),
    ),
    Container(
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          boxShadow: [shadow],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: const Center(
        child: Image(
          image: AssetImage('assets/images/LIGHT-BLUE.png'),
          height: 90,
          width: 90,
        ),
      ),
    ),
    Container(
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          boxShadow: [shadow],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: const Center(
        child: Image(
          image: AssetImage('assets/images/LIGHT-PURPLE.png'),
          height: 90,
          width: 90,
        ),
      ),
    ),
    Container(
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          boxShadow: [shadow],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: const Center(
        child: Image(
          image: AssetImage('assets/images/LIGHT-YELLOW.png'),
          height: 90,
          width: 90,
        ),
      ),
    ),
    Container(
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          boxShadow: [shadow],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: const Center(
        child: Image(
          image: AssetImage('assets/images/LIGHT-GREEN.png'),
          height: 90,
          width: 90,
        ),
      ),
    ),
    Container(
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          boxShadow: [shadow],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: const Center(
        child: Image(
          image: AssetImage('assets/images/WHITE1.png'),
          height: 90,
          width: 90,
        ),
      ),
    ),
    Container(
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          boxShadow: [shadow],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: const Center(
        child: Image(
          image: AssetImage('assets/images/LIGHT-GRAY11.png'),
          height: 90,
          width: 90,
        ),
      ),
    ),
  ];
}

List<Widget> listofitems10() {
  return [
    Container(
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          boxShadow: [shadow],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: const Center(
        child: Image(
          image: AssetImage('assets/icons/boy-smiling.png'),
          height: 75,
          width: 75,
        ),
      ),
    ),
    Container(
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          boxShadow: [shadow],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: const Center(
        child: Image(
          image: AssetImage('assets/icons/colour.png'),
          height: 70,
          width: 70,
        ),
      ),
    ),
    Container(
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          boxShadow: [shadow],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: const Center(
        child: Image(
          image: AssetImage('assets/images/blue.png'),
          height: 90,
          width: 90,
        ),
      ),
    ),
    Container(
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          boxShadow: [shadow],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: const Center(
        child: Image(
          image: AssetImage('assets/images/grean.png'),
          height: 90,
          width: 90,
        ),
      ),
    ),
    Container(
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          boxShadow: [shadow],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: const Center(
        child: Image(
          image: AssetImage('assets/images/orange.png'),
          height: 90,
          width: 90,
        ),
      ),
    ),
    Container(
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          boxShadow: [shadow],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: const Center(
        child: Image(
          image: AssetImage('assets/images/yello.png'),
          height: 90,
          width: 90,
        ),
      ),
    ),
    Container(
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          boxShadow: [shadow],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: const Center(
        child: Image(
          image: AssetImage('assets/images/WHITE1.png'),
          height: 90,
          width: 90,
        ),
      ),
    ),
    Container(
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          boxShadow: [shadow],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: const Center(
        child: Image(
          image: AssetImage('assets/images/BLACK.png'),
          height: 90,
          width: 90,
        ),
      ),
    ),
  ];
}
