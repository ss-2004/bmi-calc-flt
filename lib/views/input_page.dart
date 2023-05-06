import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/calculator.dart';
import 'package:bmi_calculator/components/calculator.dart';
import 'package:flutter/material.dart';
import 'result_page.dart';
import '../components/custom_buttons.dart';
import '../components/card_info.dart';
import '../components/ui_card.dart';
import '../constants.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderCard selectedGender;
  double height = 160.0;
  int weight = 60;
  int age = 25;

  Widget genderCard() {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            child: UICard(
              onPress: () {
                setState(() {
                  selectedGender = GenderCard.male;
                });
              },
              colour: selectedGender == GenderCard.male
                  ? kPressedUICardColour
                  : kUICardColour,
              cardChild: CardInfo(
                cardIcon: FontAwesomeIcons.mars,
                cardText: "MALE",
              ),
            ),
          ),
          Expanded(
            child: UICard(
              onPress: () {
                setState(() {
                  selectedGender = GenderCard.female;
                });
              },
              colour: selectedGender == GenderCard.female
                  ? kPressedUICardColour
                  : kUICardColour,
              cardChild: CardInfo(
                cardIcon: FontAwesomeIcons.venus,
                cardText: "FEMALE",
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget heightCard() {
    return Expanded(
      child: UICard(
        colour: kUICardColour,
        cardChild: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "HEIGHT",
              style: kLabelStyle,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  height.toStringAsFixed(1),
                  style: kNumberStyle,
                ),
                Text(
                  "cm",
                  style: kLabelStyle,
                ),
              ],
            ),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: Colors.white,
                inactiveTrackColor: Color(0xFF8D8E98),
                thumbColor: Color(0xFFEB1555),
                overlayColor: Color(0x29EB1555),
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                overlayShape: RoundSliderOverlayShape(overlayRadius: 25.0),
              ),
              child: Slider(
                value: height,
                min: 80.0,
                max: 240.0,
                onChanged: (double newValue) {
                  setState(() {
                    height = newValue;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget weightCard() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "WEIGHT",
          style: kLabelStyle,
        ),
        Text(
          weight.toString(),
          style: kNumberStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundIconButton(
              icon: FontAwesomeIcons.minus,
              onPressed: () {
                setState(() {
                  weight > 0 ? weight-- : weight = 0;
                });
              },
            ),
            SizedBox(
              width: 28.0,
            ),
            RoundIconButton(
              icon: FontAwesomeIcons.plus,
              onPressed: () {
                setState(() {
                  weight++;
                });
              },
            ),
          ],
        )
      ],
    );
  }

  Widget ageCard() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "AGE",
          style: kLabelStyle,
        ),
        Text(
          age.toString(),
          style: kNumberStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundIconButton(
              icon: FontAwesomeIcons.minus,
              onPressed: () {
                setState(() {
                  age > 0 ? age-- : age = 0;
                });
              },
            ),
            SizedBox(
              width: 28.0,
            ),
            RoundIconButton(
              icon: FontAwesomeIcons.plus,
              onPressed: () {
                setState(() {
                  age++;
                });
              },
            ),
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          genderCard(),
          heightCard(),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: UICard(
                    colour: kUICardColour,
                    cardChild: weightCard(),
                  ),
                ),
                Expanded(
                  child: UICard(
                    colour: kUICardColour,
                    cardChild: ageCard(),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonTitle: "CALCULATE BMI",
            onTap: () {
              Calculator calc = Calculator(weight: weight, height: height);

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return ResultPage(
                    bmi: calc.getBMI(),
                    rslt: calc.getResult(),
                    adv: calc.getFeedback(),
                  );
                }),
              );
            },
          ),
        ],
      ),
    );
  }
}
