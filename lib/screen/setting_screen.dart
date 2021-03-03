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
  _Controller controller;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    controller = _Controller(this);
  }

  void render(fn) {
    setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Reference>(builder: (context, ref, child) {
      return Scaffold(
        // backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Text(
            'Reference',
            style: TextStyle(
              color: Colors.black,
              fontSize: 26.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: IconButton(
                  icon: Icon(
                    Icons.check_box_outlined,
                    color: Colors.black87,
                    size: 45.0,
                  ),
                  onPressed: controller.save),
            )
          ],
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(20),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ToggleSwitch(
                      initialLabelIndex: 0,
                      labels: ['24-hour', 'AM-PM'],
                      minWidth: 100.0,
                      fontSize: 18.0,
                      activeBgColor: Colors.blue,
                      activeFgColor: Colors.white,
                      inactiveBgColor: Colors.black12,
                      inactiveFgColor: Colors.black,
                      onToggle: (index) {
                        print('switched to: $index');
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      Spacer(flex: 1),
                      Expanded(
                        flex: 1,
                        child: TextFormField(
                          initialValue: ref.datePattern,
                          style: TextStyle(fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                            labelText: 'Date format string',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1.5),
                            ),
                          ),
                          validator: controller.validateDateFormat,
                          onSaved: (value) {
                            ref.datePattern = value;
                            print(ref.datePattern);
                            ref.notifyListeners();
                          },
                        ),
                      ),
                      Spacer(flex: 1),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      Spacer(flex: 1),
                      Expanded(
                        flex: 1,
                        child: Container(
                          color: Colors.black12,
                          child: CheckboxListTile(
                            title: Text(
                              "Show second bar",
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            value: ref.showSecondBar,
                            onChanged: (newValue) {
                              setState(() {
                                ref.showSecondBar = newValue;
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                      ),
                      Spacer(flex: 1),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      Spacer(flex: 1),
                      Expanded(
                        flex: 1,
                        child: Container(
                          color: Colors.black12,
                          child: CheckboxListTile(
                            title: Text(
                              "Show AM-PM indicator",
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            value: ref.showAMPMIndicator,
                            onChanged: (newValue) {
                              setState(() {
                                ref.showAMPMIndicator = newValue;
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                      ),
                      Spacer(flex: 1),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}

class _Controller {
  _SettingScreenState state;

  _Controller(this.state);

  String validateDateFormat(String value) {
    if (value.length <= 0) {
      return 'Please enter the format string';
    } else {
      return null;
    }
  }

  void save() {
    if (state.formKey.currentState.validate()) {
      state.formKey.currentState.save();
      Navigator.of(state.context).pop();
    }
  }
}
