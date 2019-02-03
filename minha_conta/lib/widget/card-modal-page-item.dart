import 'package:flutter/material.dart';

class CardModalPageItem extends StatelessWidget {

  final IconData icon;
  final String text;

  const CardModalPageItem({Key key, this.icon, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Icon(
          icon,
          color: Colors.grey,
          size: 40,
        ),
        Padding(
          padding:
              const EdgeInsets.only(top: 4, bottom: 20, left: 30, right: 30),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey, fontSize: 10),
          ),
        ),
      ],
    );
  }
  
}