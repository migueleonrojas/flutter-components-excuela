import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EducationalCardController extends GetxController {

  void imageFullScreen({required BuildContext context, required Widget widget}) {
    Size size = MediaQuery.of(context).size;
    Navigator.of(context).push(MaterialPageRoute<void>(
      builder: (BuildContext context) => Scaffold(
        
        body: Stack(
          children: [
            widget,
            Positioned(
                top: 40,
                width: size.width * 0.50,
               
                left: size.width * 0.25,
            
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: const Color.fromARGB(106, 0, 0, 0)
                  ),
                  child: const Text(
                    'Regresar',
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                  onPressed: () {
                      Navigator.pop(context);
                    
                  },
                ),
              )
          ],
        ),
      ),
      
    ));
  }
  
  void goToDetailsWidget({required BuildContext context, required Object tag, required Widget widget}) {

    Size size = MediaQuery.of(context).size;
    Navigator.of(context).push(MaterialPageRoute<void>(
      builder: (BuildContext context) => Scaffold(
        
        body: SizedBox(
          height: size.height,
          width: size.width,
          child: Hero(
              tag: tag,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    
                    child: widget
                  ),
                  TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.black
                      ),
                      child: const Text(
                        'Regresarse',
                        style: TextStyle(
                          color: Colors.white
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    )

                ],
              ),
            ),
        ),
      ),
      
    ));
  }

}