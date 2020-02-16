import 'package:checkapp/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TrainingScreen extends StatefulWidget {
  static const String id = 'hearing_test_screen';

  @override
  _TrainingScreenState createState() => _TrainingScreenState();
}

class _TrainingScreenState extends State<TrainingScreen> {
  int _elapsedTime = 0;
  int _remainingTime = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppTheme.white,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black87),
          backgroundColor: AppTheme.white,
          title: Text(
            'Training',
            style: TextStyle(color: Colors.black87),
          ),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
                child: Row(
              children: <Widget>[
                IconCard(
                  Icon(
                    FontAwesomeIcons.pause,
                    size: 40,
                  ),
                  'PAUSE TRAINING',
                  () => {print('training')},
                ),
                new IconCard(
                  Icon(
                    FontAwesomeIcons.stop,
                    size: 40,
                  ),
                  'STOP TRAINING',
                  () => {},
                ),
              ],
            )),
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                  //Row:1 Col:1
                  child: InkWell(
                    onTap: () {
                      // START STOPWATCH
                      setState(() {
                        _remainingTime--;
                        _elapsedTime++;
                      });
                    },
                    child: ReusableCard(
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.play,
                            size: 70,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'START TRAINING',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
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
                  'ELAPSED TIME:\n00.${_elapsedTime.toString().padLeft(2, '0')}',
                  () => {},
                ),
                new IconCard(
                  Icon(
                    FontAwesomeIcons.stopwatch,
                    size: 40,
                  ),
                  'REMAINING TIME:\n00.${_remainingTime.toString().padLeft(2, '0')}',
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
                color: Colors.white,
                fontWeight: FontWeight.w900,
              ),
              textAlign: TextAlign.center,
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
          borderRadius: BorderRadius.circular(10), color: Colors.lightGreen),
      child: widget,
    );
  }
}
