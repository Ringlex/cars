import 'package:flutter/foundation.dart';


class Car with ChangeNotifier {
  String id;
   String brand;
   String model;
   String color;
   String registration;
   String year;
   String ownerId;
   String lat;
   String lng;

  
  

  Car({
     this.id,
     this.brand,
     this.model,
     this.color,
     this.registration,
     this.year,
     this.ownerId,
     this.lat,
     this.lng ,
    
  });


}