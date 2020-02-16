class BMICalculator{

  final double weight;
  final double height;
  var _bmi;

  BMICalculator(this.weight, this.height);

  double calculateBMI(){
     _bmi = (weight / ((height/100) * (height/100) ));
     return _bmi;
  }

  String getBMICategory(){
    if(_bmi < 18.5)
      return "Underweight";
    if(_bmi < 25)
      return "Normal";
    else
      return "Overweight";
  }

}
