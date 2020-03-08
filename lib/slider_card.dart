import 'package:flutter/material.dart';
import 'constants.dart';
import 'reusable_card.dart';

class SliderCard extends StatelessWidget {
  SliderCard({
    @required this.label,
    @required this.unitLabel,
    @required this.value,
    @required this.minValue,
    @required this.maxValue,
    @required this.sliderFunk,
  });

  final String label;
  final String unitLabel;
  final int value;
  final double maxValue;
  final double minValue;
  final Function sliderFunk;

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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: <Widget>[
              Text(
                value.toString(),
                style: kBoldTextStyle,
              ),
              Container(
                margin: EdgeInsets.only(left: 5.0),
                child: Text(
                  unitLabel,
                  style: kLabelTextStyle,
                ),
              ),
            ],
          ),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              thumbShape: RoundSliderThumbShape(
                enabledThumbRadius: 15.0,
              ),
              overlayShape: RoundSliderOverlayShape(
                overlayRadius: 30.0,
              ),
              overlayColor: Color(0x29EB1555),
              activeTrackColor: Colors.white,
              inactiveTrackColor: Color(0xFF8D8E98),
              thumbColor: kBottomContainerColor,
            ),
            child: Slider(
              value: value.toDouble(),
              max: maxValue,
              min: minValue,
              onChanged: sliderFunk,
            ),
          ),
        ],
      ),
    );
  }
}
