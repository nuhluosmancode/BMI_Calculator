import 'dart:math';

class CalculatorBrain{

    CalculatorBrain({this.height,this.weight});

    final height;
    final weight;

    double _bmi = 0.0;

    String calculateBMI(){

        _bmi = weight / pow(height/100, 2);
       return  _bmi.toStringAsFixed(1);
    }

String getResults(){

  if(_bmi >= 15){

    return('Overweight');
  }else if(_bmi > 18.5){

    return 'Normal';
  }else{
    return 'underweight';
  }

}

String getInterpretetion(){

 if(_bmi >= 15){

    return'You have a higher than a normal body weight. Try to exercise more.';
  }else if(_bmi > 18.5){

    return 'you have normal body weight. good Job!';
  }else{
    return 'You have lower than normal body weight.You can eat a bit more';
  }

}

}

