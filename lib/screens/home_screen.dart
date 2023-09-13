import 'package:calclator/components/buttons.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class homeScreen extends StatefulWidget {
  homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  var onqustion = '';
  var ans = '';
  var onanswer = '';

  final mytextstyle = TextStyle(color: Colors.deepPurple[900], fontSize: 30);

  final List<String> buttons = [
    'C',
    'Del',
    '%',
    '/',
    '9',
    '8',
    '7',
    'x',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '0',
    '.',
    'Ans',
    '='
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurple[100],
        body: Column(
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            Expanded(
                child: Container(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(20),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        onqustion,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.all(20),
                        alignment: Alignment.centerRight,
                        child: Text(onanswer, style: TextStyle(fontSize: 20)))
                  ]),
            )),
            Expanded(
              flex: 2,
              child: Container(
                child: Center(
                    child: GridView.builder(
                        itemCount: buttons.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4),
                        itemBuilder: (context, index) {
                          if (index == 0) {
                            return myButton(
                              ontapp: () {
                                setState(() {
                                  onqustion = '';
                                  onanswer = '';
                                });
                              },
                              color: Colors.green,
                              textcolor: Colors.white,
                              buttontext: buttons[index],
                            );
                          } else if (index == 1) {
                            if (onqustion.length > 0) {
                              return myButton(
                                ontapp: () {
                                  setState(() {
                                    onqustion = onqustion.substring(
                                        0, onqustion.length - 1);
                                  });
                                },
                                color: Colors.red,
                                textcolor: Colors.white,
                                buttontext: buttons[index],
                              );
                            } else {
                              return myButton(
                                ontapp: () {},
                                color: Colors.red,
                                textcolor: Colors.white,
                                buttontext: buttons[index],
                              );
                            }
                          } else if (index == buttons.length - 1) {
                            return myButton(
                              ontapp: () {
                                setState(() {
                                  equalpressed();
                                });
                              },
                              color: Colors.deepPurple,
                              textcolor: Colors.white,
                              buttontext: buttons[index],
                            );
                          }
                          return myButton(
                            ontapp: () {
                              setState(() {
                                onqustion += buttons[index];
                              });
                            },
                            color: isOperator(buttons[index])
                                ? Colors.deepPurple
                                : Colors.deepPurple[50],
                            textcolor: isOperator(buttons[index])
                                ? Colors.white
                                : Colors.deepPurple,
                            buttontext: buttons[index],
                          );
                        })),
              ),
            ),
          ],
        ));
  }

  bool isOperator(String x) {
    if (x == '/' || x == 'x' || x == '-' || x == '+' || x == '=' || x == '%') {
      return true;
    }
    return false;
  }

  void equalpressed() {
    String finalresult = onqustion;
    finalresult = finalresult.replaceAll('x', '*');
    Parser p = Parser();
    Expression exp = p.parse(finalresult);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    onanswer = eval.toString();
  }
}
