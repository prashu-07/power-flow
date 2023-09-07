import 'package:flutter/material.dart';
import 'package:power_flow/two_bus_comp_screen.dart';

class TwoBusInitialScreen extends StatefulWidget {
  const TwoBusInitialScreen({super.key});

  @override
  State<TwoBusInitialScreen> createState() => _TwoBusInitialScreenState();
}

class _TwoBusInitialScreenState extends State<TwoBusInitialScreen> {
  TextEditingController z_real_controller = TextEditingController();
  TextEditingController z_imaginary_controller = TextEditingController();

  TextEditingController s_real_controller = TextEditingController();
  TextEditingController s_imaginary_controller = TextEditingController();

  TextEditingController error_limit_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('assets/two_bus_without_compensation.jpg'),
            Divider(
              height: 2,
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
                  'Z = ',
                  style: TextStyle(fontSize: 20),
                ),
                Container(
                  width: 100,
                  decoration: BoxDecoration(),
                  child: TextField(
                    textAlignVertical: TextAlignVertical.bottom,
                    controller: z_real_controller,
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
                    controller: z_imaginary_controller,
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
                  'S = ',
                  style: TextStyle(fontSize: 20),
                ),
                Container(
                  width: 100,
                  decoration: BoxDecoration(),
                  child: TextField(
                    controller: s_real_controller,
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
                    controller: s_imaginary_controller,
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
                  if (z_real_controller.text.trim() == "" ||
                      z_imaginary_controller.text.trim() == "" ||
                      s_real_controller.text.trim() == "" ||
                      s_imaginary_controller.text.trim() == "" ||
                      error_limit_controller.text.trim() == "") {
                    var snackBar = SnackBar(content: Text('Enter all values'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    return;
                  }

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TwoBusCompScreen(
                                answer: '0',
                                z_real: double.parse(
                                    z_real_controller.text.toString()),
                                z_imaginary:
                                    double.parse(z_imaginary_controller.text),
                                s_real: double.parse(s_real_controller.text),
                                s_imaginary:
                                    double.parse(s_imaginary_controller.text),
                                error_limit:
                                    double.parse(error_limit_controller.text),
                              )));
                },
                child: Text('Compute')),
          ],
        ),
      )),
    );
  }
}
