import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../model/user.dart';

class UserRepository extends ChangeNotifier {
  final _databaceRef = FirebaseDatabase.instance.ref();
  final _auth = FirebaseAuth.instance;
  double latitude = -1;
  double longitude = -1;
  Users user =
      Users(name: '', email: '', id: '', phone: '', colorNumber: 000000);

  Users users =
      Users(name: '', email: '', id: '', phone: '', colorNumber: 000000);
  void creatNewUser(String id, Users user) {
    user.id = id;
    _databaceRef.child('User').child(id).set(user.toJson());
  }

  getUser() {
    _databaceRef
        .child('User')
        .child(_auth.currentUser!.uid)
        .get()
        .then((value) {
      var data = value.value as Map;
      user = Users.fromJson(data);
      notifyListeners();
    });
  }

  int userColor(String id) {
    _databaceRef.child('User').child(id).get().then((value) {
      var user = value.value as Map;
      users = Users.fromJson(user);
    });
    return users.colorNumber;
  }
}
