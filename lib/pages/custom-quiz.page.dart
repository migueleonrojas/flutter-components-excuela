import 'package:flutter/material.dart';
import 'package:widgets_components/models/custom_question.model.dart';
import 'package:widgets_components/models/options.model.dart';
import 'package:widgets_components/widgets/custom_quiz.widget.dart';

class CustomQuizPage extends StatelessWidget {
  const CustomQuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget de Quiz Personalizado'),
      ),
      body: Column(
        children: [
          CustomQuiz(
            listCustomQuestions:  <CustomQuestion>[
              CustomQuestion(
                name: '¿El dia de hoy cuando pases a la siguiente prueba tecnica que piensas hacer para no embotarte?', 
                options: [
                  Options(value: 'Comer', isCorrect: false, isCheked: false),
                  Options(value: 'Dormir', isCorrect: false, isCheked: false),
                  Options(value: 'Escuchar Musica', isCorrect: true, isCheked: false),
                  Options(value: 'Nada', isCorrect: false, isCheked: false),
                ]
              ),
              CustomQuestion(
                name: '¿Que dias es hoy?', 
                options: [
                  Options(value: 'Lunes', isCorrect: false, isCheked: false),
                  Options(value: 'Martes', isCorrect: false, isCheked: false),
                  Options(value: 'Miercoles', isCorrect: false, isCheked: false),
                  Options(value: 'Jueves', isCorrect: true, isCheked: false),
                ]
              ),
              CustomQuestion(
                name: '¿Hoy es Jueves?', 
                options: [
                  Options(value: 'Si', isCorrect: true, isCheked: false),
                  Options(value: 'No', isCorrect: false, isCheked: false),
                 
                ]
              ),
            ],
          )
        ],
      ),
    );
  }
}