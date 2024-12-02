import 'package:flutter/material.dart';
import 'package:secondapp/ss.dart';
import 'package:secondapp/Quiz/questions_Screen.dart';
import 'package:secondapp/data/question.dart';
import 'package:secondapp/Quiz/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {

  List<String> selectedAnswers = [];

  var activeScreen = 'start-screen' ; 

  void switchScreen() {
    setState(() {
        activeScreen = 'question-screen';
      },);
  }
 void chooseAnswer(String answer){
      selectedAnswers.add(answer);

      if(selectedAnswers.length == questions.length){
        setState(() {
          activeScreen = 'result-screen';
        });
      }
 }

void restartQuiz(){
  setState((){
    selectedAnswers = [];
    activeScreen = 'start-screen';
  });
}

  @override
  Widget build(context) {
    Widget widgetScreen = SS(switchScreen);

    if(activeScreen=='question-screen'){
      widgetScreen =  Questionscreen(
        onSelectAnswer: chooseAnswer
        );
    }

    if(activeScreen=='result-screen'){
      widgetScreen =  ResultsScreen(
         chosenAnwers: selectedAnswers,
         onRestart: restartQuiz,         
        );
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 45, 43, 205),
                Color.fromARGB(255, 39, 5, 141),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: widgetScreen,
        ),
      ),
    );
  }
}
