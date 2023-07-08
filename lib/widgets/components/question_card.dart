
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:quiz/Controllers/quizController.dart';
import 'package:quiz/Used.dart';
import 'package:quiz/model/Questions.dart';

import 'package:quiz/widgets/components/option.dart.';

class QuestionCard extends StatelessWidget {
  final Question questionModel;

  const QuestionCard({
    Key? key,
    required this.questionModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          height: 450,
          margin: const EdgeInsets.symmetric(horizontal: 20.0),
          decoration: BoxDecoration(
            color: kGrayColor,
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  questionModel.question,

                  style: Theme.of(context).textTheme.headline6!
                    .copyWith(color: Colors.black),
                ),
                //const SizedBox(height: 15),
                const Spacer(
                  flex: 1,
                ),
                ...List.generate(
                    questionModel.options.length,
                        (index) => Column(
                      children: [
                        Option(

                            text: questionModel.options[index],

                            index: index,
                            onPressed: () => Get.find<QuestionController>()
                                .checkAnswer(questionModel, index), questionId: questionModel.id,),
                        const SizedBox(
                          height: 15,
                        )
                      ],
                    )),
                const Spacer(
                  flex: 1,
                ),
              ],
            ),
          )),
    );
  }
}
