import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage(this.switchScreen, {super.key});

  final void Function() switchScreen;

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/quiz-logo.png',
          width: 300,
          color: const Color.fromARGB(224, 255, 255, 255),
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          'Take the quiz now!',
          style: GoogleFonts.nunito(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 30,
        ),
        ElevatedButton.icon(
          onPressed: switchScreen,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
          ),
          icon: const Icon(Icons.arrow_right),
          label: const Text(
            'Start Quiz',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }
}
