import 'package:flutter/material.dart';

class LanguageSwitch extends StatefulWidget {
  @override
  _LanguageSwitchState createState() => _LanguageSwitchState();
}

class _LanguageSwitchState extends State<LanguageSwitch> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 70,
      child: Row(
        children: [
          Container(
            child: Text(
              'PL',
              style: TextStyle(
                color: Colors.white,
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(width: 10,),
          Container(
            child: Text(
              'EN',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
