import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterController extends GetxController {
  RxInt hitung = 20.obs;

  void increment() {
    if (hitung < 100) {
      hitung++;
    } else {
      Get.snackbar(
        'Stop',
        'Hitungan sudah mencapai batas maksimal 100',
        backgroundColor: Colors.red,
        icon: Icon(Icons.warning, color: Colors.white),
        colorText: Colors.white,
      );
    }
  }
  void decrement() {
    if (hitung <= 1) {
      Get.snackbar(
        'Stop',
        'Hitungan tidak boleh kurang dari 1',
        backgroundColor: Colors.red,
        icon: Icon(Icons.warning, color: Colors.white),
        colorText: Colors.white,
      );
    } else {
      hitung--;
    }
  }


}
