import 'package:flutter/material.dart';

class UICard extends StatelessWidget {
  // UICard({required this.colour, required this.cardChild});
  UICard({@required this.colour, this.cardChild, this.onPress});

  final Color colour;
  final Widget cardChild;
  final Function onPress;

  Widget myUICard() {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(12.5),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return myUICard();
  }
}
