//import 'package:colblindor/screens/reset_password.dart';
//import 'package:colblindor/screens/signup_screen.dart';
import 'package:colblindor2/screens/reset_password.dart';
import 'package:colblindor2/screens/signup_screen.dart';
//import 'package:firebase_signin/reusable_widgets/reusable_widget.dart';
//import 'package:firebase_signin/screens/home_screen.dart';
//import 'package:firebase_signin/screens/reset_password.dart';
//import 'package:firebase_signin/screens/signup_screen.dart';
//import 'package:firebase_signin/utils/color_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

import '../authentication/repository/authentication_repository.dart';
import '../authentication/widget/reusable_text_field.dart';
import '../reusable_widgets/reusable_widget.dart';
import '../utils/color_utils.dart';
import 'home_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController passwordTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Login",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          hexStringToColor("CB2B93"),
          hexStringToColor("9546C4"),
          hexStringToColor("5E61F4")
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.1, 20, 0),
            child: Column(
              children: <Widget>[
                Image.asset(
                  'assets/images/loginIcon.png',
                  width: 250,
                  height: 250,
                ),
                const SizedBox(
                  height: 30,
                ),
                ReusableTextField(
                  controller: emailTextController,
                  icon: Icons.email_outlined,
                  text: "Enter Email Id",
                  forPaswword: false,
                  textInputType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 20,
                ),
                Consumer<AuthenticationRepository>(
                  builder: (context, value, child) {
                    return ReusableTextField(
                      suffixIcon: IconButton(
                          onPressed: () {
                            value.encryption();
                          },
                          icon: value.isSecure
                              ? Icon(
                                  Icons.visibility_off_outlined,
                                  color: Colors.white.withOpacity(0.9),
                                )
                              : Icon(Icons.visibility_outlined,
                                  color: Colors.white.withOpacity(0.9))),
                      controller: passwordTextController,
                      icon: Icons.lock_outlined,
                      text: "Enter Password",
                      forPaswword: true,
                      textInputType: TextInputType.text,
                    );
                  },
                ),
                const SizedBox(
                  height: 5,
                ),
                forgetPassword(context),
                firebaseUIButton(context, "Sign In", () {
                  if (emailTextController.text.isEmpty ||
                      passwordTextController.text.isEmpty) {
                    EasyLoading.showInfo('Fill the missing Field',
                        duration: const Duration(seconds: 2));
                  } else {
                    Provider.of<AuthenticationRepository>(context,
                            listen: false)
                        .signIn(emailTextController.text,
                            passwordTextController.text, () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MyHome(),
                          ));
                    }, size);
                  }
                  // FirebaseAuth.instance
                  //     .signInWithEmailAndPassword(
                  //         email: emailTextController.text,
                  //         password: passwordTextController.text)
                  //     .then((value) {
                  //   Navigator.push(context,
                  //       MaterialPageRoute(builder: (context) => MyHome()));
                  // }).onError((error, stackTrace) {
                  //   print("Error ${error.toString()}");
                  // });
                }),
                const SizedBox(
                  height: 20,
                ),
                signUpOption()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have account?",
            style: TextStyle(color: Colors.white70)),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SignUpScreen()));
          },
          child: const Text(
            " Sign Up",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  Widget forgetPassword(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 35,
      alignment: Alignment.bottomRight,
      child: TextButton(
        child: const Text(
          "Forgot Password?",
          style: TextStyle(color: Colors.white70),
          textAlign: TextAlign.right,
        ),
        onPressed: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ResetPassword())),
      ),
    );
  }
}
