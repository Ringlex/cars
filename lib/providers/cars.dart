import 'dart:convert';
//import 'dart:io';

import 'package:cars/api/iteo.dart';
import 'package:cars/providers/person_list.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import './car.dart';

class Cars with ChangeNotifier {
  List<Car> _itemCar = [];

  List<Car> get items {
    return [..._itemCar];
  }

  List<PersonList> _itemPerson = [];

  String owner;
  List<String> owners = [];
  bool isEng = false;

  List<PersonList> get people {
    return [..._itemPerson];
  }

  Future<void> fetchCars() async {
    var urlCar = 'https://iteorecruitment-591c.restdb.io/rest/car-list';

    try {
      final response = await http.get(urlCar, headers: {"x-apikey": API_KEY});
      final fetchedData = json.decode(response.body) as List<dynamic>;
      final List<Car> loadedCars = [];
      //var data = fetchedData as List<dynamic>;

      for (int i = 0; i < fetchedData.length; i++) {
        loadedCars.add(Car(
          id: fetchedData[i]['_id'],
          brand: fetchedData[i]['brand'],
          model: fetchedData[i]['model'],
          color: fetchedData[i]['color'],
          registration: fetchedData[i]['registration'],
          year: fetchedData[i]['year'],
          ownerId: fetchedData[i]['ownerId'],
          lat: fetchedData[i]['lat'].toString(),
          lng: fetchedData[i]['lng'].toString(),
        ));
      }

      _itemCar = loadedCars;
      print(_itemCar[0].brand);

      notifyListeners();
    } catch (error) {
      print(error);
      throw (error);
    }
  }

  Future<void> fetchPeople() async {
    var urlPerson = 'https://iteorecruitment-591c.restdb.io/rest/person-list';

    try {
      final response = await http.get(urlPerson, headers: {
        "x-apikey": API_KEY,
        "Accept": "application/json",
      });
      final fetchedPeople = json.decode(response.body) as List<dynamic>;
      final List<PersonList> loadedPeople = [];

      for (int i = 0; i < fetchedPeople.length; i++) {
        //owners.add(fetchedPeople[i]['first_name']+' '+fetchedPeople[i]['last_name']);
        loadedPeople.add(PersonList(
          id: fetchedPeople[i]['_id'],
          firstName: fetchedPeople[i]['first_name'],
          lastName: fetchedPeople[i]['last_name'],
          birthDate: fetchedPeople[i]['birth_date'],
          sex: fetchedPeople[i]['sex'],
        ));
      }

      _itemPerson = loadedPeople;
      //getOwners();
      print(_itemPerson[0].lastName);
      notifyListeners();
    } catch (error) {
      print(error);
      throw (error);
    }
  }

  Future<void> getOwners() async {
    final List<String> loadedOwners = [];
    for (int i = 0; i < _itemPerson.length; i++) {
      loadedOwners.add(_itemPerson[i].firstName.toString() +
          ' ' +
          _itemPerson[i].lastName.toString());
      owners = loadedOwners;
      notifyListeners();
    }
  }

  Future<void> addNewCar(Car car) async {
    try {
      await _itemCar.add(Car(
        brand: car.brand,
        model: car.model,
        year: car.year,
        registration: car.registration,
        ownerId: car.ownerId,
        color: car.color,
        id: car.id,
        lat: car.lat,
        lng: car.lng,
      ));

      var carUrl = 'https://iteorecruitment-591c.restdb.io/rest/car-list';

      var response = await http.post(
        carUrl,
        headers: {
           'x-apikey': '$API_KEY',
           'Content-Type': 'application/json',
        },
        body: json.encode({
          'brand' : car.brand,
          'model' : car.model,
          'color' : car.color,
          'registration' : car.registration,
          'year' : car.year,
          'ownerId' : car.ownerId,
          'lat' : car.lat,
          'lng' : car.lng,
        })
      );

      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }

  void changeLanguage(bool state){
      isEng = state;
      notifyListeners();
  }

  String getOwner(String id){
    
    int data = _itemPerson.indexWhere((item) => item.id == id);
    print(_itemPerson.length.toString());
    if(_itemPerson[data].firstName == null){
      return isEng? 'Information is not available' : 'Informacja niedostępna';
    }
    else return _itemPerson[data].firstName + ' ' + _itemPerson[data].lastName;
  }
}
