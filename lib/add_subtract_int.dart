import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'round_icon.dart';

class AddSubtractInt extends StatelessWidget {
  AddSubtractInt({
    @required this.label,
    @required this.intData,
    @required this.onTapAdd,
    @required this.onTapSubtract,
  });

  final String label;
  final int intData;
  final Function onTapAdd;
  final Function onTapSubtract;

  @override
  Widget build(BuildContext context) {
    return ReusableCard(
      colour: kActiveCardColor,
      cardChild: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            label,
            style: kLabelTextStyle,
          ),
          Text(
            intData.toString(),
            style: kBoldTextStyle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RoundIconButton(
                icon: FontAwesomeIcons.minus,
                onTap: onTapSubtract,
              ),
              SizedBox(width: 10),
              RoundIconButton(
                icon: FontAwesomeIcons.plus,
                onTap: onTapAdd,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
