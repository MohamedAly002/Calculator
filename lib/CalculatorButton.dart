import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget{
  String text;
  Function pressbutton;
  CalculatorButton( this.text, this.pressbutton);
  @override
  Widget build(BuildContext context) {
    return Expanded(child:
    Container(
      margin: EdgeInsets.all(1),
      child: ElevatedButton(onPressed: (){
        pressbutton(text);
      },
        child: Text('$text',style: const TextStyle(fontSize:32))
        ,),
    )
    );
  }
}