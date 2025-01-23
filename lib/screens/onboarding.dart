import 'package:flutter/material.dart';
import 'package:covoiturage/screens/page_one.dart';
import 'package:covoiturage/screens/page_two.dart';

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int pos = 0;

  final List<Widget> _pages = [
    PageOne(),
    PageTwo(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/onboard.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            PageView(
              children: _pages,
              onPageChanged: (position) => setState(() => pos = position),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 20,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _pages.map((e) {
                    int idx = _pages.indexOf(e);
                    return Container(
                      width: 8,
                      height: 15,
                      margin: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: pos == idx ? Colors.black : Colors.grey[300],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            ButtonBar(),
          ],
        ),
      ),
    );
  }
}
