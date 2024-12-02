import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:secondapp/data/question.dart';
import 'package:secondapp/Quiz/question_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key, 
    required this.chosenAnwers,
    required this.onRestart,    
    });

  final List<String> chosenAnwers;
  final void Function() onRestart;

  List<Map<String, Object>> getSummaryData() {
    
    final List<Map<String, Object>> summary = [];


    for (var i = 0; i < chosenAnwers.length; i++) {
      summary.add(
        {
          'question-index': i,
          'question': questions[i].text,
          'correct-answer' : questions[i].answers[0],
          'user-answer': chosenAnwers[i]
        },
      );
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions =questions.length;
    final numCorrectQuestion = summaryData.where((item){
        return item['user-answer']==item['correct-answer'];
        }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectQuestion out $numTotalQuestions questions correctly',
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),              
              textAlign: TextAlign.center,
              ),
            const SizedBox(
              height: 30,
            ),
          QuestionsSummary(summaryData),
            SizedBox(
              height: 30,
            ),
            TextButton.icon(
              onPressed: onRestart,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              icon: const Icon(Icons.refresh),
              label: const Text('Restart Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
