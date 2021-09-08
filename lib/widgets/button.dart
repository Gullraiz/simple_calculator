import 'package:flutter/material.dart';
import 'package:simple_calculator/models/my_colors.dart';
import 'package:simple_calculator/widgets/custom_theme.dart';

class Button extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;
  final VoidCallback onButtonPress;

  Button({
    this.buttonText = "<",
    this.buttonColor = Colors.black,
    required this.onButtonPress,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 65,
          width: 65,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: CustomTheme()
                  .dynamicColor(context, MyColors.myBlue, MyColors.myBlack)
                  .withOpacity(0.14),
              spreadRadius: 1,
              blurRadius: 6,
              offset: Offset(7, 7),
            ),
          ], borderRadius: BorderRadius.circular(20)),
        ),
        Container(
          height: 65,
          width: 65,
          decoration: BoxDecoration(
              // color: Theme.of(context).scaffoldBackgroundColor,
              boxShadow: [
                BoxShadow(
                  color: CustomTheme().dynamicColor(context, MyColors.myWhite,
                      MyColors.myWhite.withOpacity(0.08)),
                  spreadRadius: 1,
                  blurRadius: 10,
                  offset: Offset(-7, -7),
                ),
              ], borderRadius: BorderRadius.circular(20)),
          child: Material(
            child: InkWell(
              onTap: onButtonPress,
              highlightColor: CustomTheme()
                  .dynamicColor(context, MyColors.myBlue, MyColors.myGrey),
              child: Center(
                  child: Text(
                buttonText,
                style: TextStyle(fontSize: 22, color: buttonColor),
              )),
            ),
          ),
        ),
      ],
    );
  }
}
