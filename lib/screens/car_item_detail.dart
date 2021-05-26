import 'package:cars/providers/cars.dart';
import 'package:cars/widgets/language_switch.dart';
import 'package:cars/widgets/location_map.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class CarItemDetail extends StatefulWidget {
  final String id;
  final String brand;
  final String model;
  final String owner;
  final String year;
  final String color;
  final String registration;
  final String lat;
  final String lng;

  CarItemDetail(
      {this.id,
      this.brand,
      this.model,
      this.owner,
      this.year,
      this.color,
      this.registration,
      this.lat,
      this.lng});

  @override
  _CarItemDetailState createState() => _CarItemDetailState();
}

class _CarItemDetailState extends State<CarItemDetail> {

  String _previewImageUrl;

  

  @override
  void initState() {
    final staticMapImageUrl = LocationMap.generateLocationPreviewImage(
        latitude: double.parse(widget.lat), longitude: double.parse(widget.lng));

    _previewImageUrl = staticMapImageUrl;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isEng = Provider.of<Cars>(context,).isEng;
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
            SizedBox(height: 25),
          Container(
            //height: 170,
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              //border: Border.all(width: 0, color: Colors.grey),
            ),
            child: _previewImageUrl == null
                ? Text(isEng ? 
                    'No Location Available' : 'Brak lokalizacji',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black),
                  )
                : Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        // BoxShadow(
                        //   color: Colors.grey[300],
                        //   blurRadius: 12,
                        //   spreadRadius: 0.9,
                        //   offset: Offset(0, 8),
                        // ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.black,
                        width: 0.8,
                      ),
                    ),
                    width: double.infinity,
                    height: 170,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        _previewImageUrl,
                        fit: BoxFit.cover,
                        //width: double.infinity,
                      ),
                    ),
                  ),
          ),
          SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                children: [
                  Text(isEng ? 
                    'Owner: ' : 'Właściciel: ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 10,),
                  Text(widget.owner,
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
                  
                  Text(isEng ? 
                    'Brand: ' : 'Marka: ',
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
                  Text(isEng ? 
                    'Year of production: ' : 'Rok produkcji: ',
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
