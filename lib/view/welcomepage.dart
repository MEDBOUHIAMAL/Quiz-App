import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz/Controllers/quizController.dart';
import 'package:quiz/view/quizpage.dart';


import '../Used.dart';
import '../widgets/components/ButtonStart.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  static const routeName = '/';

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final _nameController = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey();

  void _submit(context) {
    FocusScope.of(context).unfocus();
    if (!_formkey.currentState!.validate()) return;
    _formkey.currentState!.save();
    Get.offAndToNamed(QuizPage.routeName);
    Get.find<QuestionController>().startTimer();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
        resizeToAvoidBottomInset: false,
        extendBody: true,
        body: Container(

          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Lottie.asset('assets/welcome.json',
                        height: 260,
                        alignment: Alignment.center

                    ),


                    Text(" Flutter Quiz",
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: usedColor,fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 30.0),
                    Text(
                      'Enter your name to start',
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: Colors.cyanAccent),
                    ),
                    SizedBox(height: 30.0),
                    Form(
                      key: _formkey,
                      child: GetBuilder<QuestionController>(
                        init: Get.find<QuestionController>(),
                        builder: (controller) => TextFormField(
                          controller: _nameController,
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                              filled: true,
                              hintText: 'Full Name',
                              hintStyle: TextStyle(fontSize: 20.0,color: kGrayColor),
                              border: OutlineInputBorder(

                                  borderSide: BorderSide(width: 2,color: Colors.cyanAccent),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(15.0)))),
                          validator: (String? val) {
                            if (val!.isEmpty) {
                              return 'Name should not be empty';
                            } else {
                              return null;
                            }
                          },
                          onSaved: (String? val) {
                            controller.name = val!.trim().toUpperCase();
                          },
                          onFieldSubmitted: (_) => _submit(context),
                        ),
                      ),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: CustomButton(
                          width: double.infinity,
                          onPressed: () => _submit(context),
                          text: 'Let\'s Start '),
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
