import 'package:cars/providers/cars.dart';
import 'package:cars/providers/connection_internet.dart';
import 'package:cars/screens/add_car.dart';
import 'package:cars/widgets/cars_list.dart';
import 'package:cars/widgets/language_switch.dart';
import 'package:cars/widgets/no_internet.dart';
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
    Provider.of<ConnectionInternet>(context, listen: false).checkConnection();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    final isEng = Provider.of<Cars>(context).isEng;
    final heightSize =
        MediaQuery.of(context).size.height; 
    final widthSize =
        MediaQuery.of(context).size.width; 
    

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (BuildContext context) => AddCar()));
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
                  child: Text(
                    isEng ? 'Car' : 'Auto',
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
          page(),
        ],
      ),
    );
  }

  Widget page() {
    return Consumer<ConnectionInternet>(
      builder: (context, model, child) {
        if (model.isOnline != null) {
          return model.isOnline ? CarsList() : NoInternet();
        }
        return Container(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
