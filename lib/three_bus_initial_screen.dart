import 'package:flutter/material.dart';
import 'package:power_flow/three_bus_comp_screen.dart';
import 'package:power_flow/two_bus_comp_screen.dart';

class ThreeBusInitialScreen extends StatefulWidget {
  const ThreeBusInitialScreen({super.key});

  @override
  State<ThreeBusInitialScreen> createState() => _ThreeBusInitialScreenState();
}

class _ThreeBusInitialScreenState extends State<ThreeBusInitialScreen> {
  TextEditingController z1_real_controller = TextEditingController();
  TextEditingController z1_imaginary_controller = TextEditingController();

  TextEditingController z2_real_controller = TextEditingController();
  TextEditingController z2_imaginary_controller = TextEditingController();

  TextEditingController z3_real_controller = TextEditingController();
  TextEditingController z3_imaginary_controller = TextEditingController();

  TextEditingController pg2_controller = TextEditingController();
  TextEditingController qg2_controller = TextEditingController();

  TextEditingController pd2_controller = TextEditingController();
  TextEditingController qd2_controller = TextEditingController();

  TextEditingController pg3_controller = TextEditingController();
  TextEditingController qg3_controller = TextEditingController();

  TextEditingController pd3_controller = TextEditingController();
  TextEditingController qd3_controller = TextEditingController();

  TextEditingController error_limit_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('assets/three_bus_without_compensation.jpg'),
              Divider(
                height: 3,
                color: Colors.black,
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    'Z12 = ',
                    style: TextStyle(fontSize: 20),
                  ),
                  Container(
                    width: 100,
                    decoration: BoxDecoration(),
                    child: TextField(
                      textAlignVertical: TextAlignVertical.bottom,
                      controller: z1_real_controller,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Text(
                    ' + j ',
                    style: TextStyle(fontSize: 20),
                  ),
                  Container(
                    width: 100,
                    decoration: BoxDecoration(),
                    child: TextField(
                      controller: z1_imaginary_controller,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    'Z23 = ',
                    style: TextStyle(fontSize: 20),
                  ),
                  Container(
                    width: 100,
                    decoration: BoxDecoration(),
                    child: TextField(
                      textAlignVertical: TextAlignVertical.bottom,
                      controller: z2_real_controller,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Text(
                    ' + j ',
                    style: TextStyle(fontSize: 20),
                  ),
                  Container(
                    width: 100,
                    decoration: BoxDecoration(),
                    child: TextField(
                      controller: z2_imaginary_controller,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    'Z31 = ',
                    style: TextStyle(fontSize: 20),
                  ),
                  Container(
                    width: 100,
                    decoration: BoxDecoration(),
                    child: TextField(
                      textAlignVertical: TextAlignVertical.bottom,
                      controller: z3_real_controller,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Text(
                    ' + j ',
                    style: TextStyle(fontSize: 20),
                  ),
                  Container(
                    width: 100,
                    decoration: BoxDecoration(),
                    child: TextField(
                      controller: z3_imaginary_controller,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    'S_G 2 = ',
                    style: TextStyle(fontSize: 20),
                  ),
                  Container(
                    width: 100,
                    decoration: BoxDecoration(),
                    child: TextField(
                      controller: pg2_controller,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Text(
                    ' + j ',
                    style: TextStyle(fontSize: 20),
                  ),
                  Container(
                    width: 100,
                    decoration: BoxDecoration(),
                    child: TextField(
                      controller: qg2_controller,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    'S_D 2 = ',
                    style: TextStyle(fontSize: 20),
                  ),
                  Container(
                    width: 100,
                    decoration: BoxDecoration(),
                    child: TextField(
                      controller: pd2_controller,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Text(
                    ' + j ',
                    style: TextStyle(fontSize: 20),
                  ),
                  Container(
                    width: 100,
                    decoration: BoxDecoration(),
                    child: TextField(
                      controller: qd2_controller,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    'S_G 3 = ',
                    style: TextStyle(fontSize: 20),
                  ),
                  Container(
                    width: 100,
                    decoration: BoxDecoration(),
                    child: TextField(
                      controller: pg3_controller,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Text(
                    ' + j ',
                    style: TextStyle(fontSize: 20),
                  ),
                  Container(
                    width: 100,
                    decoration: BoxDecoration(),
                    child: TextField(
                      controller: qg3_controller,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    'S_D 3 = ',
                    style: TextStyle(fontSize: 20),
                  ),
                  Container(
                    width: 100,
                    decoration: BoxDecoration(),
                    child: TextField(
                      controller: pd3_controller,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Text(
                    ' + j ',
                    style: TextStyle(fontSize: 20),
                  ),
                  Container(
                    width: 100,
                    decoration: BoxDecoration(),
                    child: TextField(
                      controller: qd3_controller,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    'Tolerance = ',
                    style: TextStyle(fontSize: 20),
                  ),
                  Container(
                    width: 100,
                    decoration: BoxDecoration(),
                    child: TextField(
                      controller: error_limit_controller,
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (z1_real_controller.text.trim() == "" ||
                        z1_imaginary_controller.text.trim() == "" ||
                        z2_real_controller.text.trim() == "" ||
                        z2_imaginary_controller.text.trim() == "" ||
                        z3_real_controller.text.trim() == "" ||
                        z3_imaginary_controller.text.trim() == "" ||
                        pd2_controller.text.trim() == "" ||
                        qd2_controller.text.trim() == "" ||
                        pg2_controller.text.trim() == "" ||
                        pd2_controller.text.trim() == "" ||
                        pd3_controller.text.trim() == "" ||
                        qd3_controller.text.trim() == "" ||
                        pg3_controller.text.trim() == "" ||
                        pd3_controller.text.trim() == "" ||
                        error_limit_controller.text.trim() == "") {
                      var snackBar =
                          SnackBar(content: Text('Enter all values'));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      return;
                    }

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ThreeBusCompScreen(
                                answer2: '0',
                                answer3: '0',
                                z1_real: double.parse(z1_real_controller.text),
                                z1_imaginary:
                                    double.parse(z1_imaginary_controller.text),
                                z2_real: double.parse(z2_real_controller.text),
                                z2_imaginary:
                                    double.parse(z2_imaginary_controller.text),
                                z3_real: double.parse(z3_real_controller.text),
                                z3_imaginary:
                                    double.parse(z3_imaginary_controller.text),
                                pd2: double.parse(pd2_controller.text),
                                qd2: double.parse(qd2_controller.text),
                                pg2: double.parse(pg2_controller.text),
                                qg2: double.parse(qg2_controller.text),
                                pd3: double.parse(pd3_controller.text),
                                qd3: double.parse(qd3_controller.text),
                                pg3: double.parse(pg3_controller.text),
                                qg3: double.parse(qg3_controller.text),
                                error_limit: double.parse(
                                    error_limit_controller.text))));
                  },
                  child: Text('Compute')),
            ],
          ),
        ),
      ),
    );
  }
}
