//  file_names

import 'package:flutter/material.dart';
import 'package:secondapp/data/question.dart';
import 'package:secondapp/Quiz/answer_button.dart';
import 'package:google_fonts/google_fonts.dart';

class Questionscreen extends StatefulWidget {
    const Questionscreen({
    super.key, 
    required this.onSelectAnswer,
   });

  final void Function(String answer) onSelectAnswer;


  @override
  State<Questionscreen> createState() {
    return _QuestionscreenState();
  }

}

class _QuestionscreenState extends State<Questionscreen> {

  var curques = 0;

  void answerQuestion(String selectedAnswer){
     widget.onSelectAnswer(selectedAnswer);
     setState(() { 
      curques++;
     });
  }
  
  
  @override
  Widget build(context) {
    final currentQuestion = questions[curques];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
               color: const Color.fromARGB(119, 255, 255, 255),
               fontSize: 24,
               fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(
                answerText: answer,
                onTap: (){
                  answerQuestion(answer);
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
