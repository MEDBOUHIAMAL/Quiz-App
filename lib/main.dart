
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/utils/binding.dart';
import 'package:quiz/view/scorepage.dart';
import 'package:quiz/view/welcomepage.dart';
import 'package:quiz/view/quizpage.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Quiz App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      initialBinding: BilndingsApp(),
      home:  WelcomeScreen(),
      getPages: [
        GetPage(name:  WelcomeScreen.routeName , page:()=> WelcomeScreen()),
        GetPage(name:  ResultScreen.routeName , page:()=> ResultScreen()),
        GetPage(name:  QuizPage.routeName , page:()=> QuizPage()),
      ],
    );
  }
}


