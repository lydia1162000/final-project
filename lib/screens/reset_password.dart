import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../authentication/repository/authentication_repository.dart';

import '../authentication/widget/reusable_text_field.dart';
import '../utils/color_utils.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    const snackBar = SnackBar(
      content: Text('Yay! A SnackBar!'),
    );
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Reset Password",
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
            padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                /*reusableTextField("Enter Email Id", Icons.person_outline, false,
                    _emailTextController),*/
                // TextFormField(
                //   controller: emailTextController,
                //   cursorColor: Colors.white,
                //   textInputAction: TextInputAction.done,
                //   decoration: InputDecoration(
                //     focusedErrorBorder: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(30.0),
                //       borderSide:
                //           const BorderSide(color: Colors.red, width: 2.0),
                //     ),
                //     errorStyle: const TextStyle(
                //       color: Colors.red,
                //       fontWeight: FontWeight.bold,
                //       fontSize: 15,
                //     ),
                //     prefixIcon: const Icon(
                //       Icons.person_outline,
                //       color: Colors.white70,
                //     ),
                //     labelText: "Enter Email Id",
                //     labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
                //     filled: true,
                //     floatingLabelBehavior: FloatingLabelBehavior.never,
                //     fillColor: Colors.white.withOpacity(0.3),
                //     border: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(30.0),
                //         borderSide: const BorderSide(
                //             width: 0, style: BorderStyle.none)),
                //   ),
                //   autovalidateMode: AutovalidateMode.onUserInteraction,
                //   validator: (val) {
                //     if ((val!.isEmpty) ||
                //         !RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                //             .hasMatch(val)) {
                //       return "Enter a valid email address";
                //     }
                //     return null;
                //   },
                // ),
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
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(90)),
                  child: ElevatedButton(
                    /* style: ElevatedButton.styleFrom(
                          minimumSize: Size.fromHeight(50))*/

                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith((states) {
                          if (states.contains(MaterialState.pressed)) {
                            return Colors.black26;
                          }
                          return Colors.white;
                        }),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)))),
                    onPressed: () {
                      Provider.of<AuthenticationRepository>(context,
                              listen: false)
                          .forgetPassword(emailTextController.text);
                      Navigator.of(context).pop();
                    },
                    /* style: ElevatedButton.styleFrom(
                          minimumSize: Size.fromHeight(50))*/
                    child: const Text(
                      'Reset pass',
                      style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                )
                /* firebaseUIButton(context, "Reset Password", () {
                  FirebaseAuth.instance
                      .sendPasswordResetEmail(email: _emailTextController.text)
                      .then((value) => Navigator.of(context).pop());
                })*/
              ],
            ),
          ))),
    );
  }
}

//   Future resetPassord(TextEditingController emailTextController) async {
//     try {
//       await FirebaseAuth.instance
//           .sendPasswordResetEmail(email: emailTextController.text)
//           .then((value) => Navigator.of(context).pop());
     
//     } on FirebaseAuthException catch (e) {
//       print(e);
//     }
//   }
// }
