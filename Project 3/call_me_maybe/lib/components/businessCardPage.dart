import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BusinessCard extends StatelessWidget {
  @override
  Widget build(BuildContext pageContent) {
    final String email = 'peterlak@oregonstate.edu';
    final String cellNumber = '541-555-6844';
    final String cellNumberApp = 'sms:5415556844';
    final String github = 'github.com/LakePeterson';
    final String githubApp = 'https://github.com/LakePeterson';

    return FractionallySizedBox(
      heightFactor: .95,
      child: Container(
        child: Column(
          children: [
            profilePicture(pageContent),
            Container(
              padding: EdgeInsets.only(top: 5),
              child: Text("Lake Peterson",
                  style: TextStyle(fontFamily: 'OpenSans-Bold', fontSize: 30)),
            ),
            Container(
              padding: EdgeInsets.only(top: 5),
              child: Text(
                "Student",
                style: TextStyle(fontFamily: 'OpenSans', fontSize: 25),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 5),
              child: GestureDetector(
                onTap: () {
                  launch(cellNumberApp);
                },
                child: Text(cellNumber,
                    style: TextStyle(fontFamily: 'OpenSans', fontSize: 25)),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: paddingRow(pageContent)),
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {
                        launch(githubApp);
                      },
                      child: Text(github,
                          style:
                              TextStyle(fontFamily: 'OpenSans', fontSize: 14)),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: paddingRow(pageContent)),
                    alignment: Alignment.centerRight,
                    child: Text(email,
                        style: TextStyle(fontFamily: 'OpenSans', fontSize: 14)),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget profilePicture(BuildContext pageContent) {
    double ratio;

    if (MediaQuery.of(pageContent).orientation == Orientation.landscape) {
      ratio = 5 / 1;
    } else {
      ratio = 5 / 2;
    }

    return AspectRatio(
      aspectRatio: ratio,
      child: Image(image: AssetImage('assets/images/profilePicture.jpg')),
    );
  }

  double paddingRow(BuildContext pageContent) {
    // if pageContent is landscape
    if (MediaQuery.of(pageContent).orientation == Orientation.landscape) {
      return MediaQuery.of(pageContent).size.width * 0.2;
    } else {
      return MediaQuery.of(pageContent).size.width * 0.05;
    }
  }
}
