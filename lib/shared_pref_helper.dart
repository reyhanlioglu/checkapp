// Helper functions for saving data into shared preferences

import 'package:shared_preferences/shared_preferences.dart';

import 'constants.dart';

Future<void> saveUserID(String id) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString(sharedPrefID, id);
  print('User ID is saved ($id)');
}

Future<String> getUserIDFromPref() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString(sharedPrefID);
}

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

Future<void> saveBMI(double bmi) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setDouble(sharedPrefBMI, bmi);
  print('BMI is saved ($bmi)');
}

Future<double> getBMIFromPref() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getDouble(sharedPrefBMI);
}

Future<void> saveBMICategory(String category) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString(sharedPrefBMICategory, category);
  print('BMI Category is saved ($category)');
}

Future<String> getBMICategoryFromPref() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString(sharedPrefBMICategory);
}
