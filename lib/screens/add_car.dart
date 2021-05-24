import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddCar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF222222),
      appBar: AppBar(
        backgroundColor: Color(0xFF222222),
        shadowColor: Colors.transparent,
        leading: Icon(
          Icons.chevron_left,
          color: Colors.white,
          size: 30,
        ),
        title: Text('Add car', style: GoogleFonts.quicksand(
          fontSize: 40,
          color: Colors.white,
        ),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
