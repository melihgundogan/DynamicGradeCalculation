import 'package:dynamic_grade_calculation/constants/app_constants.dart';
import 'package:dynamic_grade_calculation/widgets/grade_calculation_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Dinamik Ortalama Hesapla",
      theme: ThemeData(
        primarySwatch: Sabitler.primaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home: GradeCalculation(),
    );
  }
}
