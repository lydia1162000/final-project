import 'package:camera/camera.dart';
import 'package:colblindor2/screens/colorTexture/result.dart';
import 'package:colblindor2/screens/colorTexture/tflite_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../utils/color_utils.dart';
import '../colors.dart';
import 'camera_helper.dart';


class DetectScreen extends StatefulWidget {
  DetectScreen({Key? key,}) : super(key: key);
  final String title='Color Detection ';
  @override
  _DetectScreenPageState createState() => _DetectScreenPageState();
}

class _DetectScreenPageState extends State<DetectScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _colorAnimController;
  late Animation _colorTween;
  List<Result>? outputs;
  void initState() {
    super.initState();
    //Load TFLite Model
    TFLiteHelper.loadModel().then((value) {
      setState(() {
        TFLiteHelper.modelLoaded = true;
      });
    });
    //Initialize Camera
    CameraHelper.initializeCamera();
    //Setup Animation
    _setupAnimation();
    //Subscribe to TFLite's Classify events
    TFLiteHelper.tfLiteResultsController.stream.listen(
        (value) {
          value.forEach((element) {
            _colorAnimController.animateTo(element.confidence!,
                curve: Curves.bounceIn, duration: Duration(milliseconds: 500));
          });
          //Set Results
          outputs = value;
          //Update results on screen
          setState(() {
            //Set bit to false to allow detection again
            CameraHelper.isDetecting = false;
          });
        },
        onDone: () {},
        );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: hexStringToColor("#8B25AF"),
        title: Center(
            child: Text(
          "Color Detection ",
          style: GoogleFonts.blackOpsOne(
              textStyle: TextStyle(
            color: Colors.white,
            fontSize: 28,
          )),
        )),
      ),
      body: FutureBuilder<void>(
        future: CameraHelper.initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the Future is complete, display the preview.
            return Stack(
              children: <Widget>[
                CameraPreview(CameraHelper.camera),
                _buildResultsWidget(width, outputs)
              ],
            );
          } else {
            // Otherwise, display a loading indicator.
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    TFLiteHelper.disposeModel();
    CameraHelper.camera.dispose();
    super.dispose();
  }

  Widget _buildResultsWidget(double width, List<Result>? outputs) {
    return Positioned.fill(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 200.0,
          width: width,
          color: hexStringToColor("#ece6ed"),
          child: outputs != null && outputs.isNotEmpty
              ? ListView.builder(
                  itemCount: outputs.length,
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(20.0),
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: <Widget>[
                        Text(
                          outputs[index].label!,
                          style: TextStyle(
                            color: _colorTween.value,
                            fontSize: 20.0,
                          ),
                        ),
                        AnimatedBuilder(
                            animation: _colorAnimController,
                            builder: (context, child) => LinearPercentIndicator(

                                  width: MediaQuery.of(context).size.width * 0.8,
                                  lineHeight: 14.0,
                                  percent: outputs[index].confidence!,
                                  progressColor: _colorTween.value,
                                )),
                        Text(
                          "${(outputs[index].confidence! * 100.0).toStringAsFixed(2)} %",
                          style: TextStyle(
                            color: _colorTween.value,
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    );
                  })
              : Center(
                  child: Text("Wating for model to detect..",
                      style: TextStyle(
                        color: f10,
                        fontSize: 20.0,
                      ))),
        ),
      ),
    );
  }

  void _setupAnimation() {
    _colorAnimController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _colorTween = ColorTween(begin: f7, end: f1).animate(_colorAnimController);
  }
}
