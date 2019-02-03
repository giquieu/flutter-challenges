import 'package:flutter/material.dart';

class CardItem extends StatefulWidget {
  
  final String title;
  final double value;
  final Color shapeColor;

  const CardItem({Key key, this.title, this.shapeColor, this.value}) : super(key: key);

  _CardItemState createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.15,
        color: Colors.grey[200],
        child: Row(
          children: <Widget>[
            Container(
              width: 5,
              color: widget.shapeColor,
            ),
            Expanded(
              child:  Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Container(
                          color: Colors.transparent,
                          child: Text(widget.title,
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Container(
                            child: Text("R\$", 
                                style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.w100, 
                                  color: Colors.grey[600]
                                ),
                              ),
                          ),
                          Spacer(),
                          Text(widget.value.toStringAsPrecision(5).replaceFirst(".", ","), 
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w100, 
                              color: Colors.grey[600]
                            )
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}