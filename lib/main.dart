// The following code was taken and adjusted from a ChatGPT conversation
import 'package:flutter/material.dart';
import 'package:ecopocket1/login.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EcoPocket Vouchers',
      theme: ThemeData(primarySwatch: Colors.green),
      home: LoginPage(),
    );
  }
}
