import 'dart:math';

class BMI {
        final int height;
        final int weight;
        double _bmi;

        BMI({this.height, this.weight});

        String calculateBMI() {
                _bmi = weight / pow(height / 100, 2);
                return _bmi.toStringAsFixed(2);
        }

        String getResult() {
                if (_bmi >= 25) {
                        return 'Overweight';
                } else if (_bmi > 18.5) {
                        return 'Normal';
                } else {
                        return 'Underweight';
                }
        }



}