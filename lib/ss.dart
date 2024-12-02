import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SS extends StatelessWidget {
  const SS(this.startQuiz,{super.key});
final void Function() startQuiz;
  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(100, 232, 232, 232),
          ),
          const SizedBox(height: 80),
           Text(
            'Learn Flutter',
           style:  GoogleFonts.lato(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            label: const Text(
              'Start quiz'
            ),
            icon: const Icon(
              Icons.arrow_right_alt
            ),
          ),
        ],
      ),
    );
  }
}
