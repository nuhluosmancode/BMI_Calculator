import 'package:flutter/material.dart';
import 'package:flutter_application_6/screen/input_page.dart';


void main() {
  return runApp(
    MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xFF0A0E21),
        scaffoldBackgroundColor: const Color(0XFF0A0E21)
      ),
        home: Scaffold(
    
      appBar: AppBar(
    
        title: const Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      
      body: const MyApp(),
    )),
  );
}

