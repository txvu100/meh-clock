import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Ref {
  static SharedPreferences sharedPreferences;
  static String datePattern;
  static bool showDate = true;
  static bool ampmStyle = true;

  static const DATE_PATTERN = 'date_pattern';
  static const SHOW_DATE = 'show_date';
  static const AMPM_STYLE = 'ampm_style';
}