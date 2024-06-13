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
      body: Column(
        children: [
          EducationalCard(
            urlImage: "https://picsum.photos/200/300",
            title: 'Desarrollador',
            description: 'Hola soy programador saassasasasassasasasasasa',
            tag: 'tag-1'
          ),
          EducationalCard(
            urlImage: "https://picsum.photos/200/300",
            title: 'Desarrollador',
            description: 'Hola soy programador',
            tag: 'tag-2',
          ),
        ],
      ),
      
    );
  }
}