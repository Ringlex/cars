import 'package:flutter/foundation.dart';


class PersonList with ChangeNotifier {
  String id;
  String firstName;
  String lastName;
  String birthDate;
  String sex;

PersonList({
  this.id,
  this.firstName,
  this.lastName,
  this.birthDate,
  this.sex,
});

}