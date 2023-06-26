import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SummaryItems extends StatelessWidget {
  const SummaryItems(this.data, this.colour, {super.key});
  final Map<String, Object> data;
  final List<Color> colour;

  @override
  Widget build(context) {
    String str1 = data['user-answer'].toString();
    String str2 = data['answer'].toString();

    int i = str1 == str2 ? 0 : 1;

    final Color boxColour = colour[i];

    return Row(
      children: [
        ClipOval(
          child: Container(
            color: boxColour,
            height: 35,
            width: 35,
            child: Center(
              child: Text(
                ((data['question-index'] as int) + 1).toString(),
                style: GoogleFonts.nunito(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data['question'].toString(),
                  style: GoogleFonts.nunito(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  data['user-answer'].toString(),
                  style: GoogleFonts.nunito(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.left,
                ),
                Text(
                  data['answer'].toString(),
                  style: GoogleFonts.nunito(
                    color: Colors.green[300],
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(
                  height: 12,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
