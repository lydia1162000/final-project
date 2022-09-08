//import 'dart:html';

import 'package:colblindor2/utils/fadin_animation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class New extends StatelessWidget {
  const New({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        child: PageView.builder(
          itemCount: details.length,
          itemBuilder: (context, index) {
            return Container(
              alignment: Alignment.center,
              child: Stack(
                alignment: Alignment.topLeft,
                children: [
                  Container(
                    color: details[index].color,
                  ),
                  Container(
                      alignment: Alignment(-1.3, 1.3),
                      child: FadeAnimation(
                        delay: 0.5,
                        child: Image.asset(
                          details[index].image,
                          width: 300,
                          height: 400,
                        ),
                      )),
                  Container(
                    alignment: Alignment(-.85, -.85),
                    child: FadeAnimation(
                      delay: 1,
                      child: Text(details[index].title,
                          style: GoogleFonts.meriendaOne(
                              fontSize: 36.6,
                              fontWeight: FontWeight.bold,
                              color: HexColor('#EEEEE4'))),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    alignment: Alignment(-.5, -.65),
                    child: FadeAnimation(
                      delay: 1,
                      child: Text(details[index].descrption,
                          textScaleFactor: 2,
                          style: GoogleFonts.montserrat(
                              fontSize: 9,
                              fontWeight: FontWeight.normal,
                              color: HexColor('#EEEEE4'))),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    alignment: Alignment(-.8, -.4),
                    child: FadeAnimation(
                      delay: 1,
                      child: Text(details[index].descrptio,
                          textScaleFactor: 2,
                          style: GoogleFonts.montserrat(
                              fontSize: 9,
                              fontWeight: FontWeight.normal,
                              color: HexColor('#EEEEE4'))),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    alignment: Alignment(-.12, -.1),
                    child: FadeAnimation(
                      delay: 1,
                      child: Text(details[index].descrpti,
                          textScaleFactor: 2,
                          style: GoogleFonts.montserrat(
                              fontSize: 9,
                              fontWeight: FontWeight.normal,
                              color: HexColor('#000000'))),
                    ),
                  ),
                  Container(
                      alignment: Alignment(.9, -.0),
                      child: InkWell(
                          child: Image.asset(
                        'assets/images/Next-p.png',
                        width: 30,
                      ))),
                  Container(
                    alignment: Alignment(.9, -.55),
                  )
                ],
              ),
            );
          },
        ),
      ),
      //appBar: AppBar(),
    );
  }
}

class Details {
  String image;
  String title;
  String descrption;
  String descrptio;

  String descrpti;

  Color color;
  Details(
    this.image,
    this.title,
    this.descrption,
    this.color,
    this.descrptio,
    this.descrpti,
  );
}

List<Details> details = [
  Details(
      'assets/images/pro.png',
      'Protonope :',
      '- (Or red-blind people) are unable to perceive any red light.',
      HexColor('#6D6CC5'),
      '- Red-green color blindness affects roughly 8 percent of men and 0.5 percent of women around the world. ',
      'Here’s how this page might appear to someone with protanopia'),
  Details(
      'assets/images/mono.png',
      'Monochromacy :',
      '- (Or complete-color blind people) are unable to perceive any colors, they see only black, white, and shades of gray.',
      HexColor('#3E3E3E'),
      '- Monochromacy is extremely rare, occuring only in approximately 1 person in 33,000.',
      'Here’s how this page might appear to someone with monochromacy'),
  Details(
      'assets/images/tri.png',
      'Tritanope :',
      '- (Or blue-blind people) are unable to perceive any blue light',
      HexColor('#8BA49D'),
      '- Tritanope is the less common type   of color blindness, It affects men and women equally, and we could say one out of 10’000 persons is affected at most.',
      'Here’s how this page might appear to someone with tritanope'),
];
