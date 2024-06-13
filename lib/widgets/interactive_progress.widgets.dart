import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgets_components/controllers/interactive_progress.controllers.dart';

class InteractiveProgress extends StatelessWidget {

  final double progress;
  final Color backgroundColorProgress;
  final Color valueColor;
  final Color boxColor;
  final Color textBoxColor;
  final String title;
  final double sizeInteractiveProgress;

  const InteractiveProgress({
    super.key,
    required this.progress, 
    required this.backgroundColorProgress, 
    required this.valueColor,
    required this.boxColor,
    required this.textBoxColor, 
    required this.title,
    required this.sizeInteractiveProgress
  });
   

  @override
  Widget build(BuildContext context) {
    final InteractiveProgressController interactiveProgressController = Get.put(InteractiveProgressController());

    interactiveProgressController.startInterval = true;
    interactiveProgressController.clearProgress = 0.0;
  
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: sizeInteractiveProgress * 0.20
            ),
          ),
          SizedBox(height: sizeInteractiveProgress * 0.025,),
          Stack(
            children: [
              Container(
                height: sizeInteractiveProgress,
                width: sizeInteractiveProgress,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: boxColor
                ),
                
              ),
              Obx(
                () => Positioned(
                  top: sizeInteractiveProgress *  0.10,
                  width: sizeInteractiveProgress * 0.80,
                  height: sizeInteractiveProgress * 0.80,
                  left: sizeInteractiveProgress * 0.10,
                  child: TweenAnimationBuilder<double>(
                    tween: Tween<double>(begin: 0.0, end: interactiveProgressController.progress.value),
                    duration: const Duration(milliseconds: 1000),
                    builder: (context, value, _) => CircularProgressIndicator(
                    value: value,
                    backgroundColor: backgroundColorProgress,
                    valueColor: AlwaysStoppedAnimation<Color>(valueColor),
                    strokeCap: StrokeCap.round,
                    strokeWidth: 15,
                    
                  ),
                  ),
                ),
              ),
              Positioned(
                top: sizeInteractiveProgress *  0.40,
                width: sizeInteractiveProgress *  0.80,
                height: sizeInteractiveProgress * 0.20,
                left: sizeInteractiveProgress * 0.10,
            
                child: Obx(
                  () => 
                  Text(
                    '${num.parse((interactiveProgressController.progress.value * 100).toString()).toStringAsFixed(2)} %',
                    textAlign:TextAlign.center ,
                    style: TextStyle(
                      color: textBoxColor,
                      fontSize: sizeInteractiveProgress * 0.10
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    ); 
  }

}