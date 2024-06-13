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
  final double widthCard;
  

  const EducationalCard({
    super.key,
    required this.urlImage, 
    required this.title, 
    required this.description, 
    required this.tag,
    required this.colorCard, 
    required this.colorText, 
    required this.colorButton, 
    required this.colorTextButton,
    required this.widthCard
  });


  @override
  Widget build(BuildContext context) {

    final EducationalCardController educationalCardController = Get.put(EducationalCardController());

    Size sizeContext = MediaQuery.of(context).size;

    return Center(
      child: SizedBox(
        width: widthCard,
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
                          width: sizeContext.width,
                          height: sizeContext.height * 0.80,
                          fit: BoxFit.cover,
                          alignment: Alignment.center
                        )
                        
                      ),
                      child: FadeInImage.assetNetwork(
                        placeholder: 'assets/no-image.jpg',
                        image: urlImage,
                        width: widthCard,
                        height: widthCard * 0.75,
                        fit: BoxFit.cover,
                        alignment: Alignment.center
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      const SizedBox(height: 20,),
                      Text(
                        title,
                        style:  TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: colorText
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Text(
                        description,
                        textAlign: TextAlign.center,
                        style:  TextStyle(
                          fontSize: 20,
                          color: colorText  
                        ),
                      ),
                      const SizedBox(height: 20,),
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: colorButton
                        ),
                        child: Text(
                          'Ver imagen',
                          textAlign: TextAlign.center,
                          style:  TextStyle(
                            color: colorTextButton
                          ),
                        ),
                        onPressed: () => educationalCardController.imageFullScreen(
                          context: context,
                          widget: FadeInImage.assetNetwork(
                            placeholder: 'assets/no-image.jpg',
                            image: urlImage,
                            width: sizeContext.width,
                            height: sizeContext.height * 1,
                            fit: BoxFit.cover,
                            alignment: Alignment.center
                          )
                        )),
                        const SizedBox(height: 20,),

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
