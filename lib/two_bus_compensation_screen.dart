import 'package:flutter/material.dart';
import 'package:power_flow/two_bus_comp_screen.dart';

class TwoBusCompensationScreen extends StatefulWidget {
  const TwoBusCompensationScreen(
      {super.key,
      required this.z_real,
      required this.z_imaginary,
      required this.s_real,
      required this.s_imaginary,
      required this.error_limit,
      required this.answer});
  final double z_real, z_imaginary, s_real, s_imaginary, error_limit;
  final String answer;

  @override
  State<TwoBusCompensationScreen> createState() =>
      _TwoBusCompensationScreenState();
}

class _TwoBusCompensationScreenState extends State<TwoBusCompensationScreen> {
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
          Image.asset('assets/two_bus_with_compensation.jpg'),
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
                        builder: (context) => TwoBusCompScreen(
                            compensationAdded: true,
                            answer: widget.answer,
                            z_real: widget.z_real,
                            z_imaginary: widget.z_imaginary,
                            s_real: widget.s_real,
                            s_imaginary: widget.s_imaginary - q,
                            error_limit: widget.error_limit)));
              },
              child: Text('Add compensation')),
        ],
      )),
    );
  }
}
