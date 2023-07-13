import 'dart:developer';

import 'package:get/get.dart';
import 'package:restaurant_app/View/home_page.dart';
import 'package:restaurant_app/View/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    log("splash");
    checkUserLoggedIn();
    super.onInit();
  }

  checkUserLoggedIn() async {
    log("snap");
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final checked = pref.getString('password');
    if (checked == null || checked.isEmpty) {
      await Future.delayed(const Duration(seconds: 2));
      Get.off(() => LoginScreen());
    } else {
      await Future.delayed(const Duration(seconds: 1));
      Get.off(() => HomePage());
    }
  }
}
