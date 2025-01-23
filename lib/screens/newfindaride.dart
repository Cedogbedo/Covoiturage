import 'package:flutter/material.dart';

class NewFindaride extends StatelessWidget {
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
                    'Ville de départ:Cotonou',
                    style: TextStyle(fontSize: 15.0),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  //
                  Text(
                    "Ville d'arrivé : Parakou",
                    style: TextStyle(fontSize: 15.0),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  //
                  Text(
                    'Heure de départ: 10h',
                    style: TextStyle(fontSize: 15.0),
                  ),
                  SizedBox(
                    height: 12,
                  ),

                  //
                  Text(
                    'Accptez vous les fumeurs? Oui',
                    style: TextStyle(fontSize: 15.0),
                  ),
                  SizedBox(
                    height: 12,
                  ),

                  //
                  Text(
                    'Acceptez vous les animaux? : Non',
                    style: TextStyle(fontSize: 15.0),
                  ),
                  SizedBox(
                    height: 12,
                  ),

                  //
                  Text(
                    'Nombre de places disponible : 3',
                    style: TextStyle(fontSize: 15.0),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Prix du trajet : 2000',
                    style: TextStyle(fontSize: 15.0),
                  ),
                  //
                  /* Text(
                    'Prix: 5000',
                    style: TextStyle(fontSize: 15.0),
                  ),
                  SizedBox(
                    height: 12,
                  ),

                  //
                  Text(
                    '',
                    style: TextStyle(fontSize: 15.0),
                  ),*/
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
        })));
  }
}
