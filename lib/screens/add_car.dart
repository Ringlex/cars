
import 'package:cars/widgets/language_switch.dart';
import 'package:cars/widgets/text_fields.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddCar extends StatefulWidget {

  @override
  _AddCarState createState() => _AddCarState();
}

class _AddCarState extends State<AddCar> {


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
        title: Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Text(
            'Add car',
            style: GoogleFonts.quicksand(
              fontSize: 40,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right:20.0, top: 5.0),
            child: LanguageSwitch(),
          ),
        ],
      ),
      body: TextFields(),
    );
  }
}
