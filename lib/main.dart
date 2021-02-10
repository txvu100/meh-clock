import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
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
  // String _ampm;
  Timer _timer;
  bool _flashDot = false;

  @override
  void initState() {
    super.initState();
    _timeString = _formatDateTime(DateTime.now());
    // _ampm = _formatAMPM(DateTime.now());

    _timer = new Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    final String formattedAMPM = _formatAMPM(now);
    setState(() {
      _timeString = formattedDateTime;
      // _ampm = formattedAMPM;
      _flashDot = !_flashDot;
    });
  }

  String _formatDateTime(DateTime dateTime) {
    return _flashDot ? DateFormat('h:mm').format(dateTime) : DateFormat('h mm').format(dateTime);
  }

  String _formatAMPM(DateTime dateTime) {
    return DateFormat('aaa').format(dateTime);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Function startTimer = ModalRoute.of(context).settings.arguments;
    double screenWidth = MediaQuery.of(context).size.width;
    double timeSize = screenWidth / 3.5;
    double textSize = screenWidth / 30;

    return Container(
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              _timeString,
              style: TextStyle(
                color: Colors.white,
                fontSize: timeSize,
                fontWeight: FontWeight.bold,
                fontFamily: 'JetBrainsMono',
              ),
            ),
            // Text(
            //   _ampm,
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontSize: timeSize/3,
            //     fontWeight: FontWeight.bold,
            //     fontFamily: 'JetBrainsMono',
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
