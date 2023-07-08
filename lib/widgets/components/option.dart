import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/Controllers/quizController.dart';
import 'package:quiz/Used.dart';

class Option extends StatelessWidget {


  const Option({
    Key? key,
    required this.text,
    required this.index,
    required this.questionId,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  final int index;
  final int questionId;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionController>(
      init: Get.find<QuestionController>(),
      builder: (controller) => InkWell(
          onTap: controller.checkIsQuestionAnswered(questionId) ? null : onPressed,
          child: Container(


            child: Container(
              width: double.infinity,


              decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(50),
                  border:
                  Border.all(width: 2, color:controller.getColor(index),)
              ),
              child: Padding(

                padding: const EdgeInsets.all(15.0),
                child: Row(

                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                          text: '${index + 1}. ',
                          style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.black),
                          children: [
                            TextSpan(
                              text: text,
                              style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.black),
                            ),
                          ]),
                    ),
                    if (controller.checkIsQuestionAnswered(questionId) &&
                        controller.selectAnswer == index)
                      Container(
                          width: 30,
                          height: 30,
                          padding: EdgeInsets.zero,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: controller.getColor(index),

                              border: Border.all(
                                color: controller.getColor(index),
                                width: 2,
                              ),
                              shape: BoxShape.circle),
                          child: Icon(
                            controller.getIcon(index),
                            color: Colors.white,
                          ))
                  ],
                ),
              ),
            ),
          )),
    );
  }
}


