import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meh_clock/provider/reference.dart';
import 'package:meh_clock/screen/setting_screen.dart';
import 'package:provider/provider.dart';

class ClockScreen extends StatefulWidget {
  static const routeName = "/clock_screen";

  @override
  _ClockScreenState createState() => _ClockScreenState();
}

class _ClockScreenState extends State<ClockScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ClockWidget(),
// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class ClockWidget extends StatefulWidget {
  @override
  _ClockWidgetState createState() => _ClockWidgetState();
}

class _ClockWidgetState extends State<ClockWidget> {
  String _timeString;

  // String _date;
  String _ampm;
  Timer _timer;
  bool _flashDot = false;
  String _datePattern;

  @override
  void initState() {
    super.initState();
    _datePattern = Provider.of<Reference>(context, listen: false).datePattern;
    _timeString = _formatDateTime(DateTime.now());
    _ampm = _formatAMPM(DateTime.now());
    // _date = _formatDate(DateTime.now());
    _timer = new Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    final String formattedAMPM = _formatAMPM(now);
    final String formattedDate = _formatDate(now);
    setState(() {
      _timeString = formattedDateTime;
      _ampm = formattedAMPM;

      _flashDot = !_flashDot;
    });
  }

  String _formatDateTime(DateTime dateTime) {
    return _flashDot
        ? DateFormat('H:mm').format(dateTime)
        : DateFormat('H mm').format(dateTime);
  }

  String _formatAMPM(DateTime dateTime) {
    return DateFormat('aa').format(dateTime);
  }

  String _formatDate(DateTime dateTime) {
    return DateFormat(_datePattern).format(dateTime);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _datePattern = Provider.of<Reference>(context, listen: false).datePattern;
    Function startTimer = ModalRoute.of(context).settings.arguments;
    double screenWidth = MediaQuery.of(context).size.width;
    double timeSize = screenWidth / 3.5;
    double textSize = screenWidth / 30;
    double dateSize = screenWidth / 20;

    return Consumer<Reference>(builder: (context, ref, child) {
      return Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  DateFormat(ref.datePattern).format(DateTime.now()),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: dateSize,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'JetBrainsMono',
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.settings_sharp,
                    color: Colors.white,
                    size: 45.0,
                  ),
                  onPressed: () =>
                      Navigator.of(context).pushNamed(SettingScreen.routeName),
                ),
              ],
            ),
            Spacer(
              flex: 3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              children: [
                Text(
                  ref.ampmStyle
                      ? _flashDot
                          ? DateFormat('h:mm').format(DateTime.now())
                          : DateFormat('h mm').format(DateTime.now())
                      : _flashDot
                          ? DateFormat('H:mm').format(DateTime.now())
                          : DateFormat('H mm').format(DateTime.now()),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: timeSize,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'JetBrainsMono',
                  ),
                ),
                ref.ampmStyle
                    ? ref.showAMPMIndicator
                        ? Container(
                            // color: Colors.white,
                            margin: EdgeInsets.all(8.0),
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              _ampm,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: timeSize / 3,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'JetBrainsMono',
                              ),
                            ),
                          )
                        : SizedBox(height: 1.0)
                    : SizedBox(height: 1.0),
              ],
            ),
            Spacer(
              flex: 3,
            ),
            ref.showSecondBar
                ? Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 60,
                      itemBuilder: (context, index) => Container(
                        padding: EdgeInsets.all(2.0),
                        margin: EdgeInsets.all(2.0),
                        width: screenWidth / 60 - screenWidth / 240,
                        height: screenWidth / 60 - screenWidth / 240,
                        color: int.parse(
                                    DateFormat('ss').format(DateTime.now())) >=
                                index
                            ? Colors.white
                            : Colors.white10,
                        // decoration: BoxDecoration(
                        //    border: Border.all(color: Colors.white, width: 1.0,),
                        // ),
                      ),
                    ),
                  )
                : SizedBox(height: 1.0),
          ],
        ),
      );
    });
  }
}
