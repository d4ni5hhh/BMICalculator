import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  double heightSliderValue = 100;
  double weightSliderValue = 60;
  double bmi = 0;
  String result = "";
  String status = "";

  bool isTextVisible = false;

  @override
  Widget build(BuildContext context) {
    // To Do Scaffold with App title "BMI Calculator"

    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator"),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Text(
            "BMI Calculator",
            style: TextStyle(
                color: Colors.red, fontSize: 32, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "We care about your health",
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 10,
          ),
          Visibility(
            visible: isTextVisible,
            child: Column(
              children: [
                Text(
                  "${result} ($status)",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text("Height ${heightSliderValue.round().toString()} cm"),
          Slider(
            value: heightSliderValue,
            max: 220,
            min: 50,
            label: heightSliderValue.round().toString(),
            onChanged: (double value) {
              setState(() {
                heightSliderValue = value;
              });
            },
          ),
          SizedBox(
            height: 10,
          ),
          Text("Weight: ${weightSliderValue.round().toString()} kg"),
          Slider(
            value: weightSliderValue,
            max: 150,
            min: 10,
            label: weightSliderValue.round().toString(),
            onChanged: (double value) {
              setState(() {
                weightSliderValue = value;
              });
            },
          ),
          SizedBox(
            height: 10,
          ),
          TextButton.icon(
              onPressed: () {
                setState(() {
                  bmi = weightSliderValue / ((heightSliderValue / 100) * 2);
                  result = "Your BMI is ${bmi.toStringAsFixed(2)}";
                  isTextVisible = true;
                  if (bmi < 18.5) {
                    status = "Underweight";
                  } else if (bmi >= 18.5 && bmi <= 24.9) {
                    status = "Normal";
                  } else if (bmi >= 25 && bmi <= 29.9) {
                    status = "Overweight";
                  } else if (bmi >= 30 && bmi <= 34.9) {
                    status = "Obese";
                  } else {
                    status = "Extreme Obese";
                  }
                });
              },
              icon: const Icon(Icons.favorite),
              label: const Text("Calculate BMI"),
              style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                      Color.fromARGB(103, 211, 209, 209)))),
          SizedBox(
            height: 50,
          ),
          Center(
            child: Image.asset(
              "assets/bmi-chart.jpg",
              width: deviceWidth * 0.9,
            ),
          ),
        ],
      ),
    );
  }
}