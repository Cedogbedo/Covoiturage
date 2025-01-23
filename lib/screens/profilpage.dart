/*import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:covoiturage/main.dart';
import 'package:covoiturage/screens/loginpage.dart';
import 'package:covoiturage/screens/registration.dart';
import 'package:covoiturage/screens/profilpage.dart';
import 'package:covoiturage/screens/databasemanager.dart';

class ProfilPage extends StatelessWidget {
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
  String myEmail;
  String myname;
/*@override
voidinitState(){
super.initState();
getUserData();
}*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Profil"),
          centerTitle: true,
          backgroundColor: Colors.green,
          automaticallyImplyLeading: false,
          actions: [
            RaisedButton(
              onPressed: () {
                // openDialogueBox(context);
              },
              child: Icon(
                Icons.edit,
                color: Colors.white,
              ),
              color: Colors.green,
            ),
          ],
        ),
        body: Container(
          child: FutureBuilder(
            future: _fetch(),
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done)
                return Text("Loading data...Please wait");
              return Card(
                child: ListTile(
                  title: Text("Email : $myEmail"),
                  subtitle: Text("Nom complet : $myname"),
                  leading: CircleAvatar(
                    child: Image(
                      image: AssetImage('assets/images/user_icon.png'),
                    ),
                  ),
                ),
              );
            },
          ),
        ));
  }

/*child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text("cedo"),
                      subtitle: Text("vin"),
                      leading: CircleAvatar(
                        child: Image(
                          image: AssetImage('assets/images/user_icon.png'),
                        ),
                      ),
                    ),
                  );
                }
                )*/
  _fetch() async {
    final firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser != null)
      await FirebaseFirestore.instance
          .collection('users')
          .doc(firebaseUser.uid)
          .get()
          .then((ds) {
        myEmail = ds.data()['email'];
        myname = ds.data()['name'];
        print(myEmail);
        print(myname);
      }).catchError((e) {
        print(e);
      });
  }
}

*/
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covoiturage/main.dart';
import 'package:covoiturage/screens/loginpage.dart';
import 'package:covoiturage/screens/registration.dart';
import 'package:covoiturage/screens/profilpage.dart';
import 'package:covoiturage/screens/databasemanager.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:covoiturage/screens/sharedpreferences.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // final _firestore = FirebaseFirestore.instance;
  String name = "";
  String phone = "";
  String email = "";
  final DatabaseManager _auth = DatabaseManager();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  fetchData() async {
    MySharedPreferences.instance
        .getStringValue("userName")
        .then((value) => setState(() {
              name = value;
            }));

    MySharedPreferences.instance
        .getStringValue("userPhone")
        .then((value) => setState(() {
              phone = value;
            }));

    MySharedPreferences.instance
        .getStringValue("email")
        .then((value) => setState(() {
              email = value;
            }));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Profil"),
        centerTitle: true,
        backgroundColor: Colors.green,
        automaticallyImplyLeading: false,
        actions: [
          RaisedButton(
            onPressed: () {
              // openDialogueBox(context);
            },
            child: Icon(
              Icons.edit,
              color: Colors.white,
            ),
            color: Colors.green,
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: new Stack(
        children: <Widget>[
          ClipPath(
            child: Container(color: Colors.black.withOpacity(1)),
            clipper: GetClipper(),
          ),
          Positioned(
            width: 350.0,
            left: 5,
            top: MediaQuery.of(context).size.height / 7,
            child: Column(
              children: <Widget>[
                Hero(
                  tag: "profile",
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        image: DecorationImage(
                            image: AssetImage('assets/images/user_icon.png'),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.all(Radius.circular(105.0)),
                        boxShadow: [
                          BoxShadow(blurRadius: 9.0, color: Colors.black)
                        ]),
                  ),
                ),
                SizedBox(height: 40.0),
                Container(
                  child: Text(
                    'Nom' + name,
                    style: TextStyle(
                      fontSize: 25.0,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Email :' + email,
                  style: TextStyle(
                    fontSize: 20.0,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Phone: ' + phone,
                  style: TextStyle(
                    fontSize: 20.0,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  color: Colors.green,
                  margin: EdgeInsets.all(10),
                  width: double.infinity,
                  height: 50.0,
                  child: ElevatedButton(
                    onPressed: () async {
                      await _auth.signOut().then((result) {
                        Navigator.of(context).pop(true);
                      });
                    },
                    child: Text(
                      'Logout',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class GetClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();

    path.lineTo(0.0, size.height / 3.5);
    path.lineTo(size.width + 60500, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
