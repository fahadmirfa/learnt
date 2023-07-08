import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(' Home Screen'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.home,
                size: 100,
                color: Colors.blue,
              ),
              SizedBox(height: 20),
              Text(
                'Welcome to Your App!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Start exploring the app by tapping on the buttons below.',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),

            ],
          ),
        ),
      ),
    );
  }
}
