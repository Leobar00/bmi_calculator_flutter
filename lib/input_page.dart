import 'package:bmi_calculator/brain.dart';
import 'package:bmi_calculator/final.dart';
import 'package:flutter/material.dart';
import 'element.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int value = 180;
  int width = 60;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'BMI CALCULATOR',
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedGender = Gender.male;
                          });
                        },
                        child: ReusableCard(
                          colour: selectedGender == Gender.male
                              ? activeCard
                              : inactiveCard,
                          cardChild: ContentCard(
                            icon: FontAwesomeIcons.mars,
                            textIcon: 'Maschio',
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedGender = Gender.female;
                            });
                          },
                          child: ReusableCard(
                            colour: selectedGender == Gender.female
                                ? activeCard
                                : inactiveCard,
                            cardChild: ContentCard(
                              icon: FontAwesomeIcons.venus,
                              textIcon: 'Femmina',
                            ),
                          ),
                        ))
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: ReusableCard(
                        colour: activeCard,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('ALTEZZA', style: styleText),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text(
                                  value.toString(),
                                  style: numberStyle,
                                ),
                                Text(
                                  'cm',
                                  style: styleText,
                                ),
                              ],
                            ),
                            SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                  thumbShape: RoundSliderThumbShape(
                                      enabledThumbRadius: 15.0),
                                  overlayShape: RoundSliderOverlayShape(
                                      overlayRadius: 30.0),
                                  overlayColor: Color(0x15EB1555),
                                  thumbColor: Color(0xFFEB1555),
                                  activeTrackColor: Colors.white),
                              child: Slider(
                                value: value.toDouble(),
                                min: 100,
                                max: 220,
                                inactiveColor: Color(0xFF8D8E98),
                                onChanged: (double newValue) {
                                  setState(() {
                                    value = newValue.round();
                                  });
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: ReusableCard(
                          colour: activeCard,
                          cardChild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'PESO',
                                style: styleText,
                              ),
                              Text(
                                width.toString(),
                                style: numberStyle,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RoundedButton(
                                    icona: FontAwesomeIcons.minus,
                                    onPressed: () {
                                      setState(() {
                                        width--;
                                      });
                                    },
                                  ),
                                  SizedBox(width: 10),
                                  RoundedButton(
                                    icona: FontAwesomeIcons.plus,
                                    onPressed: () {
                                      setState(() {
                                        width++;
                                      });
                                    },
                                  )
                                ],
                              )
                            ],
                          )),
                    ),
                    Expanded(
                        flex: 1,
                        child: ReusableCard(
                          colour: activeCard,
                          cardChild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'ETA\'',
                                style: styleText,
                              ),
                              Text(
                                age.toString(),
                                style: numberStyle,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RoundedButton(
                                    icona: FontAwesomeIcons.minus,
                                    onPressed: () {
                                      setState(() {
                                        age--;
                                      });
                                    },
                                  ),
                                  SizedBox(width: 10),
                                  RoundedButton(
                                    icona: FontAwesomeIcons.plus,
                                    onPressed: () {
                                      setState(() {
                                        age++;
                                      });
                                    },
                                  )
                                ],
                              )
                            ],
                          ),
                        ))
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  CalculatorBrain calc =
                      CalculatorBrain(height: value, weight: width);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FinalScreen(
                              bmiResult: calc.calculateBMI(),
                              resultText: calc.getResult(),
                              interpretation: calc.motivation())));
                },
                child: Container(
                  child: Center(
                      child: Text(
                    'CALCOLA',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  )),
                  width: double.infinity,
                  height: bottomContainerHeight,
                  color: Color(0xFFEB1555),
                  margin: EdgeInsets.only(top: 10.0),
                ),
              )
            ],
          ),
        ));
  }
}

class RoundedButton extends StatelessWidget {
  RoundedButton({this.icona, this.onPressed});

  final IconData icona;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        child: Icon(icona),
        onPressed: onPressed,
        elevation: 6.0,
        constraints: BoxConstraints.tightFor(
          height: 56.0,
          width: 56.0,
        ),
        fillColor: Color(0xFF4C4F5E),
        shape: CircleBorder());
  }
}
