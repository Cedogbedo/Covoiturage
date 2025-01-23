import 'package:flutter/material.dart';
import 'package:covoiturage/screens/page_two.dart';

class PageOne extends StatelessWidget {
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
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/images/onboard1.png',
                  width: double.infinity,
                  fit: BoxFit.fitWidth,
                ),
              ),
              const SizedBox(height: 70),
              Text(
                "Bienvenue sur notre application de covoiturage",
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
