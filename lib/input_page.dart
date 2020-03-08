import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_content.dart';
import 'constants.dart';
import 'add_subtract_int.dart';
import 'slider_card.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender { male, female }

class _InputPageState extends State<InputPage> {
  Gender activeGender;
  int height = 180;
  int weight = 60;
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      colour: activeGender == Gender.male
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: IconContent(
                        label: 'MALE',
                        icon: FontAwesomeIcons.mars,
                      ),
                      cardTap: () {
                        setState(() {
                          activeGender = Gender.male;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: activeGender == Gender.female
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: IconContent(
                        label: 'FEMALE',
                        icon: FontAwesomeIcons.venus,
                      ),
                      cardTap: () {
                        setState(() {
                          activeGender = Gender.female;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SliderCard(
                label: 'HEIGHT',
                unitLabel: 'cm',
                value: height,
                maxValue: 220.0,
                minValue: 120.0,
                sliderFunk: (double updatedValue) {
                  setState(() {
                    height = updatedValue.toInt();
                  });
                },
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: AddSubtractInt(
                      label: 'WEIGHT',
                      intData: weight,
                      onTapAdd: () {
                        setState(() {
                          weight++;
                        });
                      },
                      onTapSubtract: () {
                        setState(() {
                          weight--;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: AddSubtractInt(
                      label: 'AGE',
                      intData: age,
                      onTapAdd: () {
                        setState(() {
                          age++;
                        });
                      },
                      onTapSubtract: () {
                        setState(() {
                          age--;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: kBottomContainerColor,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: kBottomContainerHeight,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/result');
                },
                child: Text('CALCULATE'),
              ),
            ),
          ],
        ));
  }
}
