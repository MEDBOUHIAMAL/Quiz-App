
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:quiz/widgets/components/question_card.dart';

import '../Controllers/quizController.dart';
import '../Used.dart';
import '../widgets/components/progressBar.dart';


class QuizPage extends StatelessWidget {

  static const routeName = '/quiz_screen';
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: backgroundColor,
      extendBodyBehindAppBar: true,

      body:Stack(
        children: [

          SafeArea(

              child: GetBuilder<QuestionController>(
                init: QuestionController(),
                builder: (controller)=>Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Padding(
                      padding: EdgeInsets.all(kDefaultPadding),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(text: TextSpan(
                              text: 'Question ',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .copyWith(color: Colors.cyanAccent),
                              children: [
                                TextSpan(
                                    text: controller.numberOfQuestion.round().toString(),
                                    style: Theme.of(context).textTheme.headline4!
                                        .copyWith(color: Colors.cyanAccent)
                                ),
                                TextSpan(
                                    text: '/',
                                    style: Theme.of(context).textTheme.headline5!
                                        .copyWith(color: Colors.cyanAccent)
                                ),
                                TextSpan(text: controller.countOfQuestion.toString(),
                                    style: Theme.of(context).textTheme.headline5!
                                        .copyWith(color: Colors.cyanAccent)
                                )

                              ]
                          )
                          ),
                          ProgressTimer(),
                        ],
                      ),
                    ),
                    SizedBox(height: 8.0,),
                    Padding(
                      padding: const EdgeInsets.all(kDefaultPadding),
                      child: Divider(thickness: 2, color: usedColor,),
                    ),
                    SizedBox(height: 40.0,),
                    Expanded( child:
                    PageView.builder(
                      scrollDirection: Axis.horizontal,
                      // block user from scrolling to next question
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context,index)=> QuestionCard(
                        questionModel: controller.questionsList[index],
                      ),
                      controller: controller.pageController,

                      itemCount: controller.questionsList.length,

                    ),

                    ),
                    SizedBox(height: 40.0,),
                  ],
                ),

              )
          )
        ],
      ),
    );
  }
}


