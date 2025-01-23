import 'package:covoiturage/AllWidget/progressdialog.dart';
import 'package:covoiturage/screens/registration.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:covoiturage/screens/mainscreen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:covoiturage/main.dart';
import 'package:covoiturage/screens/homepage.dart';
import 'package:covoiturage/screens/profilpage.dart';
import 'package:covoiturage/screens/databasemanager.dart';

class LoginPage extends StatelessWidget {
  static const String idScreen = "login";
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 70,
                ),
                Image(
                  alignment: Alignment.center,
                  height: 100.0,
                  width: 100.0,
                  image: AssetImage('assets/images/voiture.png'),
                ),
                Text(
                  'Sign in',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25, fontFamily: 'Roboto'),
                ),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        controller: emailTextEditingController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            labelText: 'Adresse Email',
                            labelStyle: TextStyle(
                              fontSize: 14.0,
                            ),
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 10.0,
                            )),
                        style: TextStyle(fontSize: 14),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: passwordTextEditingController,
                        obscureText: true,
                        // keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(
                              fontSize: 14.0,
                            ),
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 10.0,
                            )),
                        style: TextStyle(fontSize: 14),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      RaisedButton(
                        onPressed: () {
                          if (!emailTextEditingController.text.contains("@")) {
                            displayToastMessage(
                                "Adresse email invalide", context);
                          }
                          if (passwordTextEditingController.text.isEmpty) {
                            displayToastMessage(
                                "Veuillez entrer votre mot de passe", context);
                          } else {
                            loginUser(context);
                          }
                        },
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(25)),
                        color: Colors.green,
                        textColor: Colors.white,
                        child: Container(
                          height: 50,
                          child: Center(
                            child: Text(
                              'LOGIN',
                              style:
                                  TextStyle(fontSize: 18, fontFamily: 'Roboto'),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegistrationPage()));
                  },
                  child:
                      Text("Vous n'avez pas de compte ,Enregistrer vous ici"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void loginUser(BuildContext context) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return ProgressDialog(
            message: "Connexion, Veuillez patienter...",
          );
        });

    /*final User firebaseUser = (await _firebaseAuth
            .signInWithEmailAndPassword(
                email: emailTextEditingController.text,
                password: passwordTextEditingController.text)
            .catchError((errMsg) {
      Navigator.pop(context);
      displayToastMessage("Error" + errMsg.toString(), context);
    }))
        .user;*/

    FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: emailTextEditingController.text,
            password: passwordTextEditingController.text)
        .then((user) => Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage())))
        .catchError((e) {
      print(e);
    });

    /* if (firebaseUser != null) {
      //save user info in database
      userRef.child(firebaseUser.uid).once().then((DataSnapshot snap) {
        if (snap.value != null) {
          Navigator.pushNamed(context, "/homepage");
          displayToastMessage("Vous êtes connectés", context);
        } else {
          Navigator.pop(context);
          _firebaseAuth.signOut();
          displayToastMessage(
              "Pas de compte disponibles pour cet utilisateur,Veuillez creer un nouveau compte",
              context);
        }
      });
    } else {
      Navigator.pop(context);
      displayToastMessage("Erreur,vous ne pouvez pas vous connectez", context);
    }*/
  }
}
