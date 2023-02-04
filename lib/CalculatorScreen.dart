//square root function is not run right
import 'dart:math';
import 'package:calculator/CalculatorButton.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  static const String routeName='calculator';

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String result="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const  Text('Calculator'),
      ),
      body: Column(
        children: [
        Expanded(
          child: Container(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
              Text('$result',style: TextStyle(fontSize: 36),)
            ],),
          ),
        ),
        Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [

                CalculatorButton('<<',Erasebutton),
                CalculatorButton('C',clearButton),
                CalculatorButton( 'sqr',OnOperationClick),
                CalculatorButton('pow',OnOperationClick),

              ],),
          ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

            CalculatorButton( '1',Onclickbutton),
            CalculatorButton('2',Onclickbutton),
            CalculatorButton( '3',Onclickbutton),
            CalculatorButton('/',OnOperationClick),

          ],),
        ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [

                CalculatorButton( '4',Onclickbutton),
                CalculatorButton('5',Onclickbutton),
                CalculatorButton('6',Onclickbutton),
                CalculatorButton('*',OnOperationClick),

              ],),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [

                CalculatorButton( '7',Onclickbutton),
                CalculatorButton( '8',Onclickbutton),
                CalculatorButton('9',Onclickbutton),
                CalculatorButton('-',OnOperationClick),

              ],),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [

                CalculatorButton( '.',Onclickbutton),
                CalculatorButton( '0',Onclickbutton),
                CalculatorButton( '=',EqualButton),
                CalculatorButton( '+',OnOperationClick),

              ],),
          ),

      ],),

    );
  }
  String savedoperator='';
  String savedresult='';
  String lastdigits='';

  String Caluclate(String lhs,String op,String rhs){
    double n1=double.parse(lhs);
    double n2=double.parse(rhs);
    double res=0;
    if(op=='/'){
      res=n1/n2;
    }else if(op=='*'){
      res=n1*n2;
    }
    else if(op=='-'){
      res=n1-n2;
    }
    else if(op=='+'){
      res=n1+n2;
    }
    else if(op=='sqr'){
      res=sqrt(n1);
    }
    else if(op=='pow'){
      res=pow(n1,n2).toDouble();
    }
    return res.toString();

  }
  void OnOperationClick (String operatortext ){
    if(savedoperator.isEmpty){
      savedresult=result;

    }
    else{
      lastdigits=result;
      savedresult=Caluclate(savedresult,savedoperator,lastdigits);
    }
    savedoperator=operatortext;
    result='';
    setState(() {

    });


  }
  void Onclickbutton(String digitetext){
    result+=digitetext ;
    setState(() {

    });
  }
  void EqualButton(String eq){
    lastdigits=result;
    savedresult=Caluclate(savedresult, savedoperator, lastdigits);
    result=savedresult;
    savedoperator='';
    savedresult='';
    setState(() {

    });
  }
  void clearButton(String cl){
    lastdigits='';
    savedoperator='';
    savedoperator='';
    result='';
    setState(() {});
  }
  void Erasebutton(String bk){
    String str=result;
    int len;
    len=str.length;
    result= str.substring(0, len - 1);
    setState(() {});
  }


}
