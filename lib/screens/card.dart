import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colorTexture/detect_screen.dart';

class FoodCards extends StatelessWidget {
  const FoodCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: SingleChildScrollView(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Fruits & Vegetables",
                textAlign: TextAlign.left,
                style: GoogleFonts.questrial(
                    textStyle:
                        const TextStyle(fontSize: 26, color: Colors.black))),
            const SizedBox(
              height: 3,
            ),
            Card(
              elevation: 4,
              child: ListTile(
                title: Text("Banana",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.questrial(
                        textStyle: const TextStyle(
                            fontSize: 28, color: Colors.black))),
                subtitle: Text(
                    """Green : needs more time\nYellow :ripe fruit ,buy it !!\nBlack : overripe""",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                      fontSize: 17,
                    ))),
                trailing:
                    Image.asset("assets/images/banana_64728013.jpg", width: 80),
              ),
            ),
            Card(
              elevation: 4,
              child: ListTile(
                title: Text("Lemon",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.questrial(
                        textStyle: const TextStyle(
                            fontSize: 28, color: Colors.black))),
                subtitle: Text(
                    """Green : needs more time\nYellow :ripe fruit ,buy it !!\nBrown : overripe""",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                      fontSize: 17,
                    ))),
                trailing: Image.asset("assets/images/lemon-seeds-c-limon.jpg",
                    width: 80),
              ),
            ),
            Card(
              elevation: 4,
              child: ListTile(
                title: Text("Strawberry",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.questrial(
                        textStyle: const TextStyle(
                            fontSize: 28, color: Colors.black))),
                subtitle: Text(
                    """Green-White : needs more time\nRed :ripe fruit ,buy it !!\nDark Red-Black : overripe""",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                      fontSize: 17,
                    ))),
                trailing: Image.asset(
                    "assets/images/strawberry-on-white-background-to-represent-strawberry-tongue.jpg",
                    width: 90),
              ),
            ),
            Card(
              elevation: 4,
              child: ListTile(
                title: Text("Tomato",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.questrial(
                        textStyle: const TextStyle(
                            fontSize: 28, color: Colors.black))),
                subtitle: Text(
                    """Green : needs more time\nRed :ripe fruit ,buy it !!\nDark Red-Black : overripe""",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                      fontSize: 17,
                    ))),
                trailing:
                    Image.asset("assets/images/tomaotes.webp", width: 100),
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            Text("Meat & Chicken",
                textAlign: TextAlign.left,
                style: GoogleFonts.questrial(
                    textStyle:
                        const TextStyle(fontSize: 26, color: Colors.black))),
            const SizedBox(
              height: 3,
            ),
            Card(
              elevation: 4,
              child: ListTile(
                title: Text("Meat",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.questrial(
                        textStyle: const TextStyle(
                            fontSize: 28, color: Colors.black))),
                subtitle: Text(
                    """Red : uncooked\nBrown : well cooked\nBlack : ops ! you burned it""",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                      fontSize: 17,
                    ))),
                trailing: Image.asset("assets/images/meat.jpg", width: 80),
              ),
            ),
            Card(
              elevation: 4,
              child: ListTile(
                title: Text("Chicken",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.questrial(
                        textStyle: const TextStyle(
                            fontSize: 28, color: Colors.black))),
                subtitle: Text(
                    """White : uncooked\nBrown : well cooked\nBlack : ops ! you burned it""",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                      fontSize: 17,
                    ))),
                trailing: Image.asset("assets/images/chicken.jpg", width: 80),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
