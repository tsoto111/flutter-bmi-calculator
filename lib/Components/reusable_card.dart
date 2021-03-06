import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.colour, this.cardChild, this.cardTap});

  // Instance Variable, Property, or field...
  // (final) => Immutable - unchangeable
  // final vs. const - const is set at runtime while final is set at compile time.
  final Color colour;
  final Widget cardChild;
  final Function cardTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: cardTap,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(14.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
