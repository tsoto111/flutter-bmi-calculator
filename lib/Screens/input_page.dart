import 'package:bmi_calculator/calculator_brain.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Components/reusable_card.dart';
import '../Components/icon_content.dart';
import '../constants.dart';
import '../Components/add_subtract_int.dart';
import '../Components/slider_card.dart';
import 'package:bmi_calculator/Components/BottomButton.dart';

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
            BottomButton(
              buttonTitle: 'CALCULATE',
              onTap: () {
                CalculatorBrain calc =
                    CalculatorBrain(height: height, weight: weight);
                Navigator.pushNamed(context, '/result', arguments: {
                  'bmi': calc.calculateBMI(),
                  'result': calc.getResult(),
                  'interpretation': calc.getInterpretation(),
                });
              },
            ),
          ],
        ));
  }
}
