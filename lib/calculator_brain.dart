import 'dart:math';

class BMICalculator {
  double height;
  int weight;
  double _bmi;

  BMICalculator({this.height, this.weight});

  String getResult() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String bmiDetail() {
    if (_bmi > 30) {
      return ('Obese');
    } else if (_bmi >= 25 && _bmi <= 30) {
      return ('Overweight');
    } else if (_bmi > 18.5 && _bmi < 25) {
      return ('Normal');
    } else if (_bmi > 17 && _bmi <= 18.5) {
      return ('Mild Thinness');
    } else if (_bmi >= 16 && _bmi <= 17) {
      return ('Moderate Thinness');
    } else {
      return ('Severe Thinness');
    }
  }
}
