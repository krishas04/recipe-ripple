import 'package:flutter/material.dart';

abstract class BaseDietModel {
  String get name;
  String get iconPath;
  String get level;
  String get duration;
  String get calories;
  List<String> get ingredients;
  String get instructions;
  Color get boxColor;

  bool get isSelected;
  set isSelected(bool value); //setter
}
