import 'package:flutter/material.dart';
import 'package:first_app/gradient_container.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: GradientContainer(colors: [
          Color.fromARGB(255, 168, 216, 224),
          Color.fromARGB(255, 213, 180, 165),
        ]),
      ),
    ),
  );
}
