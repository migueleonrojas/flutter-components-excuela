
import 'dart:async';
import 'package:get/get.dart';

class InteractiveProgressController extends GetxController {
  
  final Rx<double> _progress = 0.0.obs;
  Rx<double> get progress => _progress;
  late Timer _timer;

  setProgress(double value) {
    _progress.value = _progress.value + value;
  }

  set startInterval(bool start) {
    if(!start) return;
    _timer = Timer.periodic(
      const Duration(milliseconds: 300), 
      (timer) {

        if(_progress.value > 1.0) {
          timer.cancel();
          return;
        }

        setProgress(0.01);
      
        
      }
    );
  }

  
  set stopInterval(bool cancel) {
    if(!cancel) return;
    _timer.cancel();
  }

  set clearProgress(double value) {
    _progress.value = value;
  }

  

  
}