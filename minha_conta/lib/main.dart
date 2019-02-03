import 'package:flutter/material.dart';
import 'package:minha_conta/home/home-page.dart';

void main() => runApp(MinhaContaApp());

class MinhaContaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Challenge - Minha Conta',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}