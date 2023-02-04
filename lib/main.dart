import 'package:calculator/CalculatorScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    title: 'Calculator',
routes: {
      CalculatorScreen.routeName:(_)=>CalculatorScreen()
},
    initialRoute: CalculatorScreen.routeName,
  ));
}