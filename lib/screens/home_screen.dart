import 'package:cars/providers/cars.dart';
import 'package:cars/screens/add_car.dart';
import 'package:cars/widgets/cars_list.dart';
import 'package:cars/widgets/language_switch.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);
  static const routeName = '/homeScreen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    Future.delayed(Duration.zero,(){
      final fetchCarData = Provider.of<Cars>(context, listen: false);
      fetchCarData.fetchCars();
      fetchCarData.fetchPeople();
      fetchCarData.getOwners();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    final carItems = Provider.of<Cars>(context,).items;
    final heightSize =
        MediaQuery.of(context).size.height; //get max height of screen
    final widthSize =
        MediaQuery.of(context).size.width; // get max width of screen
    final isEng = Provider.of<Cars>(context,).isEng;

    print(carItems);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => AddCar()));
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.red,
      ),
      backgroundColor: Color(0xFF222222),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 200,
            child: Stack(
              children: [
                Positioned(
                  top: heightSize * .08,
                  left: widthSize * .2,
                  child: Container(
                    height: 150,
                    width: 250,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        alignment: Alignment.centerLeft,
                        image: AssetImage("assets/mercedes.png"),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: heightSize * .05,
                  left: widthSize * .06,
                  child: Text( isEng ? 'Car' :
                    'Auto',
                    style: GoogleFonts.lobster(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  top: heightSize * .23,
                  left: widthSize * .8,
                  child: LanguageSwitch(),
                ),
              ],
            ),
          ),
          CarsList(),
        ],
      ),
    );
  }
}
