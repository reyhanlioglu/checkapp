import 'package:flutter/material.dart';
import '../vision_test/vision_test_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HearingTestScreen extends StatefulWidget {
  static const String id = 'hearing_test_screen';

  @override
  _HearingTestScreenState createState() => _HearingTestScreenState();
}

class _HearingTestScreenState extends State<HearingTestScreen> {
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
                IconCard(
                  Icon(
                    FontAwesomeIcons.play,
                    size: 40,
                  ),
                  'START TEST',
                  () => {print('testing')},
                ),
                new IconCard(
                  Icon(
                    FontAwesomeIcons.pause,
                    size: 40,
                  ),
                  'PAUSE TEST',
                  () => {},
                ),
              ],
            )),
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                  //Row:1 Col:1
                  child: ReusableCard(Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        FontAwesomeIcons.bullseye,
                        size: 70,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'TAP HERE IF YOU HEAR ANYTHING',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF8D8E98),
                          fontWeight: FontWeight.w900,
                        ),
                      )
                    ],
                  )),
                ),
              ],
            )),
            Expanded(
                child: Row(
              children: <Widget>[
                new IconCard(
                  Icon(
                    FontAwesomeIcons.stopwatch,
                    size: 40,
                  ),
                  'TOTAL TIME: 00.00',
                  () => {},
                ),
                new IconCard(
                  Icon(
                    FontAwesomeIcons.stop,
                    size: 40,
                  ),
                  'STOP TEST',
                  () => {},
                ),
              ],
            )),
          ],
        ));
  }
}

class IconCard extends StatelessWidget {
  final Icon icon;
  final String iconText;
  final Function onTap;

  const IconCard(
    this.icon,
    this.iconText,
    this.onTap, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      //Row:1 Col:1
      child: GestureDetector(
        onTap: () => onTap,
        child: ReusableCard(Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            icon,
            SizedBox(
              height: 15,
            ),
            Text(
              iconText,
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFF8D8E98),
                fontWeight: FontWeight.w900,
              ),
            )
          ],
        )),
      ),
    );
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
          borderRadius: BorderRadius.circular(10), color: Color(0xFF4A4950)),
      child: widget,
    );
  }
}
