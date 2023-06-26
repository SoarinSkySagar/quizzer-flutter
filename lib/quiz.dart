import 'package:flutter/material.dart';
import 'package:quizzer/homepage.dart';
import 'package:quizzer/questions.dart';
import 'package:quizzer/theme.dart';
import 'package:quizzer/data/data.dart';
import 'package:quizzer/summary.dart';
// import 'package:quizzer/questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  final List<String> selectedAnswer = [];
  var activeScreen = 'home-page';

  // @override
  // void initState() {
  //   super.initState();
  //   activeScreen = 'HomePage(switchScreen)';
  // }

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);
    if (selectedAnswer.length == questions.length) {
      setState(() {
        activeScreen = 'summary-screen';
      });
    }
  }

  void replayQuiz() {
    selectedAnswer.clear();
    setState(() {
      activeScreen = 'home-page';
    });
  }

  @override
  Widget build(context) {
    Widget screenValue = HomePage(switchScreen);
    if (activeScreen == 'questions-screen') {
      screenValue = Questions(chooseAnswer);
    }
    if (activeScreen == 'summary-screen') {
      screenValue = SummaryScreen(replayQuiz, selectedAnswer);
    }

    return MaterialApp(
      home: Scaffold(
        body: ThemeContainer(screenValue),
      ),
    );
  }
}
