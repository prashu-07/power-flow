import 'package:flutter/material.dart';
import 'package:power_flow/about_screen.dart';
import 'package:power_flow/complex_number.dart';
import 'package:power_flow/three_bus_initial_screen.dart';
import 'package:power_flow/two_bus_initial_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> data = [];

  Complex solve(Complex v2) {
    Complex v1 = Complex(real: 1, imaginary: 0);
    double p = -0.5;
    double q = 0;
    Complex y22 = Complex(real: 0, imaginary: -2);
    Complex y21 = Complex(real: 0, imaginary: 2);
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/logo-color.png'),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize:
                        Size(MediaQuery.of(context).size.width * 0.9, 70)),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TwoBusInitialScreen()));
                },
                child: Text(
                  '2 Bus System',
                  style: TextStyle(fontSize: 20),
                )),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize:
                        Size(MediaQuery.of(context).size.width * 0.9, 70)),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ThreeBusInitialScreen()));
                },
                child: Text(
                  '3 Bus System',
                  style: TextStyle(fontSize: 20),
                )),
            Spacer(),
            Text(
              'Created By',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Group 17',
              style: TextStyle(fontSize: 25),
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AboutScreen()));
                },
                child: Text('About')),
            SizedBox(
              height: 15,
            )
          ],
        ),
      ),
    );
  }
}





// Complex v = Complex(real: 1, imaginary: 0);
//                 for (int i = 0; i < 5; i++) {
//                   Complex ans = solve(v);
//                   // data.add(
//                   //     ans.real.toString() + "   j" + ans.imaginary.toString());
//                   data.add(ans.modulus().toString());
//                   v = ans;
//                 }
//                 setState(() {});