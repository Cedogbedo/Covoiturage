import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:covoiturage/screens/databasemanager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:covoiturage/screens/recherchertrajet.dart';

import 'homepage.dart';

class ProposerTrajetPage extends StatelessWidget {
  static const String idScreen = "proposerTrajet";

  TextEditingController villedepartTextEditingController =
      TextEditingController();
  TextEditingController villedarriveTextEditingController =
      TextEditingController();
  TextEditingController datedepartTextEditingController =
      TextEditingController();
  TextEditingController heuredepartTextEditingController =
      TextEditingController();
  TextEditingController nombredepassagersTextEditingController =
      TextEditingController();
  TextEditingController animalTextEditingController = TextEditingController();
  TextEditingController fumeurTextEditingController = TextEditingController();
  TextEditingController bagageTextEditingController = TextEditingController();
  TextEditingController prixTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController etatvTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Proposer un trajet"),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
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
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[
                      //Ville départ
                      TextField(
                        controller: villedepartTextEditingController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            labelText: 'Ville de départ',
                            labelStyle: TextStyle(
                              fontSize: 14.0,
                            ),
                            hintText: "Ville de départ",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 10.0,
                            )),
                        style: TextStyle(fontSize: 14),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      //Ville d'arrivée
                      TextField(
                        controller: villedarriveTextEditingController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            labelText: "Ville d'arrivée ",
                            labelStyle: TextStyle(
                              fontSize: 14.0,
                            ),
                            hintText: "Ville d'arrivée",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 10.0,
                            )),
                        style: TextStyle(fontSize: 14),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      //date de départ
                      TextField(
                        controller: datedepartTextEditingController,
                        keyboardType: TextInputType.datetime,
                        decoration: InputDecoration(
                            labelText: 'Date de départ',
                            labelStyle: TextStyle(
                              fontSize: 14.0,
                            ),
                            hintText: "Date de départ",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 10.0,
                            )),
                        style: TextStyle(fontSize: 14),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      //Heure de départ
                      TextField(
                        controller: heuredepartTextEditingController,
                        keyboardType: TextInputType.text,
                        // keyboardType: TextInputType.time,
                        // keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            labelText: 'Heure de départ',
                            labelStyle: TextStyle(
                              fontSize: 14.0,
                            ),
                            hintText: "Heure de départ",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 10.0,
                            )),
                        style: TextStyle(fontSize: 14),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      //Nombre de passagers
                      TextField(
                        controller: nombredepassagersTextEditingController,
                        keyboardType: TextInputType.text,
                        // keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            labelText: 'Nombre de passagers',
                            labelStyle: TextStyle(
                              fontSize: 14.0,
                            ),
                            hintText: "Nombre de passagers",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 10.0,
                            )),
                        style: TextStyle(fontSize: 14),
                      ),

                      SizedBox(
                        height: 40,
                      ),
                      //Fumeur
                      TextField(
                        controller: fumeurTextEditingController,
                        keyboardType: TextInputType.text,
                        // keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            labelText: 'Accepter vous les fumeur?',
                            labelStyle: TextStyle(
                              fontSize: 14.0,
                            ),
                            hintText: "Répondez par oui ou non",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 10.0,
                            )),
                        style: TextStyle(fontSize: 14),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      //animaux
                      TextField(
                        controller: animalTextEditingController,
                        keyboardType: TextInputType.text,
                        // keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            labelText: 'Accepter vous les animaux?',
                            labelStyle: TextStyle(
                              fontSize: 14.0,
                            ),
                            hintText: "Répondez par oui ou non",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 10.0,
                            )),
                        style: TextStyle(fontSize: 14),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      //bagage
                      TextField(
                        controller: bagageTextEditingController,
                        keyboardType: TextInputType.text,
                        // keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            labelText: 'Accepter vous les bagages?',
                            labelStyle: TextStyle(
                              fontSize: 14.0,
                            ),
                            hintText: "Répondez par oui ou non",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 10.0,
                            )),
                        style: TextStyle(fontSize: 14),
                      ),
                      SizedBox(
                        height: 40,
                      ),

                      TextField(
                        controller: prixTextEditingController,
                        keyboardType: TextInputType.number,
                        // keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            labelText: 'Proposer votre prix',
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
                      TextField(
                        controller: phoneTextEditingController,
                        keyboardType: TextInputType.phone,
                        // keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            labelText: 'Entrer votre numéro de telephone',
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
                      TextField(
                        controller: etatvTextEditingController,
                        keyboardType: TextInputType.text,
                        // keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            labelText:
                                'Votre voiture est-elle assurée et en etat?',
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
                              'AJOUTER TRAJET',
                              style:
                                  TextStyle(fontSize: 18, fontFamily: 'Roboto'),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Map<String, dynamic> data = {
                            "Ville de départ":
                                villedepartTextEditingController.text,
                            "Ville d'arrivée":
                                villedarriveTextEditingController.text,
                            "Date de départ":
                                datedepartTextEditingController.text,
                            "Heure de départ":
                                heuredepartTextEditingController.text,
                            "Nombres de passagers":
                                nombredepassagersTextEditingController.text,
                            "Animal": animalTextEditingController.text,
                            "Fumeur": fumeurTextEditingController.text,
                            "Bagage": bagageTextEditingController.text,
                            "Prix": prixTextEditingController.text,
                            "Numéro de téléphone":
                                phoneTextEditingController.text,
                            "Etat de la voiture": etatvTextEditingController,
                            'timestamp': Timestamp.now(),
                          };

                          FirebaseFirestore.instance
                              .collection("trajet")
                              .add(data); //as CollectionReference<Object>;

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()));
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
