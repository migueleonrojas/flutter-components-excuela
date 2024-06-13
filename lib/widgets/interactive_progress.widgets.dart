import 'package:flutter/material.dart';

class InteractiveProgress extends StatelessWidget {

  final double progress;
  final Color backgroundColorProgress;
  final Color valueColor;
  final Color boxColor;
  final Color textBoxColor;
  final String title;
  final double sizeInteractiveProgress;

  InteractiveProgress({
    required this.progress, 
    required this.backgroundColorProgress, 
    required this.valueColor,
    required this.boxColor,
    required this.textBoxColor, 
    required this.title,
    required this.sizeInteractiveProgress
  }):
    assert(
      progress > 0.0 || progress <= 1.0, 
      'El valor para indicar el progreso debe ser mayor a 0.0 y menor 1.0.'
    ),
    assert(
      sizeInteractiveProgress >= 200 || sizeInteractiveProgress <= 300,
      'El tamaño del Widget de Progreso Interactivo debe ser mayor a 200 y menor a 300.'
    );
   

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
              Positioned(
                top: sizeInteractiveProgress *  0.10,
                width: sizeInteractiveProgress * 0.80,
                height: sizeInteractiveProgress * 0.80,
                left: sizeInteractiveProgress * 0.10,
                child: TweenAnimationBuilder<double>(
                  tween: Tween<double>(begin: 0.0, end: progress),
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
              Positioned(
                top: sizeInteractiveProgress *  0.40,
                width: sizeInteractiveProgress *  0.80,
                height: sizeInteractiveProgress * 0.20,
                left: sizeInteractiveProgress * 0.10,
            
                child: Text(
                  '${num.parse((progress * 100).toString()).toStringAsFixed(2)} %',
                  textAlign:TextAlign.center ,
                  style: TextStyle(
                    color: textBoxColor,
                    fontSize: sizeInteractiveProgress * 0.10
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