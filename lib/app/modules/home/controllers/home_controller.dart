import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  
  RxInt hitung = 0.obs;

  void increment() {
    if (hitung < 10) {
      hitung++;
    } else {
      Get.snackbar('Stop', 'Hitungan sudah mencapai batas maksimal 10',
          backgroundColor: Colors.red,
          icon: Icon(Icons.warning, color: Colors.white),
          colorText: Colors.white,
          );
    }
    hitung++;
  }
}
