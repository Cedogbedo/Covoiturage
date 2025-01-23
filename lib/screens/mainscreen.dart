import 'dart:async';
import 'package:covoiturage/AllWidget/divider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:covoiturage/screens/loginpage.dart';
import 'package:covoiturage/screens/registration.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';

class MainScreen extends StatefulWidget {
  static const String idScreen = "mainScreen";

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page d'acceuil"),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            titleSection,
            boxSection,
            lineSection,
            subTitleSection,
            bottomSection,
          ],
        ),
      ),
    );
  }
}

Widget titleSection = Container(
  padding: EdgeInsets.all(20),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        "Bienvenue sur votre page d'acceuil",
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
      Container(
        height: 50,
        width: 50,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Image.network(
              'https://us.123rf.com/450wm/thesomeday123/thesomeday1231709/thesomeday123170900021/85622928-ic%C3%B4ne-de-profil-avatar-par-d%C3%A9faut-espace-r%C3%A9serv%C3%A9-photo-gris-vecteurs-d-illustrations.jpg?ver=6'),
        ),
      )
    ],
  ),
);

Widget boxSection = Container(
  width: double.infinity,
  padding: EdgeInsets.all(25),
  margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(15),
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Colors.greenAccent,
      ],
    ),
  ),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Bienvenue dans Cajy car',
        style: TextStyle(
          color: Colors.black,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: 10),
      Text(
        'Le covoiturage est un moyen économique et écologique pour voyager',
        style: TextStyle(color: Colors.black, fontSize: 20),
      ),
      SizedBox(height: 10),
      RaisedButton(
        onPressed: () {},
        color: Colors.orange,
        textColor: Colors.black,
        child: Text('Contactez nous'),
      ),
    ],
  ),
);

Widget lineSection = Container(
  color: Colors.grey[200],
  padding: EdgeInsets.all(3),
);

Widget subTitleSection = Container(
  margin: EdgeInsets.all(20),
  child: Row(
    children: [
      Container(
        color: Colors.indigoAccent,
        width: 5,
        height: 25,
      ),
      SizedBox(width: 10),
      Text(
        'Découvrez le covoiturage',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      )
    ],
  ),
);

Widget bottomSection = Container(
  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
  child: Column(
    children: [
      Image(
        alignment: Alignment.center,
        height: 1000.0,
        width: 1000.0,
        image: AssetImage('assets/images/benincovoit1.jpg'),
      ),
      SizedBox(height: 10),
      Image(
        alignment: Alignment.center,
        height: 1000.0,
        width: 1000.0,
        image: AssetImage('assets/images/benincovoit1.jpg'),
      ),
    ],
  ),
);

/*{
  /* Completer<GoogleMapController> _controllerGoogleMap = Completer();
  GoogleMapController newGoogleMapConroller;

  
  

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );*/

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text("Main Screen"),
        backgroundColor: Colors.green,
      ),
      /*drawer: Container(
        color: Colors.white,
        width: 255.0,
        child: Drawer(
          child: ListView(
            children: [
              Container(
                height: 165.0,
                child: DrawerHeader(
                  decoration: BoxDecoration(color: Colors.white),
                  child: Row(
                    children: [
                      Image.asset("Images/user_icon.png",
                          height: 65.0, width: 65.0),
                      SizedBox(width: 16.0),
                      Column(
                        children: [
                          Text(
                            "Profil",
                            style: TextStyle(
                                fontSize: 16.0, fontFamily: "Brand-bold"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              DividerWidget(),

              SizedBox(height: 12.0),

              //Drawer controller

              ListTile(
                leading: Icon(Icons.history),
                title: Text(
                  "History",
                  style: TextStyle(fontSize: 15.0),
                ),
              ),

              ListTile(
                leading: Icon(Icons.person),
                title: Text(
                  "Modifier profil",
                  style: TextStyle(fontSize: 15.0),
                ),
              ),

              ListTile(
                leading: Icon(Icons.info),
                title: Text(
                  "About",
                  style: TextStyle(fontSize: 15.0),
                ),
              ),
            ],
          ),
        ),
      ),*/
      body: Stack(
        children: [
          /* GoogleMap(
            mapType: MapType.normal,
            myLocationButtonEnabled: true,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controllerGoogleMap.complete(controller);
              newGoogleMapConroller = controller;
            },
          ),
*/
          /*hamburgerbutton
          Positioned(
            top: 30.0,
            left: 10.0,
            child: GestureDetector(
              onTap: () {
                scaffoldKey.currentState.openDrawer();
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(22.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 5.0,
                      spreadRadius: 0.5,
                      offset: Offset(
                        0.7,
                        0.7,
                      ),
                    ),
                  ],
                ),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.menu,
                    color: Colors.black,
                  ),
                  radius: 20.0,
                ),
              ),
            ),
          ),*/
        ],
      ),
    );
  }
}
*/
