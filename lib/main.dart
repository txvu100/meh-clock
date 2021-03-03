import 'package:flutter/material.dart';
import 'package:meh_clock/provider/reference.dart';
import 'package:meh_clock/screen/clock_screen.dart';
import 'package:meh_clock/screen/setting_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Reference(),
        ),
      ],
      child: MaterialApp(
        title: 'mehClock',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // primaryColor: Colors.amber,
          fontFamily: 'JetBrainsMono',
          textTheme: TextTheme(
            headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            headline6: TextStyle(
                fontSize: 16.0, fontStyle: FontStyle.normal, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        home: Text("mehClock"),
        initialRoute: ClockScreen.routeName,
        routes: {
          ClockScreen.routeName: (context) => ClockScreen(),
          SettingScreen.routeName: (context) => SettingScreen(),
        },
      ),
    );
  }
}
