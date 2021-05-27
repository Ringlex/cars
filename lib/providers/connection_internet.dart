import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class ConnectionInternet with ChangeNotifier {
  Connectivity _connection = new Connectivity();

  bool _isOnline;
  bool get isOnline => _isOnline;

  checkConnection() async{
    await startConnection();
    _connection.onConnectivityChanged.listen((result) async{
      if(result == ConnectivityResult.none) {
        _isOnline = false;
        notifyListeners();
      } else {
        await _updateConnection().then((bool isConnected) {
          _isOnline = isConnected;
          notifyListeners();
        });
      }
    });
  }

  Future<void> startConnection() async{
    try{
      var status = await _connection.checkConnectivity();

      if(status == ConnectivityResult.none){
        _isOnline = false;
        notifyListeners();
      }
      else{
        _isOnline = true;
        notifyListeners();
      }
    } on PlatformException catch (e) {
      print('PlatformException: ' + e.toString());
    }
  }

  Future<bool> _updateConnection() async{
    bool isConnected;
    try{
      final List<InternetAddress> result = await InternetAddress.lookup('google.com');
      if(result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        isConnected = true;
      }
    } on SocketException catch (_){
      isConnected = false;
    }
    return isConnected;
  }
}
