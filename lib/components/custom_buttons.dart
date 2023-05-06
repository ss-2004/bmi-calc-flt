import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({@required this.buttonTitle, @required this.onTap});

  final Function onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: kAccentColour,
        margin: EdgeInsets.only(top: 12.5),
        height: 75.0,
        width: double.infinity,
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(bottom: 15),
            child: Text(
              buttonTitle,
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon, @required this.onPressed});

  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: Color(0xFF4C4F5E),
      shape: CircleBorder(),
      elevation: 6.0,
      child: Icon(icon),
      onPressed: onPressed,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
    );
  }
}
