import 'package:covoiturage/main.dart';
import 'package:covoiturage/screens/loginpage.dart';
import 'package:covoiturage/screens/registration.dart';
import 'package:covoiturage/screens/profilpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covoiturage/screens/mainscreen.dart';
import 'package:covoiturage/screens/homepage.dart';
import 'package:covoiturage/screens/proposertrajet.dart';
import 'package:covoiturage/screens/recherchertrajet.dart';

class DatabaseManager {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final CollectionReference<Map<String, dynamic>> profiletrajet =
      FirebaseFirestore.instance.collection("trajet");

  Future getUsersList() async {
    List itemsList = [];

    try {
      await profiletrajet.get().then((querySnapshot) {
        querySnapshot.docs.forEach((element) {
          itemsList.add(element.data);
        });
      });
      return itemsList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signOut() async {
    try {
      return _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}

Future<void> userSetup(String email, String name) async {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = auth.currentUser.uid.toString();
  users.add({'email': email, 'name': name, 'uid': uid});
  return;
}

/*storeNewUser(user, context) async {
    var firebaseUser = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance
        .collection('users')
        .doc(firebaseUser.uid)
        .set({'email': user.email, 'uid': user.uid})
        .then((value) => Navigator.push(
            context, MaterialPageRoute(builder: (context) => ProfilPage())))
        .catchError((e) {
          print(e);
        });
  }*/
