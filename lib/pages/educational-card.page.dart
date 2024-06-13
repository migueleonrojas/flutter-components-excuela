import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgets_components/pages/home.page.dart';
import 'package:widgets_components/widgets/educational_card.widget.dart';


class EducationalCardPage extends StatelessWidget {
  const EducationalCardPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.offAll(
              () => const HomePage(),
              routeName: "/home"
            );
          },
        ),
        title: const Text('Widget de Tarjeta Educativa'),
        centerTitle: true,
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            EducationalCard(
              urlImage: "https://picsum.photos/200/300",
              title: 'Titulo de la tarjeta',
              description: 'Un texto descriptivo',
              tag: 'tag-1',
              colorCard: Color(0xFF2C5EB9),
              colorText: Colors.white,
              colorButton: Colors.white,
              colorTextButton: Colors.black,
              widthCard: 250,
            ),
            EducationalCard(
              urlImage: "https://picsum.photos/200/300",
              title: 'Titulo de la tarjeta',
              description: 'Un texto descriptivo',
              tag: 'tag-2',
              colorCard:  Color(0xFF281633),
              colorText: Colors.white,
              colorButton: Colors.white,
              colorTextButton: Colors.black,
              widthCard: 250,
            ),
            EducationalCard(
              urlImage: "https://picsum.photos/200/300",
              title: 'Titulo de la tarjeta',
              description: 'Un texto descriptivo',
              tag: 'tag-3',
              colorCard:  Color.fromARGB(255, 51, 190, 167),
              colorText: Colors.white,
              colorButton: Colors.white,
              colorTextButton: Colors.black,
              widthCard: 250,
    
            ),
          ],
        ),
      ),
      
    );
  }
}