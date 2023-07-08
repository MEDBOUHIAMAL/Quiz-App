import 'package:get/get.dart';
import 'package:quiz/Controllers/quizController.dart';

class BilndingsApp implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => QuestionController());
  }
}


