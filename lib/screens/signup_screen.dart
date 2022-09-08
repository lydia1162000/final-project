import 'dart:math';

import 'package:colblindor2/authentication/model/user.dart';
import 'package:colblindor2/authentication/repository/authentication_repository.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_signin/reusable_widgets/reusable_widget.dart';
//import 'package:firebase_signin/screens/home_screen.dart';
//import 'package:firebase_signin/utils/color_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../authentication/widget/reusable_text_field.dart';
import '../reusable_widgets/reusable_widget.dart';
import '../utils/color_utils.dart';
import 'home_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController passwordTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController userNameTextController = TextEditingController();
  TextEditingController phoneTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Sign Up",
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
            padding: const EdgeInsets.fromLTRB(20, 120, 20, 0),
            child: Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 20,
                  ),
                  ReusableTextField(
                    validator: (name) {
                      if (name == null || name.isEmpty) {
                        return 'Enter your name';
                      } else {
                        return null;
                      }
                    },
                    controller: userNameTextController,
                    icon: Icons.person_outline,
                    text: "Enter UserName",
                    forPaswword: false,
                    textInputType: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ReusableTextField(
                    validator: (email) {
                      if (email != null && !EmailValidator.validate(email)) {
                        return 'Enter a valid Email';
                      } else {
                        return null;
                      }
                    },
                    controller: emailTextController,
                    icon: Icons.email_outlined,
                    text: "Enter Email Id",
                    forPaswword: false,
                    textInputType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ReusableTextField(
                    validator: (phone) {
                      if (phone == null || phone.isEmpty || phone.length < 10) {
                        return 'Enter a valid phone number';
                      } else {
                        return null;
                      }
                    },
                    controller: phoneTextController,
                    icon: Icons.phone_android,
                    text: "Enter Phone Number",
                    forPaswword: false,
                    textInputType: TextInputType.phone,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Consumer<AuthenticationRepository>(
                    builder: (context, value, child) {
                      return ReusableTextField(
                        validator: (password) {
                          if (password == null || password.isEmpty) {
                            return 'Enter a valid password';
                          } else if (password.length < 6) {
                            return 'Must be at least 6 characters long';
                          } else {
                            return null;
                          }
                        },
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
                    height: 20,
                  ),
                  firebaseUIButton(context, "Sign Up", () {
                    final form = formKey.currentState!;
                    if (form.validate()) {
                      Provider.of<AuthenticationRepository>(context,
                              listen: false)
                          .signUp(
                              Users(
                                  colorNumber:
                                      Random().nextInt(Colors.primaries.length),
                                  id: '',
                                  name: userNameTextController.text,
                                  email: emailTextController.text,
                                  phone: phoneTextController.text),
                              passwordTextController.text, () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MyHome(),
                            ));
                      }, size);
                    }

                    // FirebaseAuth.instance
                    //     .createUserWithEmailAndPassword(
                    //         email: _emailTextController.text,
                    //         password: _passwordTextController.text)
                    //     .then((value) {

                    //   Navigator.push(context,
                    //       MaterialPageRoute(builder: (context) => MyHome()));
                    // }).onError((error, stackTrace) {
                    //   print("Error ${error.toString()}");
                    // });
                  }),
                ],
              ),
            ),
          ))),
    );
  }
}
