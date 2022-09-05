import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_3/main.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import '../ble/ble_scanner.dart';
import 'package:provider/provider.dart';
import 'package:after_layout/after_layout.dart';

class StateScreen extends StatefulWidget {
  @override
  State<StateScreen> createState() => _StateScreenState();
}

class _StateScreenState extends State<StateScreen>
    with AfterLayoutMixin<StateScreen> {
  @override
  void afterFirstLayout(BuildContext context) {
    //automatically scanning for devices when app is on
    final scanner = Provider.of<BleScanner>(context, listen: false);

    // Calling the same function "after layout" to resolve the issue.
    scanner.startScanning();
  }

  // final FlutterReactiveBle _ble;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('hi')),
        body: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                ElevatedButton(
                  child: const Text('Scan'),
                  onPressed: () {},
                )
              ],
            )
          ],
        ));
  }
}
