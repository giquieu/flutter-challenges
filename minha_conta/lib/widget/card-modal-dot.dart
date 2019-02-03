import 'package:flutter/material.dart';

class CardModalDot extends StatefulWidget {
  
  final PageController pageController;

  const CardModalDot({Key key, this.pageController}) : super(key: key);
  
  _CardModalDotState createState() => _CardModalDotState();
}

class _CardModalDotState extends State<CardModalDot> {

  int pageSelected = 0;

  @override
  void initState() {
    super.initState();
    widget.pageController.addListener(() {
      setState(() {
        pageSelected = widget.pageController.page.round();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
       child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: () {
                if (0 != pageSelected) {
                  widget.pageController.animateToPage(0, duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
                }
            },
            child: Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: 0 == pageSelected ? Colors.green : Colors.grey),
            ),
          ),
          Container(
            width: 10,
          ),
          GestureDetector(
            onTap: () {
                if (1 != pageSelected) {
                  widget.pageController.animateToPage(1, duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
                }
            },
            child: Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: 1 == pageSelected ? Colors.green : Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}