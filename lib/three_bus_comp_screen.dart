import 'dart:math';

import 'package:flutter/material.dart';
import 'package:power_flow/complex_number.dart';
import 'package:power_flow/three_bus_compensation_screen.dart';
import 'package:power_flow/three_bus_initial_screen.dart';
import 'package:power_flow/two_bus_compensation_screen.dart';
import 'package:power_flow/two_bus_initial_screen.dart';

class ThreeBusCompScreen extends StatefulWidget {
  const ThreeBusCompScreen({
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
    this.compensationAdded = false,
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
  final compensationAdded;
  final String answer2, answer3;
  @override
  State<ThreeBusCompScreen> createState() => _ThreeBusCompScreenState();
}

class _ThreeBusCompScreenState extends State<ThreeBusCompScreen> {
  List<String> data_v2 = [], data_v3 = [], data = [];
  String dropdownvalue = 'Bus 2 Voltage';
  var dropdownList = ['Bus 2 Voltage', 'Bus 3 Voltage'];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Complex v2 = Complex(real: 1, imaginary: 0); //initial v2
    Complex v3 = Complex(real: 1, imaginary: 0); //initial v3
    double e = 100;
    int count = 0;
    while ((e > widget.error_limit) && (count < 100)) {
      count++;
      List<Complex> ans = solve(v2, v3);
      data_v2.add(ans[0].modulus().toString() +
          " ∠" +
          ans[0].angleInDegrees().toString());
      data_v3.add(ans[1].modulus().toString() +
          " ∠" +
          ans[1].angleInDegrees().toString());
      Complex diff1 = ans[0].subtract(v2);
      Complex diff2 = ans[1].subtract(v3);
      e = max(diff1.modulus(), diff2.modulus());
      v2 = ans[0];
      v3 = ans[1];
    }
    setState(() {
      data = data_v2;
    });
  }

  List<Complex> solve(Complex v2, Complex v3) {
    Complex v1 = Complex(real: 1, imaginary: 0);
    double p = widget.pg2 - widget.pd2;
    double q = widget.qg2 - widget.qd2;

    Complex y1 = Complex(real: 1, imaginary: 0)
        .divide(Complex(real: widget.z1_real, imaginary: widget.z1_imaginary));
    Complex y2 = Complex(real: 1, imaginary: 0)
        .divide(Complex(real: widget.z2_real, imaginary: widget.z2_imaginary));
    Complex y3 = Complex(real: 1, imaginary: 0)
        .divide(Complex(real: widget.z3_real, imaginary: widget.z3_imaginary));

    //generate y bus matrix
    Complex negativeOne = Complex(real: -1, imaginary: 0);

    Complex y21 = y1.multiply(negativeOne);
    Complex y22 = y1.add(y2);
    Complex y23 = y2.multiply(negativeOne);

    Complex y31 = y3.multiply(negativeOne);
    Complex y32 = y2.multiply(negativeOne);
    Complex y33 = y2.add(y3);

    v2 = v2.conjugate();
    Complex t = Complex(real: p, imaginary: -q);
    t = t.divide(v2);
    t = t.subtract(y21.multiply(v1));
    t = t.subtract(y23.multiply(v3));
    Complex ans1 = t.divide(y22);

    p = widget.pg3 - widget.pd3;
    q = widget.qg3 - widget.qd3;
    v3 = v3.conjugate();
    t = Complex(real: p, imaginary: -q);
    t = t.divide(v3);
    t = t.subtract(y31.multiply(v1));
    t = t.subtract(y32.multiply(v2));
    Complex ans2 = t.divide(y33);

    List<Complex> ans = [ans1, ans2];

    return ans;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Text(
            'Results',
            style: TextStyle(fontSize: 25),
          ),
          DropdownButton(
            // Initial Value
            value: dropdownvalue,

            // Down Arrow Icon
            icon: const Icon(Icons.keyboard_arrow_down),

            // Array list of items
            items: dropdownList.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
            // After selecting the desired option,it will
            // change button value to selected value
            onChanged: (newValue) {
              if (newValue == 'Bus 3 Voltage') {
                data = data_v3;
              } else {
                data = data_v2;
              }
              setState(() {
                dropdownvalue = newValue!;
              });
            },
          ),
          (widget.compensationAdded)
              ? Container(
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  padding: EdgeInsets.all(32),
                  decoration: BoxDecoration(border: Border.all()),
                  child: Column(
                    children: [
                      Text(
                        'Before Compensation:',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      (dropdownvalue == 'Bus 3 Voltage')
                          ? Text(
                              widget.answer3,
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            )
                          : Text(
                              widget.answer2,
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                      Text(
                        'After Compensation',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        data.last,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      //Text('The Compensation added is ')
                    ],
                  ),
                )
              : (data_v2.length == 100 || data_v3.length == 100)
                  ? Container(
                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(border: Border.all()),
                      child: Text(
                        'The values did not converge after 100 iterations',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ))
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(border: Border.all()),
                          child: Text(
                            data.last,
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(left: 8, bottom: 8),
                            child: Text('Number of iterations: ' +
                                data.length.toString()))
                      ],
                    ),
          Expanded(
            child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        title: Text(
                          'Iteration: ' + (index + 1).toString(),
                          style: index == data.length - 1
                              ? TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17)
                              : TextStyle(),
                        ),
                        subtitle: Text(
                          data[index],
                          style: index == data.length - 1
                              ? TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17)
                              : TextStyle(),
                        ),
                      ),
                      Divider(),
                    ],
                  );
                }),
          ),
          widget.compensationAdded
              ? SizedBox.shrink()
              : ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ThreeBusInitialScreen()));
                  },
                  child: Text('Try for another set of data')),
          widget.compensationAdded
              ? ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Edit compensation'),
                )
              : ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ThreeBusCompensationScreen(
                                answer2: data_v2.last,
                                answer3: data_v3.last,
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
                                qg3: widget.qg3,
                                error_limit: widget.error_limit)));
                  },
                  child: Text('Add Compensation')),
        ],
      )),
    );
  }
}
