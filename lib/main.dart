import 'package:flutter/material.dart';
import 'package:meh_clock/provider/reference.dart';
import 'package:meh_clock/screen/clock_screen.dart';
import 'package:meh_clock/screen/setting_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'mehClock',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // primaryColor: Colors.amber,
        fontFamily: 'JetBrainsMono',
        textTheme: TextTheme(
          headline1: TextStyle(fontWeight: FontWeight.bold),
          headline6:
              TextStyle(fontStyle: FontStyle.normal, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      home: FutureBuilder(
        future: getRefs(),
        builder: (context, future) {
          if (future.connectionState == ConnectionState.waiting)
            return Text('loading...');
          else if (future.connectionState == ConnectionState.done)
            return ClockScreen();
          else
            return Text('error');
        }
      ),
      // initialRoute: ClockScreen.routeName,
      routes: {
        ClockScreen.routeName: (context) => ClockScreen(),
        SettingScreen.routeName: (context) => SettingScreen(),
      },
    );
  }
}

Future<void> getRefs() async {
  Ref.sharedPreferences = await SharedPreferences.getInstance();

  Ref.datePattern = Ref.sharedPreferences.getString(Ref.DATE_PATTERN) ?? "EEEE MMMM dd, yyyy";
  Ref.showDate = Ref.sharedPreferences.getBool(Ref.SHOW_DATE) ?? true;
  Ref.ampmStyle = Ref.sharedPreferences.getBool(Ref.AMPM_STYLE) ?? true;

  // print('DATE_PATTERN: ${Ref.datePattern}');
}