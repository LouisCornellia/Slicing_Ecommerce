import 'package:flutter/material.dart';
import 'package:slicing_application/page/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Homepage());
  }
}
