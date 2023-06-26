import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizzer/data/data.dart';
import 'package:quizzer/answers.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen(this.replayQuiz, this.chosenAnswers, {super.key});

  final List<String> chosenAnswers;
  List<Map<String, Object>> getAnswers() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question-index': i,
        'question': questions[i].text,
        'answer': questions[i].answers[0],
        'user-answer': chosenAnswers[i],
      });
    }
    return summary;
  }

  final void Function() replayQuiz;
  @override
  Widget build(context) {
    final summaryData = getAnswers();
    final numQues = questions.length;
    final correctQues = summaryData.where((data) {
      return data['user-answer'] == data['answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(5),
              child: Text(
                'You answered $correctQues out of $numQues questions correctly!',
                style: GoogleFonts.nunito(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionSummary(getAnswers()),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              onPressed: replayQuiz,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              icon: const Icon(Icons.replay),
              label: Text(
                'Restart Quiz',
                style: GoogleFonts.nunito(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
