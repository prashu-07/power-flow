import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Text(
              'About',
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
            ),
            Text(
              'Ashwin Jino V',
              style: TextStyle(fontSize: 25),
            ),
            Text(
              'Bellamkonda Jai Abhiram',
              style: TextStyle(fontSize: 25),
            ),
            Text(
              'Vankudoth Prashanth',
              style: TextStyle(fontSize: 25),
            ),
          ],
        ),
      )),
    );
  }
}
