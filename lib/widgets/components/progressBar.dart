
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:quiz/Controllers/quizController.dart';
import 'package:quiz/Used.dart';

class ProgressTimer extends StatelessWidget {
   ProgressTimer({
    Key? key,
  }) : super(key: key);

  final controller=Get.find<QuestionController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
            () => SizedBox(
      height: 50,
      width: 50,
      child: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: [
          CircularProgressIndicator(
            value: 1-(controller.sec.value  /15),
            color: usedColor,
            backgroundColor: kGrayColor,
            strokeWidth: 8,
          ),
          Center(
            child: Text(
              '${controller.sec.value}',
              style: Theme.of(context)
              .textTheme.headline6!.copyWith(color: usedColor),
            ),
          )
        ],
      ),
    ));
  }
}