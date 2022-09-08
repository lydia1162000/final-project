import 'package:camera/camera.dart';
import 'package:colblindor2/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tflite/tflite.dart';

import '../authentication/repository/authentication_repository.dart';
import '../authentication/repository/user_repo.dart';
import '../main.dart';
import '../utils/color_utils.dart';
import 'home.dart';
import 'home_screen.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  bool isWorking = false;
  String result = '';
  CameraController? cameraController;
  CameraImage? imgCamera;
  initCamera() {
    cameraController = CameraController(cameras[0], ResolutionPreset.medium);
    cameraController!.initialize().then((value) {
      if (!mounted) {
        return;
      }
      setState(() {
        cameraController!.startImageStream((imageFromStream) => {
              if (!isWorking)
                {
                  isWorking = true,
                  imgCamera = imageFromStream,
                  runModelOnStreamFrames()
                }
            });
      });
    });
  }

  loadModel() async {
    await Tflite.loadModel(
        model: "assets/model.tflite", labels: "assets/labels.txt");
  }

  @override
  void initState() {
    super.initState();

    loadModel();
  }

  @override
  void dispose() async {
    super.dispose();
    await Tflite.close();
    cameraController?.dispose();
  }

  runModelOnStreamFrames() async {
    var recognisations = await Tflite.runModelOnFrame(
      bytesList: imgCamera!.planes.map((plane) {
        return plane.bytes;
      }).toList(),
      imageHeight: imgCamera!.height,
      imageWidth: imgCamera!.width,
      imageMean: 127.5,
      imageStd: 127.5,
      rotation: 98,
      numResults: 2,
      threshold: 0.1,
      asynch: true,
    );
    result = '';
    for (var response in recognisations!) {
      result += response['label'] +
          ' ' +
          (response['confidence'] as double).toStringAsFixed(2) +
          '\n\n';
    }
    setState(() {
      result;
    });
    isWorking = false;
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<UserRepository>(context, listen: false).getUser();

    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        drawer: Consumer<UserRepository>(
          builder: (context, value, child) {
            return Drawer(
              // backgroundColor: HexColor('#ece6ed'),
              width: size.width * .6,
              child: Column(
                children: [
                  DrawerHeader(
                      decoration: const BoxDecoration(
                          //color: HexColor('#ece6ed'),
                          ),
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/loginIcon.png',
                            height: size.height * 0.14,
                            width: size.width * 0.5,
                          ),
                          Text(
                            value.user.name ?? "",
                            style: TextStyle(fontSize: size.height * .03),
                          ),
                          Text(
                            value.user.email ?? "",
                          )
                        ],
                      )),
                  const Divider(
                    color: Colors.redAccent,
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
                      size: size.height * .05,
                    ),
                    title: Text(
                      'Home ',
                      style: TextStyle(fontSize: size.height * .03),
                    ),
                  ),
                  ListTile(
                    onTap: (() {
                      Navigator.push(context,
                          MaterialPageRoute(builder: ((context) {
                        return const MyProfile();
                      })));
                    }),
                    leading: Icon(
                      Icons.person,
                      size: size.height * .05,
                    ),
                    title: Text(
                      'Profile  ',
                      style: TextStyle(fontSize: size.height * .03),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Provider.of<AuthenticationRepository>(context,
                              listen: false)
                          .signOut();
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => HomePage()),
                          (route) => false);
                    },
                    leading: Icon(
                      Icons.logout,
                      size: size.height * .05,
                    ),
                    title: Text(
                      'Log out  ',
                      style: TextStyle(fontSize: size.height * .03),
                    ),
                  )
                ],
              ),
            );
          },
        ),
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
          backgroundColor: hexStringToColor("#8B25AF"),
          elevation: 0.0,
          toolbarHeight: 60,
          title: Text(
            "Coler Detection ",
            style: GoogleFonts.meriendaOne(
                fontSize: 20,
                color: const Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.w900),
          ),
          centerTitle: true,
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
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/p1.png'), fit: BoxFit.fill)),
          child: Column(children: [
            Stack(
              children: [
                /*Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 100.0),
                    height: 220,
                    width: 320,
                    child: Image.asset('assets/p2.png'),
                  ),
                ),*/
                Center(
                  child: TextButton(
                    onPressed: () {
                      initCamera();
                    },
                    child: Container(
                        margin: const EdgeInsets.only(top: 65.0),
                        height: 270,
                        width: 360,
                        child: imgCamera == null
                            ? const SizedBox(
                                height: 270,
                                width: 360,
                                child: Icon(
                                  Icons.photo_camera_front,
                                  color: Colors.pink,
                                  size: 60.0,
                                ))
                            : AspectRatio(
                                aspectRatio:
                                    cameraController!.value.aspectRatio,
                                child: CameraPreview(cameraController!),
                              )),
                  ),
                ),
              ],
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 55.0),
                child: SingleChildScrollView(
                  child: Text(
                    result,
                    style: const TextStyle(
                      backgroundColor: Colors.black,
                      fontSize: 25.0,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
