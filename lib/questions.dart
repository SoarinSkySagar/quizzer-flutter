import 'package:flutter/material.dart';
// import 'package:quizzer/theme.dart';
import 'package:quizzer/option_style.dart';
import 'package:quizzer/data/data.dart';
import 'package:google_fonts/google_fonts.dart';

class Questions extends StatefulWidget {
  const Questions(this.chooseAnswer, {super.key});

  final void Function(String answer) chooseAnswer;

  @override
  State<Questions> createState() {
    return _QuestionsState();
  }
}

class _QuestionsState extends State<Questions> {
  var x = 0;

  void changeX(String answer) {
    widget.chooseAnswer(answer);
    setState(() {
      x++;
    });
  }

  @override
  Widget build(context) {
    var currentQ = questions[x];

    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            currentQ.text,
            style: GoogleFonts.nunito(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          ...currentQ.getShuffled().map((item) {
            return OptionStyle(item, () {
              changeX(item);
            });
          }),
        ],
      ),
    );
    //question page UI
  }
}
