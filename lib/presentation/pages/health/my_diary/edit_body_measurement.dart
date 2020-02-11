import 'package:checkapp/shared_pref_helper.dart';
import 'package:flutter/material.dart';

import '../fintness_app_theme.dart';

class EditBodyMeasurement extends StatefulWidget {
  @override
  _EditBodyMeasurementState createState() => _EditBodyMeasurementState();
}

class _EditBodyMeasurementState extends State<EditBodyMeasurement> {
  final _formBodyMeasurementsKey = GlobalKey<FormState>();
  double _weight;
  double _height;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Form(
            key: this._formBodyMeasurementsKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 100.0,
                ),
                // WEIGHT EDIT TEXT
                TextFormField(
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value.length == 0)
                      return "Enter your weight";
                    else
                      return null;
                  },
                  style: TextStyle(color: Colors.black),
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    _weight = double.parse(value);
                  },
                  decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.blueGrey),
                    hintText: 'Weight (kg)',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.blueAccent, width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.blueAccent, width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                // EMAIL EDIT TEXT
                TextFormField(
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value.length == 0)
                      return "Enter your height";
                    else
                      return null;
                  },
                  style: TextStyle(color: Colors.black),
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    _height = double.parse(value);
                  },
                  decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.blueGrey),
                    hintText: 'Height (cm)',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.blueAccent, width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.blueAccent, width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),

                // SET BUTTON
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Material(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    elevation: 5.0,
                    child: MaterialButton(
                      onPressed: () async {
                        if (_formBodyMeasurementsKey.currentState.validate()) {
                          await saveHeight(_height);
                          await saveWeight(_weight);
                          print('SAVED ALL');
                          Navigator.pop(context);
                        }
                      },
                      minWidth: 200.0,
                      height: 42.0,
                      child: Text(
                        'SAVE',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),

                // SET BUTTON
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Material(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    elevation: 5.0,
                    child: MaterialButton(
                      onPressed: () async {
                        Navigator.pop(context);
                      },
                      minWidth: 200.0,
                      height: 42.0,
                      child: Text(
                        'CANCEL',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
