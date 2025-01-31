import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgets_components/models/custom_question.model.dart';
import 'package:widgets_components/models/options.model.dart';
import 'package:widgets_components/pages/home.page.dart';
import 'package:widgets_components/widgets/custom_quiz.widget.dart';

class CustomQuizPage extends StatelessWidget {
  const CustomQuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) {
        
        return;
      },
      child: Scaffold(
        
        appBar: AppBar(
          title: const Text('Widget de Quiz Personalizado'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Get.offAll(
                () => const HomePage(),
                routeName: "/home"
              );
            },
          ),
        ),
        body: Column(
          children: [
            CustomQuiz(
              backgroundColor: Colors.black,
              textColor: Colors.white,
              borderColor: Colors.deepPurpleAccent,
              selectedColor: Colors.green,
              listCustomQuestions:  <CustomQuestion>[
                CustomQuestion(
                  name: '¿Cuanto es 2 + 2?', 
                  options: [
                    Options(value: '2', isCorrect: false, isCheked: false),
                    Options(value: '1', isCorrect: false, isCheked: false),
                    Options(value: '4', isCorrect: true, isCheked: false),
                    Options(value: '0', isCorrect: false, isCheked: false),
                  ]
                ),
                CustomQuestion(
                  name: '¿De que color es el cielo?', 
                  options: [
                    Options(value: 'Negro', isCorrect: false, isCheked: false),
                    Options(value: 'Verde', isCorrect: false, isCheked: false),
                    Options(value: 'Rojo', isCorrect: false, isCheked: false),
                    Options(value: 'Azul', isCorrect: true, isCheked: false),
                  ]
                ),
                CustomQuestion(
                  name: '¿En la Antartida hay nieve?', 
                  options: [
                    Options(value: 'Verdadero', isCorrect: true, isCheked: false),                 
                    Options(value: 'Falso', isCorrect: false, isCheked: false),
                  ]
                ),
                CustomQuestion(
                  name: '¿Cuantos estomagos tiene una vaca?', 
                  options: [
                    Options(value: '4', isCorrect: true, isCheked: false),
                    Options(value: '1', isCorrect: false, isCheked: false),
                    Options(value: '3', isCorrect: false, isCheked: false),
                    Options(value: '2', isCorrect: false, isCheked: false),
                  ]
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}