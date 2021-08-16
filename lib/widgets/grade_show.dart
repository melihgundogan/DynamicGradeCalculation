import 'package:dynamic_grade_calculation/constants/app_constants.dart';
import 'package:flutter/material.dart';

class GradeShow extends StatelessWidget {
  final double average;
  final int numberOfLessons;
  const GradeShow(
      {required this.average, required this.numberOfLessons, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          numberOfLessons > 0
              ? "$numberOfLessons Ders Girildi"
              : "Ders Seçiniz",
          style: Sabitler.numberOfLessonsStyle,
        ),
        Text(
          average >= 0 ? "${average.toStringAsFixed(2)}" : "0.0",
          style: Sabitler.averageStyle,
        ),
        Text(
          "Ortalama",
          style: Sabitler.gradeShowStyle,
        ),
      ],
    );
  }
}
