import 'package:cars/providers/cars.dart';
import 'package:cars/widgets/cars_grid.dart';
import 'package:cars/widgets/grid_car_item.dart';
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final fetchCarData = Provider.of<Cars>(context);

    fetchCarData.fetchPeople();
    final carItems = Provider.of<Cars>(context).items;
    //final owners = Provider.of<Cars>(context).people;

    final heightSize =
        MediaQuery.of(context).size.height; //get max height of screen
    final widthSize =
        MediaQuery.of(context).size.width; // get max width of screen

    print(carItems.toList());

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
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
                  child: Text(
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
          CarsGrid(),
        ],
      ),
    );
  }
}
