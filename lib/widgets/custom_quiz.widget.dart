import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgets_components/controllers/custom_quiz.controller.dart';
import 'package:widgets_components/models/custom_question.model.dart';
import 'package:widgets_components/models/options.model.dart';

class CustomQuiz extends StatelessWidget {

  final List<CustomQuestion> listCustomQuestions;
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;
  final Color selectedColor;

  const CustomQuiz({
    super.key, 
    required this.listCustomQuestions, 
    required this.backgroundColor, 
    required this.textColor,
    required this.borderColor,
    required this.selectedColor

  });

  @override
  Widget build(BuildContext context) {

    final CustomQuizController customQuizController = Get.put(CustomQuizController());

    customQuizController.setListOfCustomQuestion = listCustomQuestions;

    return Expanded(

      child: Container(
        color: backgroundColor,
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
                      const Expanded(child: SizedBox()),

                      Container(
                        
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: borderColor
                          ),
                          borderRadius: BorderRadius.circular(10),
                          color: backgroundColor,  
              
                        ),
                        child: Padding(
                          
                          padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 5.0),
                        
                          child: Text(
                            currentCuestiom.name,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 25,
                              color: textColor
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
                                side: BorderSide(
                                  width: 3.0,
                                  color: borderColor,
                                ),
                                padding: const EdgeInsets.all(5),
                                backgroundColor: options.isCheked ? selectedColor : backgroundColor
                              ),
                              onPressed: ()  {
        
                                customQuizController.markOption(index, indexOption);
              
                              }, 
                              child: Text(
                                options.value,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: textColor,
                                ),
                              )
                            );
                          },
                        
                        ),
                      ),
                      const Expanded(child: SizedBox()),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: backgroundColor,
                          side: BorderSide(
                            width: 3.0,
                            color: borderColor,
                          ),
                        ),
                        onPressed: () {
                          bool markOption = customQuizController.validateOptionMark(index);
                          if(!markOption){
                            customQuizController.showSnackBar();
                            return;
                          }
                          customQuizController.validateAnswer(index);
                          
                        }, 
                        child: Text(
                          'Validar',
                          
                          style: TextStyle(
                            color: textColor,
                            fontSize: 20
                          ),
                        )
                      ),
                      const Expanded(child: SizedBox()),
            
              
                    ],
                  );
                      
                },
              ),
              customQuizController.showCurrentResult(
                context: context, 
                iconWidget :customQuizController.answerCorrect.value 
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
                 textWidget: customQuizController.answerCorrect.value 
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