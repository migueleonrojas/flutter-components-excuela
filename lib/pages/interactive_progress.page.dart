import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgets_components/controllers/interactive_progress.controllers.dart';
import 'package:widgets_components/pages/home.page.dart';
import 'package:widgets_components/widgets/interactive_progress.widgets.dart';

class InteractiveProgressPage extends StatelessWidget {
  const InteractiveProgressPage({super.key});



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
        title: const Text(
          'Widget de Progreso Interactivo',
          style: TextStyle(
            fontSize: 18
          ),
        ),
        centerTitle: true,
      ),
      body: 
        const InteractiveProgress(
          progress: 0,
          backgroundColorProgress: Color.fromARGB(255, 176, 183, 194),
          valueColor: Color(0xFF295597),
          boxColor: Color.fromARGB(255, 10, 139, 179),
          textBoxColor: Color.fromARGB(214, 255, 255, 255),
          title: 'Cargando...',
          sizeInteractiveProgress: 200,
        )
      );
  }
}
