import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgets_components/pages/interactive_progress.page.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Widgets Master"),
        centerTitle: true,
      ),
      body: SizedBox(
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(
                  fontFamily: 'Raleway', 
                  color: Colors.white
                ),
                backgroundColor: const Color(0xFFFF9000)
              ),
              onPressed: () {
                Get.off(
                  InteractiveProgressPage(),
                  routeName: '/interactive-progress'
                );
              },
              child: const Text(
                'Widget de Progreso Interactivo',
                style: TextStyle(color: Colors.white),
              )
            )
          ]
        ),
      ),
    );
  }
}
