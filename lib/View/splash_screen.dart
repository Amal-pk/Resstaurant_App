import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/Controller/splashSceen_controller.dart';

class SplashScreen extends GetView<SplashController> {
  SplashScreen({super.key});
  final controller = Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/image/2023-07-13__1_-removebg-preview.png",
        ),
      ),
    );
  }
}
