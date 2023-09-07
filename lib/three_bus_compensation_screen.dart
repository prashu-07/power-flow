import 'package:flutter/material.dart';
import 'package:power_flow/three_bus_comp_screen.dart';
import 'package:power_flow/two_bus_comp_screen.dart';

class ThreeBusCompensationScreen extends StatefulWidget {
  const ThreeBusCompensationScreen({
    super.key,
    required this.z1_real,
    required this.z1_imaginary,
    required this.z2_real,
    required this.z2_imaginary,
    required this.z3_real,
    required this.z3_imaginary,
    required this.pd2,
    required this.qd2,
    required this.pg2,
    required this.qg2,
    required this.pd3,
    required this.qd3,
    required this.pg3,
    required this.qg3,
    required this.error_limit,
    required this.answer2,
    required this.answer3,
  });
  final double z1_real,
      z1_imaginary,
      z2_real,
      z2_imaginary,
      z3_real,
      z3_imaginary,
      pd2,
      qd2,
      pg2,
      qg2,
      pd3,
      qd3,
      pg3,
      qg3,
      error_limit;
  final String answer2, answer3;

  @override
  State<ThreeBusCompensationScreen> createState() =>
      _ThreeBusCompensationScreenState();
}

class _ThreeBusCompensationScreenState
    extends State<ThreeBusCompensationScreen> {
  TextEditingController qcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
          ),
          Image.asset('assets/three_bus_with_compensation.jpg'),
          SizedBox(
            height: 35,
          ),
          Text(
            'Enter the value of reactive power (Q)',
            style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
          ),
          Container(
            decoration: BoxDecoration(border: Border.all()),
            margin: EdgeInsets.all(8),
            child: TextField(
              controller: qcontroller,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                double q = double.parse(qcontroller.text);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ThreeBusCompScreen(
                            answer2: widget.answer2,
                            answer3: widget.answer3,
                            compensationAdded: true,
                            z1_real: widget.z1_real,
                            z1_imaginary: widget.z1_imaginary,
                            z2_real: widget.z2_real,
                            z2_imaginary: widget.z2_imaginary,
                            z3_real: widget.z3_real,
                            z3_imaginary: widget.z3_imaginary,
                            pd2: widget.pd2,
                            qd2: widget.qd2,
                            pg2: widget.pg2,
                            qg2: widget.qg2,
                            pd3: widget.pd3,
                            qd3: widget.qd3,
                            pg3: widget.pg3,
                            qg3: widget.qg3 + q,
                            error_limit: widget.error_limit)));
              },
              child: Text('Add compensation')),
        ],
      )),
    );
  }
}
