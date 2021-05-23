import 'dart:convert';

import 'package:cars/api/iteo.dart';
import 'package:cars/providers/person_list.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import './car.dart';

class Cars with ChangeNotifier{
  List<Car> _itemCar = [];

  List<Car> get items {
    return [... _itemCar];
  }

  List<PersonList> _itemPerson = [];

  List<PersonList> get people {
    return [..._itemPerson];
  }

  Future<void> fetchCars() async{

    var url_car = 'https://iteorecruitment-591c.restdb.io/rest/car-list&client_id$API_KEY';

    try{

      final response = await http.get(url_car);
      final fetchedData = json.decode(response.body) as Map<String, dynamic>;
      final List<Car> loadedCars = [];

      for (int i = 0; i< fetchedData.length; i++){
        loadedCars.add(Car(
          id: fetchedData[i]['_id'],
          brand: fetchedData[i]['brand'],
          model: fetchedData[i]['model'],
          color: fetchedData[i]['color'],
          registration: fetchedData[i]['registration'],
          year: fetchedData[i]['year'],
          ownerId: fetchedData[i]['ownerId'],
          lat: fetchedData[i]['lat'],
          lng: fetchedData[i]['lng'],
        ));
      }

      _itemCar = loadedCars;

      notifyListeners();


    } catch (error) {
      print(error);
      throw (error);
    }
  }

  Future<void> fetchPeople() async{
    
    var url_person = 'https://iteorecruitment-591c.restdb.io/rest/person-list&client_id$API_KEY';

    try{

      final response = await http.get(url_person);
      final fetchedPeople = json.decode(response.body) as Map<String, dynamic>;
      final List<PersonList> loadedPeople = [];

      for(int i = 0; i< fetchedPeople.length; i++){
        loadedPeople.add(PersonList(
          id:fetchedPeople[i]['_id'],
          firstName: fetchedPeople[i]['first_name'],
          lastName: fetchedPeople[i]['last_name'],
          birthDate: fetchedPeople[i]['birth_date'],
          sex: fetchedPeople[i]['sex'],
          ));
      }

      _itemPerson = loadedPeople;

      notifyListeners();

    }catch (error){
      print(error);
      throw (error);
    }

  }
  
}