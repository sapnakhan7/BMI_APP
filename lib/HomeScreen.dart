import 'package:bmi_application/ResultScreen.dart';
import 'package:flutter/material.dart';
class BMIHomeScreen extends StatefulWidget {
  @override
  _BMIHomeScreenState createState() => _BMIHomeScreenState();
}

class _BMIHomeScreenState extends State<BMIHomeScreen> {
  int weight = 70;
  int age = 25;
  bool isMale = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[300],
      appBar: AppBar(
        title: Text('BMI Calculator',style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Weight (kg)', style: TextStyle(fontSize: 20, color: Colors.white)),
          Slider(
            value: weight.toDouble(),
            min: 30,
            max: 150,
            divisions: 120,
            label: weight.toString(),
            onChanged: (value) {
              setState(() {
                weight = value.toInt();
              });
            },
          ),
          Text(weight.toString(), style: TextStyle(fontSize: 40, color: Colors.white)),
          SizedBox(height: 20),
          Text('Age', style: TextStyle(fontSize: 20, color: Colors.white)),
          Slider(
            value: age.toDouble(),
            min: 10,
            max: 100,
            divisions: 90,
            label: age.toString(),
            onChanged: (value) {
              setState(() {
                age = value.toInt();
              });
            },
          ),
          Text(age.toString(), style: TextStyle(fontSize: 40, color: Colors.white)),
          SizedBox(height: 20),
          Text('Choose Gender', style: TextStyle(fontSize: 20, color: Colors.white)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.male,size: 35 , color: isMale ? Colors.blue : Colors.deepPurple[900]),
                onPressed: () {
                  setState(() {
                    isMale = true;
                  });
                },
              ),
              IconButton(
                icon: Icon(Icons.female,size: 35 ,color: !isMale ? Colors.pink : Colors.deepPurple[900]),
                onPressed: () {
                  setState(() {
                    isMale = false;
                  });
                },
              ),
            ],
          ),
          SizedBox(height: 20),
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BMIResultScreen(weight: weight, age: age, isMale: isMale)),
              );
            },
            child: Icon(Icons.arrow_forward),
          ),
        ],
      ),
    );
  }
}