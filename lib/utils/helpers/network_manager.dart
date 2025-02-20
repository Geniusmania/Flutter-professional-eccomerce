import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart'; // Needed for PlatformException
import 'package:get/get.dart';
import 'package:ui/utils/popups/loaders.dart';

class NetworkManager extends GetxController {
  static NetworkManager get instance => Get.find();

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
  final Rx<ConnectivityResult> _connectionStatus = ConnectivityResult.none.obs;

  @override
  void onInit() {
    super.onInit();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((results) {
          if (results.isNotEmpty) {
            _updateConnectionStatus(results.first);
          }
        });
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    _connectionStatus.value = result;
    if (result == ConnectivityResult.none) {
      Loaders.warningSnackBar(title: 'No internet connection');
    }
  }

  Future<bool> isConnected() async {
    try {
      final results = await _connectivity.checkConnectivity();
      return results.isNotEmpty && results.first != ConnectivityResult.none;
    } on PlatformException catch (_) {
      return false; // Handle exception safely
    }
  }

  @override
  void onClose() {
    _connectivitySubscription.cancel(); // Dispose of the subscription
    super.onClose();
  }
}
