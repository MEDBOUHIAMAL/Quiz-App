import 'dart:async';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/model/Questions.dart';
import 'package:quiz/view/quizpage.dart';
import 'package:quiz/view/scorepage.dart';
import 'package:quiz/view/welcomepage.dart';

import '../Used.dart';

//We use get package for our state management

class QuestionController extends GetxController{
  String name = '';
  //question variables
  int get countOfQuestion => _questionsList.length;
  final List<Question> _questionsList = [
    Question(
      id: 1,
      question:
      "Who developed the Flutter Framework and continues to maintain it today? ",
      answer: 2,
      options: ['Facebook', 'Microsoft', 'Google', 'Oracle'],
    ),
    Question(
      id: 2,
      question: "Which programming language is used to build Flutter applications? ",
      answer: 1,
      options: ['Kotlin', 'Dart', 'Java', 'Go'],
    ),
    Question(
      id: 3,
      question: "When building for iOS, Flutter is restricted to an __ compilation strategy",
      answer: 0,
      options: ['AOT (ahead-of-time)', 'JIT (Just-in-time)', 'Transcompilation', 'Recompilation'],
    ),
    Question(
      id: 4,
      question: "How many types of widgets are there in Flutter?",
      answer: 0,
      options: ['2', '4', '6', '8+'],
    ),
    Question(
      id: 5,
      question:
      "A sequence of asynchronous Flutter events is known as a:",
      answer: 2,
      options: ['Flow', 'Current', 'Stream', 'Series'],
    ),
    Question(
      id: 6,
      question: "Access to a cloud database through Flutter is available through which service?",
      answer: 1,
      options: ['SQLite', 'Firebase Database', 'NOSQL', 'MYSQL'],
    ),
    Question(
      id: 7,
      question: "What element is used as an identifier for components when programming in Flutter?",
      answer: 1,
      options: [' Widgets', 'Keys', 'Elements', 'Serial'],
    ),
    Question(
      id: 8,
      question: "What type of test can examine your code as a complete system?",
      answer: 2,
      options: ['Unit tests', ' Widget tests', 'Integration Tests', 'All of the above'],
    ),
    Question(
      id: 9,
      question:
      "What type of Flutter animation allows you to represent real-world behavior? ",
      answer: 0,
      options: [' Physics-based', 'Maths-based', 'Graph-based', 'Sim-based '],
    ),
    Question(
      id: 10,
      question: "What command would you use to compile your Flutter app in release mode? ",
      answer: 1,
      options: ['Flutter --release', 'Flutter build --release', 'Flutter run --release', 'None of them'],
    ),
  ];

  List<Question> get questionsList => [..._questionsList];


  bool _isPressed = false;


  bool get isPressed => _isPressed; //To check if the answer is pressed


  double _numberOfQuestion = 1;


  double get numberOfQuestion => _numberOfQuestion;


  int? _selectAnswer;


  int? get selectAnswer => _selectAnswer;


  int? _correctAnswer;


  int _countOfCorrectAnswers = 0;


  int get countOfCorrectAnswers => _countOfCorrectAnswers;

  //map for check if the question has been answered
  final Map<int, bool> _questionIsAnswerd = {};


  //page view controller
  late PageController pageController;

  //timer
  Timer? _timer;


  final maxSec = 15;


  final RxInt _sec = 15.obs;


  RxInt get sec => _sec;

  @override
  void onInit() {
    pageController = PageController(initialPage: 0);
    resetAnswer();
    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  //get final score
  double get scoreResult {
    return _countOfCorrectAnswers * 100 / _questionsList.length;
  }

  void checkAnswer(Question questionModel, int selectAnswer) {
    _isPressed = true;

    _selectAnswer = selectAnswer;
    _correctAnswer = questionModel.answer;

    if (_correctAnswer == _selectAnswer) {
      _countOfCorrectAnswers++;
    }
    stopTimer();
    _questionIsAnswerd.update(questionModel.id, (value) => true);
    Future.delayed(const Duration(milliseconds: 500)).then((value) => nextQuestion());
    update();
  }

  //check if the question has been answered
  bool checkIsQuestionAnswered(int quesId) {
    return _questionIsAnswerd.entries
        .firstWhere((element) => element.key == quesId)
        .value;
  }

  void nextQuestion() {
    if (_timer != null || _timer!.isActive) {
      stopTimer();
    }

    if (pageController.page == _questionsList.length - 1) {
      Get.offAndToNamed(ResultScreen.routeName);
    } else {
      _isPressed = false;
      pageController.nextPage(
          duration: const Duration(milliseconds: 500), curve: Curves.linear);

      startTimer();
    }
    _numberOfQuestion = pageController.page! + 2;
    update();
  }

  //called when start again quiz
  void resetAnswer() {
    for (var element in _questionsList) {
      _questionIsAnswerd.addAll({element.id: false});
    }
    update();
  }

  //get right and wrong color
  Color getColor(int answerIndex) {
    if (_isPressed) {
      if (answerIndex == _correctAnswer) {
        return Colors.green.shade700;
      } else if (answerIndex == _selectAnswer &&
          _correctAnswer != _selectAnswer) {
        return Colors.red.shade700;
      }
    }
    return Colors.white;
  }

  String resultText(int score){
    if(score>=50) return 'Congratulation';
    else return 'Oops';
    return 'hhh';

  }
  String resultanimation(int score){
    if(score>=50) return 'assets/party.json';
    else return 'assets/sad.json';
    return 'hhh';

  }
  String resultbutton(int score){
    if(score>=50) return 'Play again';
    else return 'Try again';
    return 'hhh';

  }

  //het right and wrong icon
  IconData getIcon(int answerIndex) {
    if (_isPressed) {
      if (answerIndex == _correctAnswer) {
        return Icons.done;
      } else if (answerIndex == _selectAnswer &&
          _correctAnswer != _selectAnswer) {
        return Icons.close;
      }
    }
    return Icons.close;
  }

  void startTimer() {
    resetTimer();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_sec.value > 0) {
        _sec.value--;
      } else {
        stopTimer();
        nextQuestion();
      }
    });
  }

  void resetTimer() => _sec.value = maxSec;

  void stopTimer() => _timer!.cancel();
  //call when start again quiz
  void PlaytAgain() {
    _correctAnswer = null;
    _countOfCorrectAnswers = 0;
    resetAnswer();
    _selectAnswer = null;
    Get.offAllNamed(WelcomeScreen.routeName);
  }
  void TryAgain() {
    _correctAnswer = null;
    _countOfCorrectAnswers = 0;
    resetAnswer();
    _selectAnswer = null;
    Get.offAllNamed(QuizPage.routeName);
  }
}
