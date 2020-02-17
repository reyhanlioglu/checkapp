import 'dart:async';

import 'package:checkapp/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sensors/sensors.dart';

class TrainingScreen extends StatefulWidget {
  static const String id = 'hearing_test_screen';
  static final double TIMER_TOTAL_TIME = 30;

  @override
  _TrainingScreenState createState() => _TrainingScreenState();
}

class _TrainingScreenState extends State<TrainingScreen> {
  double _elapsedTime = 0;
  double _remainingTime = TrainingScreen.TIMER_TOTAL_TIME;

  // Sensor data variables
  double gyroX, gyroY, gyroZ, accX, accY, accZ, uAccX, uAccY, uAccZ;

  Timer _timer;
  double _totalTime = TrainingScreen.TIMER_TOTAL_TIME;

  void startTimer() async {
    const period = const Duration(milliseconds: 250);
    _timer = new Timer.periodic(period, (Timer timer) {
      if (_remainingTime != 0) {
        print('AccX:$accX, AccY:$accY, AccZ:$accZ');
        _remainingTime -= 0.25;
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void initState() {
    super.initState();

    accelerometerEvents.listen((AccelerometerEvent event) {
      accX = event.x;
      accY = event.y;
      accZ = event.z;
    });
// [AccelerometerEvent (x: 0.0, y: 9.8, z: 0.0)]

    userAccelerometerEvents.listen((UserAccelerometerEvent event) {
      uAccX = event.x;
      uAccY = event.y;
      uAccZ = event.z;
    });
// [UserAccelerometerEvent (x: 0.0, y: 0.0, z: 0.0)]

    gyroscopeEvents.listen((GyroscopeEvent event) {
      //print('Gyroscope event: $event');
      gyroX = event.x;
      gyroY = event.y;
      gyroZ = event.z;
    });
// [GyroscopeEvent (x: 0.0, y: 0.0, z: 0.0)]
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

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
                  () {
                    print('training');
                  },
                ),
                IconCard(
                  Icon(
                    FontAwesomeIcons.stop,
                    size: 40,
                  ),
                  'STOP TRAINING',
                  () {
                    setState(() {
                      _timer.cancel();
                    });
                  },
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
                        startTimer();
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
                IconCard(
                  Icon(
                    FontAwesomeIcons.stopwatch,
                    size: 40,
                  ),
                  'ELAPSED TIME:\n00.${_elapsedTime.toString().padLeft(2, '0')}',
                  () => {},
                ),
                IconCard(
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
  final VoidCallback onTap;

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
      child: InkWell(
        onTap: () => onTap(),
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
