import 'package:flutter/cupertino.dart';
import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({@required this.height, @required this.weight});

  final int height;
  final int weight;
  double _bmi;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);

    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Sovrappeso';
    } else if (_bmi >= 18.5) {
      return 'Normale';
    } else {
      return 'Sotto peso';
    }
  }

  String motivation() {
    if (_bmi >= 25) {
      return 'Hai un peso maggiore rispetto al media , cerca di fare più esercizio 🔥';
    } else if (_bmi >= 18.5) {
      return 'Hai un peso normale. Bravo continua così!😉';
    } else {
      return 'Hai un peso minore rispetto alla media. Dovresti mangiare un po\' di più. 🍝';
    }
  }
}
