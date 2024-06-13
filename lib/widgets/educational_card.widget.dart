import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgets_components/controllers/educational_card.controller.dart';

class EducationalCard extends StatelessWidget {

  final String urlImage;
  final String title;
  final String description;
  final String tag;
  final Color colorCard;
  final Color colorText;
  final Color colorButton;
  final Color colorTextButton;
  

  const EducationalCard({
    super.key,
    required this.urlImage, 
    required this.title, 
    required this.description, 
    required this.tag,
    required this.colorCard, 
    required this.colorText, 
    required this.colorButton, 
    required this.colorTextButton
  });


  @override
  Widget build(BuildContext context) {

    final EducationalCardController educationalCardController = Get.put(EducationalCardController());

    Size size = MediaQuery.of(context).size;

    return Center(
      child: SizedBox(
        width: size.width * 0.80,
        child: Card(
          color: colorCard,
          elevation: 3,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Column(
                children: [
                  Hero(
                    tag: '$tag-img',
                    child: GestureDetector(
                      onTap: () => educationalCardController.goToDetailsWidget(
                        context: context,
                        tag: '$tag-img',
                        widget: FadeInImage.assetNetwork(
                          placeholder: 'assets/no-image.jpg',
                          image: urlImage,
                          width: size.width,
                          height: size.height * 0.80,
                          fit: BoxFit.cover,
                          alignment: Alignment.center
                        )
                        
                      ),
                      child: FadeInImage.assetNetwork(
                        placeholder: 'assets/no-image.jpg',
                        image: urlImage,
                        width: size.width,
                        height: size.height * 0.25,
                        fit: BoxFit.cover,
                        alignment: Alignment.center
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        title,
                        style:  TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: colorText
                        ),
                      ),
                      Text(
                        description,
                        textAlign: TextAlign.center,
                        style:  TextStyle(
                          fontSize: 20,
                          color: colorText  
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: colorButton
                        ),
                        child: Text(
                          'Ver imagen a pantalla completa',
                          style:  TextStyle(
                            color: colorTextButton
                          ),
                        ),
                        onPressed: () => educationalCardController.imageFullScreen(
                          context: context,
                          widget: FadeInImage.assetNetwork(
                            placeholder: 'assets/no-image.jpg',
                            image: urlImage,
                            width: size.width,
                            height: size.height * 1,
                            fit: BoxFit.cover,
                            alignment: Alignment.center
                          )
                        ))
                    ],
                  )
                ]
              )
  
            ),
          ),
        ),
      ),
    );
  }
}
