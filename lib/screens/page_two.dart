import 'package:flutter/material.dart';
import 'package:covoiturage/screens/page_one.dart';
import 'package:covoiturage/screens/homepage.dart';
import 'package:covoiturage/screens/loginpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(left: 0.0, right: 0.0, top: 70),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  0.0,
                  0.0,
                  0.0,
                  0.0,
                ),
                child: RichText(
                  text: TextSpan(
                      style: TextStyle(
                        color: Color(0xFF4548ec),
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                      children: <TextSpan>[
                        TextSpan(text: 'CAJY'),
                        TextSpan(
                            text: 'CAR',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                                color: Colors.green)),
                      ]),
                ),
              ),
              const SizedBox(height: 30),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'assets/images/onboard2.png',
                  width: double.infinity,
                  fit: BoxFit.fitWidth,
                ),
              ),
              const SizedBox(height: 70),
              Text(
                "Covoiturer c'est voyager écologiquement! \n Grâce à cette application, Vous cherchez le trajet qui vous convient et vous voyagez à moindre coût !",
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: EdgeInsets.only(left: 0.0, right: 0.0, top: 20.0),
                // ignore: deprecated_member_use
                child: RaisedButton(
                  color: Colors.orange[800],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        10.0,
                      ),
                    ),
                  ),
                  onPressed: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.setBool("firstTime", true);

                    final id = prefs.getInt('id');

                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) => LoginPage(),
                      ),
                      (route) => false,
                    );
                  },
                  child: Text(
                    "COMMENCER",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
