import 'package:flutter/material.dart';
import 'package:power_flow/complex_number.dart';
import 'package:power_flow/two_bus_compensation_screen.dart';
import 'package:power_flow/two_bus_initial_screen.dart';

class TwoBusCompScreen extends StatefulWidget {
  const TwoBusCompScreen(
      {super.key,
      required this.z_real,
      required this.z_imaginary,
      required this.s_real,
      required this.s_imaginary,
      required this.error_limit,
      this.compensationAdded = false,
      required this.answer});
  final double z_real, z_imaginary, s_real, s_imaginary, error_limit;
  final bool compensationAdded;
  final String answer;

  @override
  State<TwoBusCompScreen> createState() => _TwoBusCompScreenState();
}

class _TwoBusCompScreenState extends State<TwoBusCompScreen> {
  List<String> data = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Complex v = Complex(real: 1, imaginary: 0); //initial v2
    double e = 100;
    int count = 0;
    while ((e > widget.error_limit) && (count < 100)) {
      count++;
      Complex ans = solve(v);
      data.add(
          ans.modulus().toString() + " ∠" + ans.angleInDegrees().toString());

      Complex diff = ans.subtract(v);
      e = diff.modulus();
      v = ans;
    }
    setState(() {});
  }

  Complex solve(Complex v2) {
    Complex v1 = Complex(real: 1, imaginary: 0);
    double p = -widget.s_real;
    double q = -widget.s_imaginary;

    Complex y = Complex(real: 1, imaginary: 0)
        .divide(Complex(real: widget.z_real, imaginary: widget.z_imaginary));
    // Complex y22 = Complex(real: 0, imaginary: -2);
    // Complex y21 = Complex(real: 0, imaginary: 2);
    Complex y22 = y;
    Complex y21 = y.multiply(Complex(real: -1, imaginary: 0));
    v2 = v2.conjugate();
    Complex t = Complex(real: p, imaginary: -q);
    t = t.divide(v2);
    t = t.subtract(y21.multiply(v1));
    Complex ans = t.divide(y22);
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
          widget.compensationAdded
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
                      Text(
                        widget.answer,
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
              : (data.length == 100 || data.length == 100)
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
                            builder: (context) => TwoBusInitialScreen()));
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
                            builder: (context) => TwoBusCompensationScreen(
                                answer: data.last,
                                z_real: widget.z_real,
                                z_imaginary: widget.z_imaginary,
                                s_real: widget.s_real,
                                s_imaginary: widget.s_imaginary,
                                error_limit: widget.error_limit)));
                  },
                  child: Text('Add Compensation')),
        ],
      )),
    );
  }
}
