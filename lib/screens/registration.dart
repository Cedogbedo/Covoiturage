/*import 'package:covoiturage/AllWidget/progressdialog.dart';
import 'package:covoiturage/screens/mainscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:covoiturage/screens/loginpage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:covoiturage/main.dart';
import 'package:covoiturage/screens/homepage.dart';
import 'package:covoiturage/screens/profilpage.dart';
import 'package:covoiturage/screens/databasemanager.dart';

class RegistrationPage extends StatelessWidget {
  static const String idScreen = "register";
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
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
                  'Inscivez vous',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25, fontFamily: 'Roboto'),
                ),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[
                      //Full name
                      TextField(
                        controller: nameTextEditingController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            labelText: 'Nom complet',
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

                      //Email
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

                      //numero de telephone
                      TextField(
                        controller: phoneTextEditingController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            labelText: 'Numéro de téléphone',
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

                      //password
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
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(25)),
                        color: Colors.green,
                        textColor: Colors.white,
                        child: Container(
                          height: 50,
                          child: Center(
                            child: Text(
                              'INSCRIPTION',
                              style:
                                  TextStyle(fontSize: 18, fontFamily: 'Roboto'),
                            ),
                          ),
                        ),
                        onPressed: () {
                          //verifice si les differents élements sont entrés
                          if (nameTextEditingController.text.length < 6) {
                            displayToastMessage(
                                "Le nom doit avoir au moins 3 caracteres .",
                                context);
                          } else if (!emailTextEditingController.text
                              .contains("@")) {
                            displayToastMessage(
                                "Adresse email invalide", context);
                          } else if (phoneTextEditingController.text.isEmpty) {
                            displayToastMessage(
                                "Entrer un numero de telephone valide",
                                context);
                          } else if (passwordTextEditingController.text.length <
                              6) {
                            displayToastMessage(
                                "Le mot de passe doit contenir au moins 6 caracteres",
                                context);
                          } else {
                            registerNewUser(context);
                          }
                        },
                      ),
                    ],
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, LoginPage.idScreen, (route) => false);
                  },
                  child: Text("Vous avez déja un compte ,Connectez vous ici"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  //retourne la boite de dialogue
  void registerNewUser(BuildContext context) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return ProgressDialog(
            message: "Enregistrement en cours, Veuillez patienter...",
          );
        });

    /*final User firebaseUser = (await _firebaseAuth
            .createUserWithEmailAndPassword(
                email: emailTextEditingController.text,
                password: passwordTextEditingController.text)
            .catchError((errMsg) {
      Navigator.pop(context);
      displayToastMessage("Error" + errMsg.toString(), context);
    }))
        .user;*/

    /*FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: emailTextEditingController.text,
            password: passwordTextEditingController.text)
        .then((user) => Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage())))
        .then((signedInUser) {
      DatabaseManager().storeNewUser(signedInUser.user, context);
    }).catchError((errMsg) {
      Navigator.pop(context);
      displayToastMessage("Error" + errMsg.toString(), context);
    });*/

    try {
      await Firebase.initializeApp();
      UserCredential user =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailTextEditingController.text,
        password: passwordTextEditingController.text,
      );
      userSetup(
          emailTextEditingController.text, nameTextEditingController.text);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    } catch (errMsg) {
      displayToastMessage("Error" + errMsg.toString(), context);
    }

    /*if (firebaseUser != null) {
      //save user info in database
      Map userDataMap = {
        "name": nameTextEditingController.text.trim(),
        "email": emailTextEditingController.text.trim(),
        "Phone": phoneTextEditingController.text.trim(),
      };
      userRef.child(firebaseUser.uid).set(userDataMap);
      displayToastMessage(
          "Félicitations vous venez de creer votre compte", context);
      Navigator.pushNamedAndRemoveUntil(
          context, LoginPage.idScreen, (route) => false);
    } else {
      Navigator.pop(context);
      //error occured -display error message
      displayToastMessage("L'utilisateur n'a pas été creer", context);
    }*/
  }
}

displayToastMessage(String message, BuildContext context) {
  Fluttertoast.showToast(msg: message);
}
*/

import 'package:covoiturage/AllWidget/progressdialog.dart';
import 'package:covoiturage/screens/mainscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:covoiturage/screens/loginpage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:covoiturage/main.dart';
import 'package:covoiturage/screens/homepage.dart';
import 'package:covoiturage/screens/profilpage.dart';
import 'package:covoiturage/screens/databasemanager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:covoiturage/screens/sharedpreferences.dart';
import 'package:covoiturage/screens/userData.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  static const String idScreen = "register";
  String uid;
  String mob;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Form field variables
  String name;
  String phone;
  String email;

  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
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
                  'Inscivez vous',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25, fontFamily: 'Roboto'),
                ),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[
                      //Full name
                      TextField(
                        controller: nameTextEditingController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            labelText: 'Nom complet',
                            labelStyle: TextStyle(
                              fontSize: 14.0,
                            ),
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 10.0,
                            )),
                        style: TextStyle(fontSize: 14),
                        onChanged: (val) {
                          setState(() {
                            name = val;
                          });
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      //Email
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
                        onChanged: (val) {
                          setState(() {
                            email = val;
                          });
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      //numero de telephone
                      TextField(
                        controller: phoneTextEditingController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            labelText: 'Numéro de téléphone',
                            labelStyle: TextStyle(
                              fontSize: 14.0,
                            ),
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 10.0,
                            )),
                        style: TextStyle(fontSize: 14),
                        onChanged: (val) {
                          setState(() {
                            phone = val;
                          });
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      //password
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
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(25)),
                        color: Colors.green,
                        textColor: Colors.white,
                        child: Container(
                          height: 50,
                          child: Center(
                            child: Text(
                              'INSCRIPTION',
                              style:
                                  TextStyle(fontSize: 18, fontFamily: 'Roboto'),
                            ),
                          ),
                        ),
                        onPressed: () {
                          //verifice si les differents élements sont entrés
                          if (nameTextEditingController.text.length < 6) {
                            displayToastMessage(
                                "Le nom doit avoir au moins 3 caracteres .",
                                context);
                          } else if (!emailTextEditingController.text
                              .contains("@")) {
                            displayToastMessage(
                                "Adresse email invalide", context);
                          } else if (phoneTextEditingController.text.isEmpty) {
                            displayToastMessage(
                                "Entrer un numero de telephone valide",
                                context);
                          } else if (passwordTextEditingController.text.length <
                              6) {
                            displayToastMessage(
                                "Le mot de passe doit contenir au moins 6 caracteres",
                                context);
                          } else {
                            registerNewUser(context);
                            _submitForm(context);
                          }
                        },
                      ),
                    ],
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  child: Text("Vous avez déja un compte ,Connectez vous ici"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  //retourne la boite de dialogue
  void registerNewUser(BuildContext context) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return ProgressDialog(
            message: "Enregistrement en cours, Veuillez patienter...",
          );
        });

    /* final User firebaseUser = (await _firebaseAuth
            .createUserWithEmailAndPassword(
                email: emailTextEditingController.text,
                password: passwordTextEditingController.text)
            .catchError((errMsg) {
      Navigator.pop(context);
      displayToastMessage("Error" + errMsg.toString(), context);
    }))
        .user;*/

    /*FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: emailTextEditingController.text,
            password: passwordTextEditingController.text)
        .then((user) => Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage())))
        .then((signedInUser) {
      DatabaseManager().storeNewUser(signedInUser.user, context);
    }).catchError((errMsg) {
      Navigator.pop(context);
      displayToastMessage("Error" + errMsg.toString(), context);
    });*/

    try {
      await Firebase.initializeApp();
      UserCredential user =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailTextEditingController.text,
        password: passwordTextEditingController.text,
      );
      userSetup(
          emailTextEditingController.text, nameTextEditingController.text);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    } catch (errMsg) {
      displayToastMessage("Error" + errMsg.toString(), context);
    }

    /*if (firebaseUser != null) {
      //save user info in database
      Map userDataMap = {
        "name": nameTextEditingController.text.trim(),
        "email": emailTextEditingController.text.trim(),
        "Phone": phoneTextEditingController.text.trim(),
      };
      userRef.child(firebaseUser.uid).set(userDataMap);
      displayToastMessage(
          "Félicitations vous venez de creer votre compte", context);
      Navigator.pushNamed(context, "/loginpage");
    } else {
      Navigator.pop(context);
      //error occured -display error message
      displayToastMessage("L'utilisateur n'a pas été creer", context);
    }*/
  }

  void saveUserInfo() async {
    uid = FirebaseAuth.instance.currentUser.uid;
    email = FirebaseAuth.instance.currentUser.email;
    await UserDatabaseService(uid: uid).updateUserData(name, email, phone);
    // print("stored user details in firestore");

    //save user id from response in local storage

    MySharedPreferences.instance.setStringValue("userName", name);
    MySharedPreferences.instance.setStringValue("userPhone", phone);
    MySharedPreferences.instance.setStringValue("email", email);

    //MySharedPreferences.instance.setBoolValue("isLoggedIn", true);

    // print("stored user data in local storage");
  }

  // Submit the user details to database
  void _submitForm(BuildContext context) async {
    saveUserInfo();
  }
}

displayToastMessage(String message, BuildContext context) {
  Fluttertoast.showToast(msg: message);
}
