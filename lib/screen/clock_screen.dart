import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meh_clock/provider/reference.dart';
import 'package:meh_clock/screen/setting_screen.dart';
import 'package:provider/provider.dart';
import 'package:wakelock/wakelock.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sunrise_sunset/sunrise_sunset.dart';

class ClockScreen extends StatefulWidget {
  static const routeName = "/clock_screen";

  @override
  _ClockScreenState createState() => _ClockScreenState();
}

class _ClockScreenState extends State<ClockScreen> {
  Timer timer;
  String time = '';
  bool flashDot = false;
  bool isDayTime = true;
  var response;

  @override
  void initState() {
    print('initState()');
    super.initState();
    Wakelock.enable();

    timer = new Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
  }

  Future<void> _getTime() async {
    final DateTime now = DateTime.now();

    // if (now.second%10 == 0) {
    //   response = await SunriseSunset.getResults(date: DateTime.now(), latitude: 35.373924, longitude: -97.5642104);
    //   print(response.data.sunrise);
    //
    // }

    // if (now.difference(response.data.sunrise).inMinutes == 0) {
      // now.compareTo(other)
    // }

    setState(() {
      time = flashDot ? DateFormat('h:mm').format(now) : DateFormat('h mm').format(now);
      flashDot = !flashDot;
    });
  }

  @override
  void dispose() {
    print('dispose()');
    super.dispose();
    timer.cancel();
  }

  @override
  void didChangeDependencies() {
    print('didChangeDependencies()');
    super.didChangeDependencies();

    // Ref.sharedPreferences.setString(Ref.DATE_PATTERN, 'DD/MM');
  }

  @override
  void didUpdateWidget(covariant ClockScreen oldWidget) {
    print('didChangeDependencies()');
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => Navigator.pushNamed(context, SettingScreen.routeName),
        child: Container(
          color: Colors.black,
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.width / 7,
                // color: Colors.white70,
                child: Image.asset('images/logo.jpg'),
              ),
              Center(
                child: Container(
                  // color: Colors.black,
                  padding: EdgeInsets.all(30.0),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      time,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'DS-DIGIB',
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
