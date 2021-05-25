import 'package:cars/widgets/language_switch.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CarItemDetail extends StatefulWidget {
  final String id;
  final String brand;
  final String model;
  final String ownerId;
  final String year;
  final String color;
  final String registration;
  final String lat;
  final String lng;

  CarItemDetail(
      {this.id,
      this.brand,
      this.model,
      this.ownerId,
      this.year,
      this.color,
      this.registration,
      this.lat,
      this.lng});

  @override
  _CarItemDetailState createState() => _CarItemDetailState();
}

class _CarItemDetailState extends State<CarItemDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF222222),
      appBar: AppBar(
        backgroundColor: Color(0xFF222222),
        shadowColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.chevron_left,
            color: Colors.white,
            size: 50,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0, top: 5.0),
            child: LanguageSwitch(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(height: 200, width: double.infinity),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                children: [
                  Text(
                    'Owner: ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 10,),
                  Text(widget.brand,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                    ),)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                children: [
                  
                  Text(
                    'Brand: ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 10,),
                  Text(widget.brand,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                    ),)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                children: [
                  Text(
                    'Model: ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 10,),
                  Text(widget.model,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                    ),)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                children: [
                  Text(
                    'Year of production: ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 10,),
                  Text(widget.year,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                    ),)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
