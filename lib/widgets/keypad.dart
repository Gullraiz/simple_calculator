import 'package:flutter/material.dart';
import 'package:simple_calculator/models/my_colors.dart';
import '../widgets/button.dart';
import 'custom_theme.dart';

class KeyPad extends StatelessWidget {
  final Function(String) onButtonPressed;
  final VoidCallback clearAll;
  final Function(bool) calculateAnswer;
  final VoidCallback onBackButtonPressed;

  KeyPad({
    required this.onButtonPressed,
    required this.clearAll,
    required this.calculateAnswer,
    required this.onBackButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Button(
              buttonText: "C",
              onButtonPress: clearAll,
              buttonColor: Theme.of(context).primaryColor,
            ),
            Button(
              buttonText: "Sqr",
              onButtonPress: () => calculateAnswer(true),
              buttonColor: Theme.of(context).primaryColor,
            ),
            Button(
              buttonText: "%",
              onButtonPress: () => onButtonPressed("%"),
              buttonColor: Theme.of(context).primaryColor,
            ),
            Button(
              buttonText: "/",
              onButtonPress: () => onButtonPressed("/"),
              buttonColor: Theme.of(context).primaryColor,
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Button(
              buttonText: "7",
              onButtonPress: () => onButtonPressed("7"),
              buttonColor: CustomTheme()
                  .dynamicColor(context, MyColors.myBlack, MyColors.myWhite),
            ),
            Button(
              buttonText: "8",
              onButtonPress: () => onButtonPressed("8"),
              buttonColor: CustomTheme()
                  .dynamicColor(context, MyColors.myBlack, MyColors.myWhite),
            ),
            Button(
              buttonText: "9",
              onButtonPress: () => onButtonPressed("9"),
              buttonColor: CustomTheme()
                  .dynamicColor(context, MyColors.myBlack, MyColors.myWhite),
            ),
            Button(
              buttonText: "X",
              onButtonPress: () => onButtonPressed("*"),
              buttonColor: Theme.of(context).primaryColor,
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Button(
              buttonText: "4",
              onButtonPress: () => onButtonPressed("4"),
              buttonColor: CustomTheme()
                  .dynamicColor(context, MyColors.myBlack, MyColors.myWhite),
            ),
            Button(
              buttonText: "5",
              onButtonPress: () => onButtonPressed("5"),
              buttonColor: CustomTheme()
                  .dynamicColor(context, MyColors.myBlack, MyColors.myWhite),
            ),
            Button(
              buttonText: "6",
              onButtonPress: () => onButtonPressed("6"),
              buttonColor: CustomTheme()
                  .dynamicColor(context, MyColors.myBlack, MyColors.myWhite),
            ),
            Button(
              buttonText: "-",
              onButtonPress: () => onButtonPressed("-"),
              buttonColor: Theme.of(context).primaryColor,
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Button(
              buttonText: "1",
              onButtonPress: () => onButtonPressed("1"),
              buttonColor: CustomTheme()
                  .dynamicColor(context, MyColors.myBlack, MyColors.myWhite),
            ),
            Button(
              buttonText: "2",
              onButtonPress: () => onButtonPressed("2"),
              buttonColor: CustomTheme()
                  .dynamicColor(context, MyColors.myBlack, MyColors.myWhite),
            ),
            Button(
              buttonText: "3",
              onButtonPress: () => onButtonPressed("3"),
              buttonColor: CustomTheme()
                  .dynamicColor(context, MyColors.myBlack, MyColors.myWhite),
            ),
            Button(
              buttonText: "+",
              onButtonPress: () => onButtonPressed("+"),
              buttonColor: Theme.of(context).primaryColor,
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Button(
              buttonText: "0",
              onButtonPress: () => onButtonPressed("0"),
              buttonColor: CustomTheme()
                  .dynamicColor(context, MyColors.myBlack, MyColors.myWhite),
            ),
            Button(
              buttonText: ".",
              onButtonPress: () => onButtonPressed("."),
              buttonColor: CustomTheme()
                  .dynamicColor(context, MyColors.myBlack, MyColors.myWhite),
            ),
            Button(
              onButtonPress: () => onBackButtonPressed(),
              buttonColor: Theme.of(context).primaryColor,
            ),
            Button(
              buttonText: "=",
              onButtonPress: () => calculateAnswer(false),
              buttonColor: Theme.of(context).primaryColor,
            ),
          ],
        ),
      ],
    );
  }
}
