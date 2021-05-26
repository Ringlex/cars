import 'dart:math';

import 'package:cars/model/place.dart';
import 'package:cars/providers/car.dart';
import 'package:cars/providers/cars.dart';
import 'package:cars/widgets/location_input.dart';
import 'package:cars/widgets/location_map.dart';
import 'package:cars/widgets/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TextFields extends StatefulWidget {
  @override
  _TextFieldsState createState() => _TextFieldsState();
}

class _TextFieldsState extends State<TextFields> {
  final modelController = TextEditingController();
  final brandController = TextEditingController();
  final yearController = TextEditingController();
  final registrationNumberController = TextEditingController();

  bool isLoading = false;
  bool buttonReady = false;

  // create some values
  Color pickerColor = Color(0xff443a49);
  Color currentColor = Color(0xff443a49);

  String valueChoose = 'Libby Predovic';
  List<String> ownerList = [];
  
  String idOwner = '';

  void initState() {
    
    Future.delayed(Duration.zero,(){
      final fetchCarData = Provider.of<Cars>(context, listen: false);
      fetchCarData.getOwners();
      
    });
    super.initState();
  }

  @override
  void dispose() {
    modelController.dispose();
    brandController.dispose();
    yearController.dispose();
    registrationNumberController.dispose();
    super.dispose();
  }

  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  Future<void> _addCar() async {
    var newCar = Car(
        id: Random(20).toString(),
        brand: brandController.text.toString(),
        model: modelController.text.toString(),
        ownerId: idOwner,
        registration: registrationNumberController.text.toString(),
        year: yearController.text.toString(),
        color: currentColor
            .toString()
            .split('(0x')[1]
            .split(')')[0]
            .replaceAll('ff', '#'),
            lat: latitude.toString(),
            lng: longitude.toString());
    await Provider.of<Cars>(context, listen: false)
        .addNewCar(newCar)
        .then((void nothing) {
      setState(() {
        isLoading = false;
      });
    }).catchError((e) => print(e));
  }

  String localization;
  PlaceLocation _pickedLocation;
  double latitude = 0;
  double longitude = 0;

  Future<void> _selectPlace(double lat, double lng) async {
    _pickedLocation = PlaceLocation(latitude: lat, longitude: lng);
    String place = await LocationMap.getPlaceAddress(lat, lng);
    setState(() {
      //localization = place;
      latitude = lat;
      longitude = lng;
    });
  }

  @override
  Widget build(BuildContext context) {

    final owners = Provider.of<Cars>(context).owners;
    final peopleList = Provider.of<Cars>(context).people;
    ownerList = owners;
    print(ownerList);
    final isEng = Provider.of<Cars>(context,).isEng;
 
    return SingleChildScrollView(
      child: Align(
        alignment: Alignment.topCenter,
        child: Column(children: [
          Padding(
            padding: EdgeInsets.only(top: 15),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.08,
              width: MediaQuery.of(context).size.width * 0.87,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x0000001A),
                      blurRadius: 8,
                      spreadRadius: 0,
                      offset: Offset(0, 8),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xFF565656)),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: validateText,
                    //textAlign: TextAlign.start,
                    cursorColor: Colors.black,
                    style: TextStyle(color: Colors.black, fontSize: 17),
                    decoration: InputDecoration(

                        //filled: true,
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.transparent,
                        )),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                        hintText: isEng ?'Brand' : 'Marka',
                        hintStyle: TextStyle(
                          color: Color(0xFF8E8E8E),
                          fontSize: 18,
                        )),
                    controller: brandController,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.08,
              width: MediaQuery.of(context).size.width * 0.87,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x0000001A),
                      blurRadius: 8,
                      spreadRadius: 0,
                      offset: Offset(0, 8),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xFF565656)),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: validateText,
                    //textAlign: TextAlign.start,
                    cursorColor: Colors.black,
                    style: TextStyle(color: Colors.black, fontSize: 17),
                    decoration: InputDecoration(

                        //filled: true,
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.transparent,
                        )),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                        hintText: 'Model',
                        hintStyle: TextStyle(
                          color: Color(0xFF8E8E8E),
                          fontSize: 18,
                        )),
                    controller: modelController,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.08,
              width: MediaQuery.of(context).size.width * 0.87,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x0000001A),
                      blurRadius: 8,
                      spreadRadius: 0,
                      offset: Offset(0, 8),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xFF565656)),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: validateYear,
                    //textAlign: TextAlign.start,
                    cursorColor: Colors.black,
                    style: TextStyle(color: Colors.black, fontSize: 17),
                    decoration: InputDecoration(

                        //filled: true,
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.transparent,
                        )),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                        hintText: isEng ? 'Year of production' : 'Rok produkcji',
                        hintStyle: TextStyle(
                          color: Color(0xFF8E8E8E),
                          fontSize: 18,
                        )),
                    controller: yearController,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.08,
              width: MediaQuery.of(context).size.width * 0.87,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x0000001A),
                      blurRadius: 8,
                      spreadRadius: 0,
                      offset: Offset(0, 8),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xFF565656)),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: validateText,
                    //textAlign: TextAlign.start,
                    cursorColor: Colors.black,
                    style: TextStyle(color: Colors.white, fontSize: 17),
                    decoration: InputDecoration(

                        //filled: true,
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.transparent,
                        )),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                        hintText: isEng ? 'Registration number' : 'Numer rejestracyjny',
                        hintStyle: TextStyle(
                          color: Color(0xFF8E8E8E),
                          fontSize: 18,
                        )),
                    controller: registrationNumberController,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0, left: 30),
            child: Align(
              alignment: Alignment.center,
              child: Row(
                children: [
                  Text(
                    isEng ? 'Select color: ' : 'Wybierz kolor ',
                    style: GoogleFonts.quicksand(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              print(currentColor
                                  .toString()
                                  .split('(0x')[1]
                                  .split(')')[0]
                                  .replaceAll('ff', '#'));
                              return AlertDialog(
                                title:  Text(isEng ? 'Pick a color!': 'Wybierz kolor'),
                                content: SingleChildScrollView(
                                  child: ColorPicker(
                                    pickerColor: pickerColor,
                                    onColorChanged: changeColor,
                                    showLabel: true,
                                    pickerAreaHeightPercent: 0.8,
                                  ),
                                ),
                                actions: <Widget>[
                                  FlatButton(
                                    child:  Text(isEng ? 'Got it' : 'Mam to'),
                                    onPressed: () {
                                      setState(
                                          () => currentColor = pickerColor);
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            });
                      },
                      child: Container(
                        height: 30,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: currentColor,
                        ),
                      ))
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.08,
              width: MediaQuery.of(context).size.width * 0.87,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color(0x0000001A),
                    blurRadius: 8,
                    spreadRadius: 0,
                    offset: Offset(0, 8),
                  ),
                ],
                borderRadius: BorderRadius.circular(15),
                color: Color(0xFF535353),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 8.0, right: 8.0),
                child: Center(
                  child: DropdownButton(
                    dropdownColor: Color(0xFF565656),
                    style: TextStyle(
                      color: Color(0xFF8E8E8E),
                    ),
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: Color(0xFF8E8E8E),
                      size: 35,
                    ),
                    hint: Text(
                      isEng ? '   Select owner                 ' : '  Wybierz właściciela     ',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF8E8E8E),
                      ),
                    ),
                    elevation: 16,
                    underline: Container(height: 2, color: Color(0xFF565656)),
                    value: valueChoose,
                    onChanged: (String value) {
                      setState(() {
                        valueChoose = value;
                      });
                    },
                    items: ownerList.map((String value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(fontSize: 22),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ),
          //Here should be location widget
          Container(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.03,
              ),
              //height: MediaQuery.of(context).size.height * 0.35,
              width: MediaQuery.of(context).size.width * 0.87,
              child: LocationInput(_selectPlace),
            ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 0.87,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: buttonReady
                      ? Colors.grey
                      :  Color(0xFF00D1CD),
                          
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(22)),
                  ),
                ),
                onPressed: (brandController.text.isEmpty ||
                        modelController.text.isEmpty ||
                        yearController.text.isEmpty ||
                        registrationNumberController.text.isEmpty)
                    ? null //buttonReady = false
                    : () async {
                        setState(() {
                          isLoading = true;
                          buttonReady = true;
                        });
                          final owner = valueChoose.split(" ");
                          var data = peopleList.indexWhere((item) => item.firstName == owner[0]);
                          idOwner = peopleList[data].id.toString();
                        _addCar().then((value) {
                          ScaffoldMessenger.of(context).showSnackBar(
                             SnackBar(
                              content: Text(isEng ? 'Car has beed added!' : 'Samochód został dodany!'),
                            ),
                          );
                        }); //Addres field mus be passed as argument!!!
                      },
                child: isLoading
                    ? CircularProgressIndicator()
                    : Text(
                        isEng ? 'Add car' : 'Dodaj auto',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
