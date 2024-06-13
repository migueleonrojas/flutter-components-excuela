import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgets_components/controllers/custom_quiz.controller.dart';
import 'package:widgets_components/models/custom_question.model.dart';
import 'package:widgets_components/models/options.model.dart';

class CustomQuiz extends StatelessWidget {

  final List<CustomQuestion> listCustomQuestions;

  const CustomQuiz({super.key, required this.listCustomQuestions});

  @override
  Widget build(BuildContext context) {

    final CustomQuizController customQuizController = Get.put(CustomQuizController());

    customQuizController.setListOfCustomQuestion = listCustomQuestions;

    return Expanded(

      child: Container(
        color: Colors.black,
        child: Obx(() =>
        Stack(
          children: [
            PageView.builder(
                itemCount: customQuizController.getListOfCustomQuestion.length,
                controller: customQuizController.pageController,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
              
                  CustomQuestion currentCuestiom = CustomQuestion.fromJson(customQuizController.getListOfCustomQuestion[index].toJson());
              
                  return Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 40, left: 10, right: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,  
              
                        ),
                        child: Padding(
                          
                          padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 5.0),
                        
                          child: Text(
                            currentCuestiom.name,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 25
                            ),
                          )
                        ),
                      ),
                      const Expanded(child: SizedBox()),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: GridView.builder(
                          itemCount: currentCuestiom.options.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 20.0,
                            mainAxisSpacing: 20.0,
                            childAspectRatio: 1,
                            mainAxisExtent: 60
                          ),
                          itemBuilder:(context, indexOption) {
                        
                            Options options = Options.fromJson(currentCuestiom.options[indexOption].toJson());
                        
                            
                        
                            return ElevatedButton(
                              
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.all(5),
                                backgroundColor: options.isCheked ? Colors.yellow : const Color(0xFFFFFFFF)
                              ),
                              onPressed: ()  {

                                if(customQuizController.canShowCurrentResult.value) {
                                  return;
                                }

                                listCustomQuestions[index].options.forEach((Options options)  {
                                  options.isCheked =  false;
                                });
              
                                listCustomQuestions[index].options[indexOption].isCheked = true;
              
                                customQuizController.setListOfCustomQuestion = listCustomQuestions;

                                if(options.isCorrect) {
                                  customQuizController.answerCorrect.value = true;
                                }
                                
                                customQuizController.getListOfCustomQuestion.refresh();
              
              
                              }, 
                              child: Text(
                                options.value,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.black
                                ),
                              )
                            );
                          },
                        
                        ),
                      ),
                      const Expanded(child: SizedBox()),
                      ElevatedButton(
                        onPressed: () {
                          
                          customQuizController.validateAnswer(index);
                          
                        }, 
                        child: const Text('Confirmar')
                      ),
                      const Expanded(child: SizedBox()),
            
              
                    ],
                  );
                      
                },
              ),
              customQuizController.showCurrentResult(
                context, 
                customQuizController.answerCorrect.value 
                  ? const Icon(
                    color: Colors.green,
                    Icons.check_circle_sharp,
                    size: 180,
                  )
                  : const Icon(
                    color: Colors.red,
                    Icons.disabled_by_default_sharp,
                    size: 180,
                  )
                  , 
                 customQuizController.answerCorrect.value 
                  ? const Text(
                    'Respuesta Correcta',
                    style: TextStyle(
                      color: Colors.white
                    ),
                  )
                  : const Text(
                    'Respuesta Incorrecta',
                    style: TextStyle(
                      color: Colors.red
                    ),
                  )
              )
          ],
        ),
        ),
      ),
    );
  }
}