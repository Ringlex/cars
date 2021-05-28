import 'package:cars/providers/cars.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NoInternet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isEng = Provider.of<Cars>(context,).isEng;
    
    return Expanded(
      child: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Text(isEng ? 'No connection with Internet.' : 'Brak połączenia z Internetem.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                )),
                SizedBox(height: 15,),
                Text(isEng ? 'Make sure Wi-Fi is on!' : 'Upewnij się, że Wi-Fi jest włączone!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                )),
          ]),
        ),
      ),
    );
  }
}
