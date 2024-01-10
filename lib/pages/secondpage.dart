import 'package:bmi_homework/pages/firstpage.dart';
import 'package:flutter/material.dart';

class Secondpage extends StatelessWidget {

  final String name;
  final double bmi;

  const Secondpage({Key? key, required this.bmi, required  this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "BMI Result",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 108, 211, 68),
          ),
        ),
        elevation: 10,
        backgroundColor: Color.fromARGB(255, 10, 82, 4),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'ไงคุณ, $name!',
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(height: 16),
            Text(
              'ค่า BMI ของคุณคือ',
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(height: 16),
            Text(
              bmi.toStringAsFixed(2),
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 16),
            Text(
              getBMIStatus(bmi),
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 16),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context,
                      MaterialPageRoute(builder: (context) => Firstpage()));
                },
                child: Text('Back page')),
          ],
        ),
      ),
    );
  }

  String getBMIStatus(double bmi) {
    if (bmi < 18.5) {
      return 'น้ำหนักน้อยเกินไป';
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return 'น้ำหนักปกติ';
    } else if (bmi >= 25 && bmi < 29.9) {
      return 'น้ำหนักเกิน';
    } else {
      return 'โรคอ้วน';
    }
  }
}
