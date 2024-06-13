import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgets_components/pages/custom-quiz.page.dart';
import 'package:widgets_components/pages/educational-card.page.dart';
import 'package:widgets_components/pages/home.page.dart';
import 'package:widgets_components/pages/interactive_progress.page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp (
      debugShowCheckedModeBanner: false,
      title: 'Widgets Personalizados',
      home: const HomePage(),
      initialRoute: "/",
      routes: {
        "/interactive-progress": (_) => const InteractiveProgressPage(),
        "/educational-card": (_) => const EducationalCardPage(),
        "/custom-quiz": (_) => const CustomQuizPage()
      },
    );
  }
}
