import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cars.dart';

class LanguageSwitch extends StatefulWidget {
  @override
  _LanguageSwitchState createState() => _LanguageSwitchState();
}

class _LanguageSwitchState extends State<LanguageSwitch> {
  @override
  Widget build(BuildContext context) {
    final isEng = Provider.of<Cars>(context).isEng;
    return Container(
      height: 50,
      width: 70,
      child: Row(
        children: [
          GestureDetector(
            onTap: (){
              Provider.of<Cars>(context, listen: false).changeLanguage(false);
            },
                      child: Container(
              child: Text(
                'PL',
                style: TextStyle(
                  color: !isEng ? Colors.white : Colors.grey,
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(width: 10,),
          GestureDetector(
            onTap: (){
              Provider.of<Cars>(context, listen: false).changeLanguage(true);
            },
                      child: Container(
              child: Text(
                'EN',
                style: TextStyle(
                  color: isEng ? Colors.white :Colors.grey,
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
