import 'package:calculator_app/bottons.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var UserQustion = " ";
  var UserAnser = " ";
  final Mytextstyle = TextStyle(fontSize: 30, color: Colors.deepPurple[900]);
  final List<String> botton = [
    "C",
    "DEL",
    "%",
    "/",
    "9",
    "8",
    "7",
    "x",
    "6",
    "5",
    "4",
    "-",
    "3",
    "2",
    "1",
    "+",
    "0",
    ".",
    "ANS",
    "=",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: Column(
        children: <Widget>[
          Expanded(
              child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(
                  height: 50,
                ),
                Container(
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      UserQustion,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    )),
                Container(
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.centerRight,
                    child: Text(UserAnser,
                        style: TextStyle(
                          fontSize: 20,
                        ))),
              ],
            ),
          )),
          Expanded(
              flex: 2,
              child: Container(
                  child: GridView.builder(
                      itemCount: botton.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4),
                      itemBuilder: (BuildContext cotext, int index) {
                        if (index == 0) {
                          return MyBotton(
                            buttontabbed: () {
                              setState(() {
                                UserQustion = " ";
                              });
                            },
                            buttontext: botton[index],
                            Color: Colors.green,
                            textcolor: Colors.white,
                          );
                        } else if (index == 1) {
                          return MyBotton(
                            buttontabbed: () {
                              setState(() {
                                UserQustion = UserQustion.substring(
                                    0, UserQustion.length - 1);
                              });
                            },
                            buttontext: botton[index],
                            Color: Colors.red,
                            textcolor: Colors.white,
                          );
                        } else if (index == botton.length - 1) {
                          return MyBotton(
                            buttontabbed: () {
                              setState(() {
                                egualprseed();
                              });
                            },
                            buttontext: botton[index],
                            Color: Colors.deepPurple,
                            textcolor: Colors.white,
                          );
                        } else {
                          return MyBotton(
                            buttontabbed: () {
                              setState(() {
                                UserQustion += botton[index];
                              });
                            },
                            buttontext: botton[index],
                            Color: IsOperator(botton[index])
                                ? Colors.deepPurple
                                : Colors.deepPurple[50],
                            textcolor: IsOperator(botton[index])
                                ? Colors.white
                                : Colors.deepPurple,
                          );
                        }
                      }))),
        ],
      ),
    );
  }

  bool IsOperator(String x) {
    if (x == "%" || x == "/" || x == "x" || x == "-" || x == "+" || x == "=") {
      return true;
    }
    ;
    return false;
  }

  void egualprseed() {
    String finalqustion = UserQustion;
    finalqustion = finalqustion.replaceAll("x", "*");
    Parser p = Parser();
    Expression exp = p.parse(finalqustion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    UserAnser == eval.toString();
  }
}
