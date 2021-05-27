import 'package:flutter/material.dart';

class NoInternet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('No connection with Internet. Make sure Wi-Fi is on!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            )),
      ),
    );
  }
}
