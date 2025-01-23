import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:covoiturage/screens/databasemanager.dart';
import 'package:covoiturage/screens/proposertrajet.dart';
import 'package:covoiturage/screens/sharedpreferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:covoiturage/screens/ridecard.dart';

/*
class RechercherTrajetPage extends StatelessWidget {
  static const String idScreen = "rechercherTrajet";

  /* List userProfilesList = [];

  String userID = "";

  @override
  void initState() {
    super.initState();
    fetchUserInfo();
    fetchDatabaseList();
  }

  fetchUserInfo() async {
    FirebaseUser getUser = FirebaseAuth.instance.currentUser;
    userID = getUser.uid;
  }

  fetchDatabaseList() async {
    dynamic resultant = await DatabaseManager().getUsersList();

    if (resultant == null) {
      print('Unable to retrieve');
    } else {
      setState(() {
        userProfilesList = resultant;
      });
    }
  }*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Rechercher un trajet"),
          backgroundColor: Colors.green,
          centerTitle: true,
        ),
        body: Container(child: ListView.builder(
            // itemCount: userProfilesList.length,
            itemBuilder: (context, index) {
          return Card(
            elevation: 10.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: Colors.grey,
            child: Container(
              height: 500,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                //style:TextStyle(fontsize: 20.0),
                children: [
                  //
                  Text(
                    '',
                    style: TextStyle(fontSize: 15.0),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  //
                  Text(
                    '',
                    style: TextStyle(fontSize: 15.0),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  //
                  Text(
                    '',
                    style: TextStyle(fontSize: 15.0),
                  ),
                  SizedBox(
                    height: 12,
                  ),

                  //
                  Text(
                    '',
                    style: TextStyle(fontSize: 15.0),
                  ),
                  SizedBox(
                    height: 12,
                  ),

                  //
                  Text(
                    '',
                    style: TextStyle(fontSize: 15.0),
                  ),
                  SizedBox(
                    height: 12,
                  ),

                  //
                  Text(
                    '',
                    style: TextStyle(fontSize: 15.0),
                  ),
                  SizedBox(
                    height: 12,
                  ),

                  //
                  Text(
                    '',
                    style: TextStyle(fontSize: 15.0),
                  ),
                  SizedBox(
                    height: 12,
                  ),

                  //
                  Text(
                    '',
                    style: TextStyle(fontSize: 15.0),
                  ),
                  SizedBox(
                    height: 12,
                  ),

                  ButtonBar(
                    children: [
                      RaisedButton(
                          child: Text("Commenter"),
                          color: Colors.red,
                          onPressed: () {}),
                      FlatButton(
                          child: Text("Accepter et Payer le trajet"),
                          color: Colors.green,
                          onPressed: () {}),
                    ],
                  ),
                ],
              ),
            ),
          );
        }
        )
        )
        );
  }
}

*/

final _firestore = FirebaseFirestore.instance;
final phone = FirebaseAuth.instance.currentUser.phoneNumber;
var loggedInuser;

class RechercherTrajetPage extends StatefulWidget {
  @override
  _RechercherTrajetPageState createState() => _RechercherTrajetPageState();
}

class _RechercherTrajetPageState extends State<RechercherTrajetPage> {
  String user = "";

  void getCurrentUserName() async {
    try {
      final user = MySharedPreferences.instance.getStringValue("userName");
      if (user != null) {
        loggedInuser = user;
        print(loggedInuser);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentUserName();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text("Trouver un trajet"),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            RideStream(),
          ],
        ),
      ),
    );
  }
}

class RideStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _firestore
          .collection('trajet')
          // Sort the messages by timestamp DESC because we want the newest messages on bottom.
          .orderBy("timestamp", descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        // If we do not have data yet, show a progress indicator.
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        // Create the list of message widgets.

        List<Widget> rideWidgets = snapshot.data.docs.map<Widget>((r) {
          final data = r.data();
          final rideSender = data["Ville de départ"];
          final rideDestination = data["Ville d'arrivée"];
          final rideDate = data["Date de départ"];
          final rideTime = data["Heure de départ"];
          final rideP = data["Nombres de passagers"];
          final rideAnimal = data['"Animal"'];
          final rideFumeur = data["Fumeur"];
          final rideBagage = data["Bagage"];
          final ridePrice = data["Prix"];
          final ridePhone = data["Phone"];
          final timeStamp = data['timestamp'];
          return RideDetailCard(
            rideSender: rideSender,
            rideDestination: rideDestination,
            rideDate: rideDate,
            rideTime: rideTime,
            rideP: rideP,
            rideAnimal: rideAnimal,
            rideFumeur: rideFumeur,
            ridePrice: ridePrice,
            rideBagage: rideBagage,
            ridePhone: ridePhone,
            /*rideUPI : rideUPI,
            rideVehicleNo : rideVehicleNo,*/
            timestamp: timeStamp,
            //isMe: ridePhone == phone,
          );
        }).toList();

        return Expanded(
          child: ListView(
            reverse: true,
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            children: rideWidgets,
          ),
        );
      },
    );
  }
}
