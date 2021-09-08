import 'package:flutter/material.dart';
import 'package:function_tree/function_tree.dart';
import 'package:simple_calculator/widgets/custom_theme.dart';

import './widgets/keypad.dart';
import 'main.dart';
import 'models/my_colors.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> _typedQuestionList = [""];
  String _typedQuestionString = "0";
  String _answerString = "0";
  double _toggleButtonPosition = 0;
  String _toggleText = "LIGHT";

  bool isInteger(num value) {
    return value is int;
  }

  String listToString() {
    return _typedQuestionList.fold("", (prev, element) => "$prev$element");
  }

  void _onButtonPressed(String value) {
    _typedQuestionList.add(value);
    setState(() {
      _typedQuestionString = listToString();
    });
  }

  void _calculateAnswer(bool isSqrButtonPressed) {
    var calculatedAnswer = _typedQuestionString.interpret();
    var calculatedAnswerDecimalPart =
        int.parse(calculatedAnswer.toString().split(".")[1]);

    if (calculatedAnswerDecimalPart == 0) {
      print(calculatedAnswer);
      setState(() {
        if (isSqrButtonPressed) {
          _answerString =
              (calculatedAnswer * calculatedAnswer).toStringAsFixed(0);
        } else {
          _answerString = calculatedAnswer.toStringAsFixed(0);
        }
      });
    } else {
      print(calculatedAnswer);
      setState(() {
        _answerString = calculatedAnswer.toString();
      });
    }
  }

  void _onBackButtonPressed() {
    setState(() {
      _typedQuestionList.removeLast();
      _typedQuestionString = listToString();
    });
  }

  void _clearAll() {
    setState(() {
      _typedQuestionList = [];
      _typedQuestionString = "0";
      _answerString = "0";
    });
  }

  void _onThemeModeButtonPressed() {
    setState(() {
      if (_toggleButtonPosition == 0) {
        _toggleButtonPosition = 80;
        _toggleText = "LIGHT";
      } else {
        _toggleButtonPosition = 0;
        _toggleText = "DARK";
      }
    });
    MyAppState.themeNotifier.value =
        MyAppState.themeNotifier.value == ThemeMode.light
            ? ThemeMode.dark
            : ThemeMode.light;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(15),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: _onThemeModeButtonPressed,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 700),
                curve: Curves.fastOutSlowIn,
                height: 50,
                width: 110,
                // color: Colors.green,
                child: Stack(alignment: Alignment.center, children: <Widget>[
                  Container(
                    height: 50,
                    width: 110,
                    padding: EdgeInsets.symmetric(vertical: 8),
                    // color: Colors.red,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 0),
                    height: 27,
                    width: 95,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: CustomTheme().dynamicColor(
                          context, MyColors.myWhite, MyColors.myGrey),
                      boxShadow: [
                        BoxShadow(
                          color: CustomTheme().dynamicColor(
                              context,
                              MyColors.myWhite,
                              MyColors.myGrey.withOpacity(0.3)),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: Offset(-5, -5),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        _toggleText,
                        style: TextStyle(
                            color: CustomTheme().dynamicColor(
                                context, MyColors.myBlue, MyColors.myWhite),
                            fontSize: 10,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Container(
                    height: 27,
                    width: 95,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: LinearGradient(
                          colors: [
                            CustomTheme().dynamicColor(
                                context,
                                MyColors.myBlue.withOpacity(0.1),
                                MyColors.myBlack.withOpacity(0.3)),
                            Colors.transparent,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.center,
                          stops: [0.2, 1],
                          tileMode: TileMode.clamp),
                    ),
                  ),
                  Positioned(
                    bottom: 7,
                    left: _toggleButtonPosition,
                    child: Stack(
                      children: <Widget>[
                        AnimatedContainer(
                          duration: Duration(milliseconds: 400),
                          height: 33,
                          width: 33,
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                              color: CustomTheme().dynamicColor(
                                  context,
                                  MyColors.myWhite,
                                  MyColors.myGrey.withOpacity(0.5)),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: Offset(-3, -3),
                            ),
                          ], borderRadius: BorderRadius.circular(20)),
                        ),
                        Container(
                          height: 29,
                          width: 29,
                          decoration: BoxDecoration(
                              color: MyColors.myWhite,
                              boxShadow: [
                                BoxShadow(
                                  color: CustomTheme().dynamicColor(
                                      context,
                                      MyColors.myBlue.withOpacity(0.14),
                                      MyColors.myGrey.withOpacity(0.14)),
                                  spreadRadius: 1,
                                  blurRadius: 3,
                                  offset: Offset(3, 3),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(20)),
                          child: Icon(
                            Icons.dark_mode_outlined,
                            size: 20,
                            color: CustomTheme().dynamicColor(
                                context, MyColors.myBlue, MyColors.myGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              _answerString,
              style: TextStyle(fontSize: 40),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "=",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Text(
                  _typedQuestionString,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            KeyPad(
              onButtonPressed: _onButtonPressed,
              clearAll: _clearAll,
              calculateAnswer: _calculateAnswer,
              onBackButtonPressed: _onBackButtonPressed,
            ),
          ],
        ),
      ),
    );
  }
}
