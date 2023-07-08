import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz/Controllers/quizController.dart';


import '../../Used.dart';
import '../widgets/components/ButtonStart.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key}) : super(key: key);
  static const routeName = '/result_screen';


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: backgroundColor,
        body: Stack(
      children: [

        Center(
          child: GetBuilder<QuestionController>(
            init: Get.find<QuestionController>(),

            builder: (controller) => Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Lottie.asset(controller.resultanimation(controller.scoreResult.round()),
                    height: 250,
                    alignment: Alignment.center

                ),

                Text(

                  controller.resultText(controller.scoreResult.round()),
                  style: Theme.of(context).textTheme.headline3!.copyWith(
                        color: Colors.cyanAccent,
                      ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  controller.name,
                  style: Theme.of(context).textTheme.headline3!.copyWith(
                        color: Colors.cyanAccent,
                      ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'Your Score is',
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: Colors.white,
                      ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  '${controller.scoreResult.round()} /100',
                  style: Theme.of(context).textTheme.headline3!.copyWith(
                        color: usedColor,
                      ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: CustomButton(

                      onPressed: () => controller.TryAgain(),
                      text: controller.resultbutton(controller.scoreResult.round())),
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
