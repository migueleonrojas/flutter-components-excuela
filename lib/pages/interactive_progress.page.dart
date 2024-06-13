import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgets_components/controllers/interactive_progress.controllers.dart';
import 'package:widgets_components/pages/home.page.dart';
import 'package:widgets_components/widgets/interactive_progress.widgets.dart';

class InteractiveProgressPage extends StatelessWidget {
   InteractiveProgressPage({super.key});

    final InteractiveProgressController interactiveProgressController = Get.put(InteractiveProgressController());


  @override
  Widget build(BuildContext context) {
    final InteractiveProgressController interactiveProgressController = Get.put(InteractiveProgressController());

    interactiveProgressController.startInterval = true;
    interactiveProgressController.clearProgress = 0.0;


    return PopScope (
      onPopInvoked: (didPop) {
        interactiveProgressController.clearProgress = 0.0;
        interactiveProgressController.startInterval = true;
      },
      child: Scaffold(
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
        body: Obx(() => 
          InteractiveProgress(
            progress: interactiveProgressController.progress.value,
            backgroundColorProgress: const Color.fromARGB(255, 41, 85, 151),
            valueColor: const Color.fromARGB(255, 228, 30, 218),
            boxColor: const Color.fromARGB(135, 125, 196, 125),
            textBoxColor: const Color.fromARGB(216, 212, 88, 5),
            title: 'Cargando...',
            sizeInteractiveProgress: 200,
          )
        ),
  
      ),
    );
  }
}
