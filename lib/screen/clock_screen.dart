import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meh_clock/provider/reference.dart';
import 'package:meh_clock/screen/setting_screen.dart';
import 'package:provider/provider.dart';
import 'package:wakelock/wakelock.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ClockScreen extends StatefulWidget {
  static const routeName = "/clock_screen";

  @override
  _ClockScreenState createState() => _ClockScreenState();
}

class _ClockScreenState extends State<ClockScreen> {
  Timer timer;
  String time = '';
  bool flashDot = false;

  @override
  void initState() {
    print('initState()');
    super.initState();
    Wakelock.enable();

    timer = new Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
  }

  void _getTime() {
    final DateTime now = DateTime.now();
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
