import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import './car.dart';

class Cars with ChangeNotifier{
  List<Car> _itemCar = [];

  List<Car> get items {
    return [... _itemCar];
  }
  
}