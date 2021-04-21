import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/element.dart';
import 'package:bmi_calculator/input_page.dart';
import 'package:flutter/material.dart';

class FinalScreen extends StatelessWidget {
  FinalScreen(
      {@required this.bmiResult,
      @required this.resultText,
      @required this.interpretation});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI Calculator'),
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                child: Text(
                  'Il tuo risultato',
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
                flex: 5,
                child: ReusableCard(
                  colour: inactiveCard,
                  cardChild: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        resultText,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                            fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        bmiResult,
                        style: TextStyle(
                            fontSize: 90, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        interpretation,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                )),
            Expanded(
                child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => InputPage()));
              },
              child: Container(
                child: Center(
                    child: Text(
                  'CALCOLO',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                )),
                width: double.infinity,
                height: bottomContainerHeight,
                color: Color(0xFFEB1555),
                margin: EdgeInsets.only(top: 10.0),
              ),
            ))
          ],
        ));
  }
}
