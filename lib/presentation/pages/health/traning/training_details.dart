import 'dart:async';

import 'package:checkapp/app_theme.dart';
import 'package:fl_animated_linechart/fl_animated_linechart.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sensors/sensors.dart';

import '../fintness_app_theme.dart';

class TrainingScreen extends StatefulWidget {
  static const String id = 'hearing_test_screen';
  static final double TIMER_TOTAL_TIME = 15;

  @override
  _TrainingScreenState createState() => _TrainingScreenState();
}

class _TrainingScreenState extends State<TrainingScreen> {
  // Initilize
  double _elapsedTime = 0;
  double _remainingTime = TrainingScreen.TIMER_TOTAL_TIME;
  bool _isFinished = true;
  String startStopButtonStatus = 'START TRAINING';
  Icon startStopButtonIcon = Icon(
    FontAwesomeIcons.play,
    size: 50,
  );

  // Sensor data variables
  double gyroX, gyroY, gyroZ, accX, accY, accZ, uAccX, uAccY, uAccZ;

  // Timer for counting down
  Timer _timer;

  LineChart chart;
  Map<DateTime, double> dataGyroX = {};
  Map<DateTime, double> dataGyroY = {};
  Map<DateTime, double> dataGyroZ = {};
  Map<DateTime, double> dataAccX = {};
  Map<DateTime, double> dataAccY = {};
  Map<DateTime, double> dataAccZ = {};
  Map<DateTime, double> dataUAccX = {};
  Map<DateTime, double> dataUAccY = {};
  Map<DateTime, double> dataUAccZ = {};

  Map<DateTime, double> data = {};

  void startTimer() async {
    if (_isFinished) {
      _isFinished = false;
      const period = const Duration(milliseconds: 250);
      _timer = new Timer.periodic(period, (Timer timer) {
        if (_remainingTime != 0) {
          print('AccX:$accX, AccY:$accY, AccZ:$accZ');
          setState(() {
            _remainingTime -= 0.25;
            _elapsedTime += 0.25;
            var currentTime = DateTime.now();

            dataGyroX[currentTime] = gyroX;
            dataGyroY[currentTime] = gyroY;
            dataGyroZ[currentTime] = gyroZ;
            dataAccX[currentTime] = accX;
            dataAccY[currentTime] = accY;
            dataAccZ[currentTime] = accZ;
            dataUAccX[currentTime] = uAccX;
            dataUAccY[currentTime] = uAccY;
            dataUAccZ[currentTime] = uAccZ;

            startStopButtonStatus = "STOP TRAINING";
            startStopButtonIcon = Icon(
              FontAwesomeIcons.stop,
              size: 50,
            );
          });
        } else {
          stopTraining();
          Fluttertoast.showToast(
              msg: "Training is completed",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIos: 1,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      });
    } else {
      _isFinished = true;
      stopTraining();
      Fluttertoast.showToast(
          msg: "Training is stopped",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIos: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  void stopTraining() {
    resetTimer();
    setState(() {
      startStopButtonStatus = "RESTART TRAINING";
      startStopButtonIcon = Icon(
        FontAwesomeIcons.play,
        size: 50,
      );
      var dataArrays = [
        dataAccX,
        dataAccY,
        dataAccZ,
        dataUAccX,
        dataUAccY,
        dataUAccZ,
        dataGyroX,
        dataGyroY,
        dataGyroZ
      ];
      var dataColors = [
        Colors.green,
        Colors.lightGreen,
        Colors.lightGreenAccent,
        Colors.red,
        Colors.redAccent,
        Colors.deepOrangeAccent,
        Colors.blue,
        Colors.blueAccent,
        Colors.lightBlueAccent
      ];
      chart = LineChart.fromDateTimeMaps(dataArrays, dataColors,
          ['C', 'C', 'C', 'C', 'C', 'C', 'C', 'C', 'C']);
    });
  }

  void resetTimer() {
    setState(() {
      _timer.cancel();
      _isFinished = true;
      _remainingTime = TrainingScreen.TIMER_TOTAL_TIME;
      _elapsedTime = 0;
    });
  }

  @override
  void initState() {
    super.initState();

    chart =
        LineChart.fromDateTimeMaps([createEmptyData()], [Colors.green], ['C']);

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

  Map<DateTime, double> createEmptyData() {
    data[DateTime.now().subtract(Duration(minutes: 40))] = 0.0;
    data[DateTime.now().subtract(Duration(minutes: 30))] = 0.0;
    return data;
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
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '\t\t\tAccelerometer & Gyroscope Sensor Data',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: FintnessAppTheme.fontName,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    letterSpacing: 0.5,
                    color: FintnessAppTheme.lightText,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 8,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 20.0, 8.0, 8.0),
                child: AnimatedLineChart(
                  chart,
                  key: UniqueKey(),
                ),
              ), //Unique key to force animations
            ),
            Expanded(
                flex: 4,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      //Row:1 Col:1
                      child: InkWell(
                        onTap: () {
                          // START STOPWATCH
                          setState(() {
                            startTimer();
                          });
                        },
                        child: ReusableCard(
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              startStopButtonIcon,
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                startStopButtonStatus,
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
                flex: 4,
                child: Row(
                  children: <Widget>[
                    IconCard(
                      Icon(
                        FontAwesomeIcons.stopwatch,
                        size: 30,
                      ),
                      'ELAPSED TIME:\n00.${_elapsedTime.toInt().toString().padLeft(2, '0')}',
                      () => {},
                    ),
                    IconCard(
                      Icon(
                        FontAwesomeIcons.stopwatch,
                        size: 30,
                      ),
                      'REMAINING TIME:\n00.${_remainingTime.toInt().toString().padLeft(2, '0')}',
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
          borderRadius: BorderRadius.circular(10), color: Colors.blue[300]),
      child: widget,
    );
  }
}
