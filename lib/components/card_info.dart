import 'package:flutter/material.dart';
import '../constants.dart';

class CardInfo extends StatelessWidget {
  IconData cardIcon;
  String cardText;

  double iconSize = 80.0;
  double textSize = 15.0;

  // CardInfo({required this.cardIcon, required this.cardText});
  CardInfo({@required this.cardIcon, this.cardText});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          cardIcon,
          size: iconSize,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          cardText,
          style: kLabelStyle,
        ),
      ],
    );
  }
}
