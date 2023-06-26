import 'package:flutter/material.dart';
import 'package:quizzer/summary_items.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.dataSummary, {super.key});

  final List<Map<String, Object>> dataSummary;

  @override
  Widget build(context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: dataSummary.map((data) {
            return SummaryItems(data, const [Colors.green, Colors.red]);
          }).toList(),
        ),
      ),
    );
  }
}
