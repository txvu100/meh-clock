import 'package:flutter/material.dart';
import 'package:meh_clock/provider/reference.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';

class SettingScreen extends StatefulWidget {
  static const routeName = "/setting_screen";

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        // backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black87,
          title: Text(
            'Reference',
            style: TextStyle(
              color: Colors.white,
              // fontSize: 26.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: null
        // Container(
        //   width: MediaQuery.of(context).size.width,
        //   padding: EdgeInsets.all(20),
        //   child: Form(
        //     key: formKey,
        //     child: SingleChildScrollView(
        //       child: Column(
        //         crossAxisAlignment: CrossAxisAlignment.center,
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: [
        //           Padding(
        //             padding: const EdgeInsets.all(20.0),
        //             child: ToggleSwitch(
        //               initialLabelIndex: Ref.ampmStyle ? 1 : 0,
        //               labels: ['24-hour', 'AM-PM'],
        //               minWidth: 100.0,
        //               fontSize: 18.0,
        //               activeBgColor: Colors.blue,
        //               activeFgColor: Colors.white,
        //               inactiveBgColor: Colors.black12,
        //               inactiveFgColor: Colors.black,
        //               onToggle: (index) {
        //                 if (index == 0) Ref.ampmStyle = false;
        //               },
        //             ),
        //           ),
        //           SizedBox(
        //             height: 20.0,
        //           ),
        //           Row(
        //             children: [
        //               Spacer(flex: 1),
        //               Expanded(
        //                 flex: 1,
        //                 child: TextFormField(
        //                   initialValue: Ref.datePattern,
        //                   style: TextStyle(fontWeight: FontWeight.bold),
        //                   decoration: InputDecoration(
        //                     labelText: 'Date format string',
        //                     border: OutlineInputBorder(
        //                       borderRadius: BorderRadius.circular(8),
        //                       borderSide: BorderSide(color: Colors.grey, width: 1.5),
        //                     ),
        //                   ),
        //                   validator: controller.validateDateFormat,
        //                   onSaved: (value) {
        //                     Ref.datePattern = value;
        //                     print(Ref.datePattern);
        //                   },
        //                 ),
        //               ),
        //               Spacer(flex: 1),
        //             ],
        //           ),
        //           SizedBox(
        //             height: 20.0,
        //           ),
        //           Row(
        //             children: [
        //               Spacer(flex: 1),
        //               Expanded(
        //                 flex: 1,
        //                 child: Container(
        //                   color: Colors.black12,
        //                   child: CheckboxListTile(
        //                     title: Text(
        //                       "Show second bar",
        //                       style: Theme.of(context).textTheme.headline6,
        //                     ),
        //                     value: Ref.showSecondBar,
        //                     onChanged: (newValue) {
        //                       setState(() {
        //                         Ref.showSecondBar = newValue;
        //                       });
        //                     },
        //                     controlAffinity: ListTileControlAffinity.leading,
        //                   ),
        //                 ),
        //               ),
        //               Spacer(flex: 1),
        //             ],
        //           ),
        //           SizedBox(
        //             height: 20.0,
        //           ),
        //           Row(
        //             children: [
        //               Spacer(flex: 1),
        //               Expanded(
        //                 flex: 1,
        //                 child: Container(
        //                   color: Colors.black12,
        //                   child: CheckboxListTile(
        //                     title: Text(
        //                       "Show AM-PM indicator",
        //                       style: Theme.of(context).textTheme.headline6,
        //                     ),
        //                     value: Ref.showAMPMIndicator,
        //                     onChanged: (newValue) {
        //                       setState(() {
        //                         Ref.showAMPMIndicator = newValue;
        //                       });
        //                     },
        //                     controlAffinity: ListTileControlAffinity.leading,
        //                   ),
        //                 ),
        //               ),
        //               Spacer(flex: 1),
        //             ],
        //           ),
        //         ],
        //       ),
        //     ),
        //   ),
        // ),
      );
  }
}