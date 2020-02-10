import 'package:checkapp/presentation/pages/health/fitness_app_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:checkapp/presentation/pages/hearing_test/hearing_test_screen.dart';
import 'package:checkapp/presentation/pages/vision_test/vision_test_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    //return OldHomepage();
    return FitnessAppHomeScreen();
  }
}

class OldHomepage extends StatelessWidget {
  const OldHomepage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Hearing Test'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                  //Row:1 Col:1
                  child: ReusableCard(HearingButton()),
                ),
                Expanded(
                  //Row:1 Col:2
                  child: ReusableCard(VisionButton()),
                ),
              ],
            )),
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                  //Row:3 Col:1
                  child: ReusableCard(null),
                ),
                Expanded(
                  //Row:3 Col:2
                  child: ReusableCard(null),
                ),
              ],
            )),
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                  //Row:3 Col:1
                  child: ReusableCard(null),
                ),
                Expanded(
                  //Row:3 Col:2
                  child: ReusableCard(null),
                ),
              ],
            )),
          ],
        ));
  }
}

class VisionButton extends StatelessWidget {
  const VisionButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => Navigator.pushNamed(context, VisionTestScreen.id),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/icon_eye.png',
              width: 120.0,
              height: 120.0,
              fit: BoxFit.contain,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "Vision Test",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontStyle: FontStyle.italic),
              ),
            )
          ],
        ));
  }
}

class HearingButton extends StatelessWidget {
  const HearingButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => Navigator.pushNamed(context, HearingTestScreen.id),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'assets/images/icon_hearing.png',
                width: 110.0,
                height: 110.0,
                fit: BoxFit.contain,
              ),
            ),
            Text(
              "Hearing Test",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontStyle: FontStyle.italic),
            )
          ],
        ));
  }
}

class ReusableCard extends StatelessWidget {
  final Widget widget;

  const ReusableCard(
    this.widget, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color.fromRGBO(208, 208, 208, 1.0),
      ),
      child: widget,
    );
  }
}
