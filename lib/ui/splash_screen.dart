import 'dart:async';
import 'package:flutter/material.dart';
import 'package:learnt/ui/auth/screen.dart';
import 'package:lottie/lottie.dart';


class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 6),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => WelcomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/images/9704-ecommerce.json', height: 250),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text('Ecommerce',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 29,
                      fontWeight: FontWeight.bold)),
              Text(
                'Shop',
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 29,
                    fontWeight: FontWeight.bold),
              )
            ])
          ],
        ),
      ),
    );
  }
}
