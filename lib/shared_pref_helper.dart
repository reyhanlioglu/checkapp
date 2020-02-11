// Helper functions for saving data into shared preferences

import 'package:shared_preferences/shared_preferences.dart';

import 'constants.dart';

Future<void> saveWeight(double weight) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setDouble(sharedPrefWeight, weight);
  print('Weight is saved ($weight)');
}

Future<double> getWeightFromPref() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getDouble(sharedPrefWeight);
}

Future<void> saveHeight(double height) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setDouble(sharedPrefHeight, height);
  print('Height is saved ($height)');
}

Future<double> getHeightFromPref() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getDouble(sharedPrefHeight);
}
