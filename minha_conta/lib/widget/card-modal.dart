import 'package:flutter/material.dart';
import 'package:minha_conta/widget/card-modal-page-item.dart';
import 'package:minha_conta/widget/card-modal-dot.dart';

class CardModal extends StatefulWidget {

  final Function onCardModalClicked;

  const CardModal({Key key, this.onCardModalClicked}) : super(key: key);

  _CardModalState createState() => _CardModalState();
}

class _CardModalState extends State<CardModal> {
  
  PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10, top: 5),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              GestureDetector(
                onTap: widget.onCardModalClicked,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    width: double.infinity,
                    color: Colors.transparent,
                    child: Text("NOVIDADES PRA VOCÊ"),
                  ),
                ),
              ),
              Container(width: double.infinity, height: 3, color: Colors.green),
              Container(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    SizedBox(height: 10),
                    Text(
                      "Você já conhece o aplicativo Minha Conta?",
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.15,
                      child: PageView(
                        controller: pageController,
                        children: <Widget>[
                          CardModalPageItem(
                            icon: Icons.phonelink_ring,
                            text: "Nele, você consulta o saldo e faz transferências para o seu cartão pré-pago",
                          ),
                          CardModalPageItem(
                            icon: Icons.credit_card,
                            text: "Além disso, acompanhe suas vendas e transfira o saldo para sua conta bancária",
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CardModalDot(
                          pageController: pageController,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ListTile(
                title: RaisedButton(
                  color: Colors.green,
                  textColor: Colors.white,
                  child: Text(
                    "Faça o Download na Play Store",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  onPressed: () {
                    print("App Download Clicked");
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}