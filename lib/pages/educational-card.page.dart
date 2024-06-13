import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgets_components/controllers/interactive_progress.controllers.dart';
import 'package:widgets_components/pages/home.page.dart';
import 'package:widgets_components/widgets/educational_card.widget.dart';
import 'package:widgets_components/widgets/interactive_progress.widgets.dart';


class EducationalCardPage extends StatelessWidget {
  const EducationalCardPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.off(
              const HomePage(),
              routeName: '/'
            );
          },
        ),
        title: const Text('Widget de Tarjeta Educativa'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            EducationalCard(
              urlImage: "https://picsum.photos/200/300",
              title: 'Desarrollador',
              description: 'Hola soy programador asassa asasasas asasas asasasasas sasaasasa',
              tag: 'tag-1',
              colorCard: Colors.deepOrange,
              colorText: Colors.white,
              colorButton: Colors.black,
              colorTextButton: Colors.white,
            ),
            EducationalCard(
              urlImage: "https://picsum.photos/200/300",
              title: 'Desarrollador',
              description: 'Hola soy programador',
              tag: 'tag-2',
              colorCard: Color.fromARGB(255, 32, 122, 32),
              colorText: Colors.white,
              colorButton: Colors.black,
              colorTextButton: Colors.white,


            ),
            EducationalCard(
              urlImage: "https://picsum.photos/200/300",
              title: 'Desarrollador',
              description: 'Hola soy programador',
              tag: 'tag-3',
              colorCard: Color.fromARGB(255, 86, 69, 160),
              colorText: Color.fromARGB(255, 77, 6, 6),
              colorButton: Colors.black,
              colorTextButton: const Color.fromARGB(255, 182, 16, 16),


            ),
          ],
        ),
      ),
      
    );
  }
}