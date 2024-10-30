import 'package:flutter/material.dart';
class BMIResultScreen extends StatelessWidget {
  final int weight;
  final int age;
  final bool isMale;

  BMIResultScreen({required this.weight, required this.age, required this.isMale});

  double calculateBMI() {
    double height = 1.75;
    return weight / (height * height);
  }

  String getInterpretation(double bmi) {
    if (bmi < 18.5) {
      return 'Underweight';
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return 'Normal weight';
    } else if (bmi >= 25 && bmi < 29.9) {
      return 'Overweight';
    } else {
      return 'Obesity';
    }
  }

  @override
  Widget build(BuildContext context) {
    double bmi = calculateBMI();
    String resultText = getInterpretation(bmi);

    return Scaffold(
      backgroundColor: Colors.deepPurple[300],
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
            child: Icon(Icons.arrow_back,color: Colors.white,)),
        title: Text('BMI Result',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your BMI is',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            Text(
              bmi.toStringAsFixed(1),
              style: TextStyle(fontSize: 50, color: Colors.white),
            ),
            SizedBox(height: 20),
            Text(
              resultText,
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
