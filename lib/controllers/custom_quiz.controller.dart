import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgets_components/models/custom_question.model.dart';
import 'package:widgets_components/models/options.model.dart';
import 'package:widgets_components/pages/home.page.dart';

class CustomQuizController extends GetxController {

  final RxList<CustomQuestion> _listOfCustomQuestion = <CustomQuestion>[].obs;
  RxBool canShowCurrentResult = false.obs;
  RxBool answerCorrect = false.obs;

  set setListOfCustomQuestion(List<CustomQuestion> list) {
    _listOfCustomQuestion.value = list;
  }

  RxList<CustomQuestion> get getListOfCustomQuestion => _listOfCustomQuestion;

  PageController pageController = PageController(initialPage: 0);

  Widget showCurrentResult({
    required BuildContext context, 
    required Icon iconWidget, 
    required Text textWidget
  }) {

    if(canShowCurrentResult.isFalse) {
      return const SizedBox();
    }

    Size size = MediaQuery.of(context).size;
    return SizedBox(
      
      width: size.width,
      height: size.height,
      child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          
          border: Border.all(
            color: Colors.white
          ),
          color: Colors.black,
          borderRadius: BorderRadius.circular(50),
          
          
        ),
        child: Column(
          children: [
            iconWidget,
            textWidget            
          ]
        ),
      )],
    ));
  }

  showSnackBar(){
    Get.snackbar(
      duration: const Duration(seconds: 5),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.black,
      colorText: Colors.white,
      '¡Ups!', 
      'Debe marcar una opcion.'
    );
  }

  bool validateOptionMark (int indexQuestion) {

    bool anyOptionMark = false;

    for (Options options in _listOfCustomQuestion[indexQuestion].options) {
      if(options.isCheked){
        anyOptionMark = true;
        break;
      }
    }
    return anyOptionMark;
  }

  markOption(int index, int indexOption) {
    if(canShowCurrentResult.value) {
      return;
    }

    for (Options options in _listOfCustomQuestion[index].options) {
      options.isCheked =  false;
    }

    _listOfCustomQuestion[index].options[indexOption].isCheked = true;

    if(_listOfCustomQuestion[index].options[indexOption].isCorrect) {
      answerCorrect.value = true;
    }
    else {
      answerCorrect.value = false;

    }
    
    _listOfCustomQuestion.refresh();
  }
  

  validateAnswer(int nexpage) {
    bool canGoNextPage = answerCorrect.value;
    canShowCurrentResult.value = true;
    Future.delayed(const Duration(seconds: 3), () {
      canShowCurrentResult.value = false;
      answerCorrect.value = false;

      
      if(canGoNextPage) {
        if(nexpage + 1 != getListOfCustomQuestion.length){
          if(pageController.hasClients) {
            pageController.animateToPage(nexpage + 1, duration: const Duration(milliseconds: 800), curve: Curves.decelerate);
          }
        }
        else {
          Get.defaultDialog(
            barrierDismissible: false,
            title: '¡Felicidades culminastes las preguntas!',
            content: Container(
              
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                
                border: Border.all(
                  color: Colors.white
                ),
                
                borderRadius: BorderRadius.circular(30),
                
                
              ),
            child: Column(
              children: [
                  const Icon(
                    color: Colors.green,
                    Icons.check_circle_sharp,
                    size: 180,
                  ),
                  TextButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          side: const BorderSide(
                            color: Colors.black, // your color here
                            width: 1,
                          ),
                        borderRadius: BorderRadius.circular(0)
                        )
                      )
                    ),
                    onPressed: () {
                      Get.offAll(
                        () => const HomePage(),
                        routeName: '/home'
                      );
                      
                    }, 
                    child: const Text(
                      'Salir',
                      style: TextStyle(
                        color: Colors.black
                      ),
                    )
                  )       
                ]
              ),
            )
          );
        }
      }
    });
  }

}