import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListCarItem extends StatelessWidget {
  final String id;
  final String brand;
  final String model;
  final String color;
  final String registration;
  final String year;
  final String ownerId;
  final String lat;
  final String lng;

  ListCarItem({
    this.id,
    this.brand,
    this.model,
    this.color,
    this.registration,
    this.year,
    this.ownerId,
    this.lat,
    this.lng,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Container(
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: Row(
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  //bottomRight: Radius.circular(20),
                ),
              ),
              child: Center(
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(
                      int.parse(color.replaceAll('#', '0xFF')),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
                child: Container(
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.grey[800],
                          borderRadius: BorderRadius.only(
                            //bottomLeft: Radius.circular(30),
                            //   topLeft: Radius.circular(10),
                            //topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          )),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 75,
                      decoration: BoxDecoration(
                          color: Colors.grey[600],
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            //   topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            //bottomRight: Radius.circular(10),
                          )),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0, top: 10),
                        child: Column(children: [
                          Row(
                            children: [
                              Text(
                                brand,
                                style: GoogleFonts.quicksand(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                model,
                                style: GoogleFonts.quicksand(
                                  color: Colors.white,
                                  fontSize: 22,
                                  
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5,),
                          Row(children: [
                            Text(
                                'Registration num.: ',
                                style: GoogleFonts.quicksand(
                                    color: Colors.white,
                                    fontSize: 18,
                                    
                            )),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                registration,
                                style: GoogleFonts.quicksand(
                                  color: Colors.white,
                                  fontSize: 18,
                                  
                                ),
                              ),
                          ],)
                        ]),
                      ),
                    ),
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
