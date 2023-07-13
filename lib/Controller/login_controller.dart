import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/View/home_page.dart';
import 'package:restaurant_app/View/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  RxBool obscure = true.obs;
  isobscure() {
    obscure.value = !obscure.value;
    update();
  }

  loginUser() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar('Enter Email & Password', 'To Login ',
          snackPosition: SnackPosition.BOTTOM);
    } else {
      saveToSharedPref();
      Get.off(() =>  HomePage());
      saveUserLoggedIn();
    }
    update();
  }

  saveToSharedPref() async {
    final sharedPrefrence = await SharedPreferences.getInstance();
    sharedPrefrence.setString('email', emailController.text.trim());
    sharedPrefrence.setString('password', passwordController.text.trim());
    log(emailController.text);
  }

  saveUserLoggedIn() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool('userloggedin', true);
  }

  getSavedData() async {
    final sharedPrefrence = await SharedPreferences.getInstance();
    final savedEmailValue = sharedPrefrence.getString('email');
    final savedPasswordValue = sharedPrefrence.getString('password');
    if (savedEmailValue != null || savedPasswordValue != null) {
      // Navigator.push(
      // context, MaterialPageRoute(builder: (context) => Homepage())
      // );
    } else {
      Get.to(
        () => LoginScreen(),
      );
    }
  }


}
