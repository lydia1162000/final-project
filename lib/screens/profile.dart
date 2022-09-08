import 'package:colblindor2/authentication/repository/user_repo.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Provider.of<UserRepository>(context, listen: false).getUser();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 103, 22, 106),
      ),
      backgroundColor: HexColor('#ece6ed'),
      body: Consumer<UserRepository>(
        builder: (context, value, child) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: size.height * 0.05, bottom: size.height * 0.05),
                  child: Image.asset(
                    'assets/images/loginIcon.png',
                    width: size.width * 0.5,
                  ),
                ),
                ProfileFeild(
                  size: size,
                  text: value.user.name ?? "",
                  icon: const Icon(Icons.person),
                ),
                ProfileFeild(
                  size: size,
                  text: value.user.email ?? "",
                  icon: const Icon(Icons.email),
                ),
                ProfileFeild(
                  size: size,
                  text: value.user.phone ?? "",
                  icon: const Icon(Icons.phone),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class ProfileFeild extends StatelessWidget {
  const ProfileFeild({
    Key? key,
    required this.icon,
    required this.text,
    required this.size,
  }) : super(key: key);

  final Size size;
  final String text;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, value, child) {
        return Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(
              horizontal: size.width * 0.1, vertical: size.height * 0.02),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(17),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withAlpha(8),
                  offset: const Offset(0, 10),
                  blurRadius: 15)
            ],
          ),
          child: ListTile(leading: icon, title: Text(text)),
        );
      },
    );
  }
}
