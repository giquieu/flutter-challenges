import 'package:flutter/material.dart';
import 'package:minha_conta/widget/card-item.dart';
import 'package:minha_conta/widget/card-modal.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

  AnimationController animationController;
  Animation animationTranslation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 300));
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();    
    animationTranslation = Tween(
      begin: MediaQuery.of(context).size.height * 0.3, 
      end: 0.0
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.linear
      )
    );
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF5F5F5),
        title: Text(
          "Minha Conta - Saldo",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.black,
          ),
          onPressed: () {
            print("AppBar Leading Clicked");
          },
        ),
      ),
      body: Stack(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CardItem(
                title: "Disponivel",     
                value: 152.32,         
                shapeColor: Colors.green,
              ),
              CardItem(
                title: "À Receber",    
                value: 589.40,
                shapeColor: Colors.yellow,
              ),
              CardItem(
                title: "Bloquear",              
                value: 120.00,
                shapeColor: Colors.red,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Última atualização: 03/02/2019 às 15:50\n(Saldo Sujeito a alterações)",
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ),
              AnimatedBuilder(
                animation: animationController,
                builder: (BuildContext context, Widget child) {
                  return Container(
                    height: animationController.value * (size.height * 0.15),
                    color: Colors.transparent,
                  );
                },
              ),
            ],
          ),
          AnimatedBuilder(
            animation: animationController,
            builder: (BuildContext context, Widget child) {
              return animationController.value == 0.0
                  ? Container()
                  : GestureDetector(
                      onTap: _onNovidadeClicked,
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        color: Colors.black26,
                      ),
                    );
            },
          ),
          Positioned(
            left:   0, 
            right:  0,
            bottom: 0,
            child: AnimatedBuilder(
              animation: animationTranslation,
              child: CardModal(
                  onCardModalClicked: _onNovidadeClicked,
              ),
              builder: (BuildContext context, Widget child) {
                return Transform.translate(
                  offset: Offset(0.0, animationTranslation.value),
                  child: child,
                ); 
              },
            ),
          ),
        ],
      ),
    );
  }

  _onNovidadeClicked() {
    if (animationController.value > 0.0) {
      animationController.reverse();
    } else {
      animationController.forward();
    }
  }  

}
