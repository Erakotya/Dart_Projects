import 'dart:async'; //to create a stremcontroller

import 'package:flutter/material.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import '../ble/reactive_state.dart';
import 'package:meta/meta.dart';

class BleScanner implements ReactiveState<BleScannerState> {
  BleScanner({
    required FlutterReactiveBle ble,
  }) : _ble = ble;

  final FlutterReactiveBle _ble;

  final StreamController<BleScannerState> _stateStreamController =
      StreamController();

  // final _devices = <DiscoveredDevice>[]; //initializing list

  @override
  //The getter returns the controller's Stream instance, with which a listener can provide a callback to receive data updates
  Stream<BleScannerState> get state => _stateStreamController
      .stream; //the getter overrides the getter in the abstract class reactive state.

  void startScanning() {
    //_devices.clear();

    _subscription = _ble.scanForDevices(withServices: []).listen((device) {
      debugPrint(device.name);
    }, onError: (Object e) {
      debugPrint('error');
    });
  }

  StreamSubscription? _subscription;
}

@immutable
class BleScannerState {
  const BleScannerState({
    required this.discoveredDevices,
    required this.scanIsInProgress,
  });

  final List<DiscoveredDevice> discoveredDevices;
  final bool scanIsInProgress;
}


//https://dart.academy/streams-and-sinks-in-dart-and-flutter/