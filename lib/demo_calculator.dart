import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
class CalcukatorAppHome extends StatefulWidget {
  const CalcukatorAppHome({super.key});

  @override
  State<CalcukatorAppHome> createState() => _CalcukatorAppHomeState();
}

class _CalcukatorAppHomeState extends State<CalcukatorAppHome> {

  String equation = '0';
  String result = '0';
  String expression = '';

  //function for button working

  buttonPressed(btnText){
    setState(() {
      if (btnText == 'Ac'){
        equation = '0';
        result ='0';

      } else if(btnText == '⌫'){
        equation = equation.substring(0,equation.length -1);

        if(equation==''){
          equation ='0';
        }

      } else if(btnText == '='){
        expression = equation;
        expression = expression.replaceAll('x', '*');
        expression = expression.replaceAll('÷', '/');

        
        try{
          Parser p = Parser();
          Expression exp = p.parse(expression);
          ContextModel cm = ContextModel();
          result='${exp.evaluate(EvaluationType.REAL, cm)}';
        }
            catch(e){
          'Error';
            }

      }else{
        if(equation =='0'){
          equation = btnText;
        } else
        equation = equation + btnText;
      }
    });
  }

  Widget calButtons(String btnText, Color txtColor, double btnWidth, Color btnColor){
    return  InkWell(
      onTap: (){
        //call our function
        buttonPressed(btnText);
      },
      child: Container(
        alignment: Alignment.center,
        height: 60,
        width: btnWidth,
        decoration: BoxDecoration(
          color: btnColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Text(btnText, style: TextStyle(color: txtColor,fontSize:30,fontWeight: FontWeight.w500),),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
       appBar: AppBar(
         shape: const BeveledRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.elliptical(200,100)
          )
         ),
         centerTitle: true,
         backgroundColor: Colors.deepOrangeAccent[100],
         title: const Text('Calculator',style: TextStyle(color: Colors.white,fontSize: 30 ,fontWeight: FontWeight.normal  ),),
       ),
      body: Column(
        children: [
          const SizedBox(height: 20,),
          //display equation value
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.centerRight,
            height: 70,
            width: double.infinity,
            color: Colors.black,
            child:SingleChildScrollView(child: Text(equation, style: TextStyle(color: Colors.deepOrangeAccent[100], fontSize: 38),))
          ),
          const SizedBox(height: 20,),
          //display result
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.centerRight,
              height: 70,
              width: double.infinity,
              color: Colors.black,
              child:SingleChildScrollView(child: Text(result, style: TextStyle(color: Colors.white, fontSize: 50),))
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                   calButtons('Ac', Colors.white, 55, Colors.deepOrangeAccent[100]!),
                    calButtons('⌫', Colors.white, 55, Colors.white38),
                    calButtons('%', Colors.white, 55, Colors.white38),
                    calButtons('÷', Colors.white, 55, Colors.deepOrangeAccent[100]!),
                  ],
                ),
                const SizedBox(height: 25,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    calButtons('7', Colors.white, 55, Colors.white10),
                    calButtons('8', Colors.white, 55, Colors.white10),
                    calButtons('9', Colors.white, 55, Colors.white10),
                    calButtons('x', Colors.white, 55, Colors.deepOrangeAccent[100]!),
                  ],
                ),
                const SizedBox(height: 25,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    calButtons('4', Colors.white, 55, Colors.white10),
                    calButtons('5', Colors.white, 55, Colors.white10),
                    calButtons('6', Colors.white, 55, Colors.white10),
                    calButtons('-', Colors.white, 55, Colors.deepOrangeAccent[100]!),
                  ],
                ),
                const SizedBox(height: 25,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    calButtons('1', Colors.white, 55, Colors.white10),
                    calButtons('2', Colors.white, 55, Colors.white10),
                    calButtons('3', Colors.white, 55, Colors.white10),
                    calButtons('+', Colors.white, 55, Colors.deepOrangeAccent[100]!),
                  ],
                ),
                const SizedBox(height: 25,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    calButtons('0', Colors.white, 120, Colors.white10),
                    calButtons('.', Colors.white, 55, Colors.white10),
                    calButtons('=', Colors.white, 55, Colors.deepOrangeAccent[100]!),
                  ],
                ),
                const SizedBox(height: 25,)
              ],
            ),
          )
        ],
      ),
    );
  }
}
