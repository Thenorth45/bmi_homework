import 'package:bmi_homework/pages/secondpage.dart';
import 'package:flutter/material.dart';

class Firstpage extends StatefulWidget {
  const Firstpage({super.key});

  @override
  State<Firstpage> createState() => _FirstpageState();
}

class _FirstpageState extends State<Firstpage> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  double calculateBMI(double height, double weight) {
    return weight / ((height / 100) * (height / 100));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "BMI Calculator",
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
            children: [
              SizedBox(height: 16),
              Text('ข้อมูลที่ต้องกรอก', style: TextStyle(fontSize: 30)),
              TextFormField(
                controller: namecontroller,
                autofocus: true,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  labelText: 'Name(ชื่อ)',
                  alignLabelWithHint: true,
                  contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: heightController,
                autofocus: true,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  labelText: 'Height(cm)',
                  alignLabelWithHint: true,
                  contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: weightController,
                autofocus: true,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  labelText: 'Weight(kg)',
                  alignLabelWithHint: true,
                  contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                  onPressed: () {
                    double height =
                        double.tryParse(heightController.text) ?? 0.0;
                    double weight =
                        double.tryParse(weightController.text) ?? 0.0;

                    if (height > 0 && weight > 0) {
                      double bmi = calculateBMI(height, weight);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              Secondpage(name: namecontroller.text, bmi: bmi),
                        ),
                      );
                    } else {
                      // Show error message for invalid input
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Error'),
                            content:
                                Text('Please enter valid height and weight.'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  child: Text('Calcilate BMI')),
              SizedBox(height: 16),
            ],
          ),
        ));
  }
}
