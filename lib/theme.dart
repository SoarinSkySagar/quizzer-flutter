import 'package:flutter/material.dart';

class ThemeContainer extends StatelessWidget {
  const ThemeContainer(this.widgetClass, {super.key});

  final Widget widgetClass;

  @override
  Widget build(context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(195, 0, 0, 0),
              Colors.black,
            ]),
      ),
      child: Center(
        child: widgetClass,
      ),
    );
  }
}
