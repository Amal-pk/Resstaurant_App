import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/Controller/login_controller.dart';
import 'package:restaurant_app/View/Widget/remember_forgot.dart';
import 'package:restaurant_app/View/Widget/textformfield.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(
        () => Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset("assets/image/2023-07-13-removebg-preview.png"),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        "Your account",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextFieldWidgets(
                        controller: controller.emailController,
                        hint: 'Email',
                        keybord: TextInputType.emailAddress,
                        validator: '',
                        obscure: false,
                      ),
                      TextFieldWidgets(
                        controller: controller.passwordController,
                        hint: 'password',
                        keybord: TextInputType.emailAddress,
                        validator: '',
                        suffIcon: IconButton(
                          onPressed: () {
                            controller.isobscure();
                          },
                          icon: controller.obscure.value == true
                              ? const Icon(Icons.visibility_off_outlined)
                              : const Icon(Icons.visibility_outlined),
                        ),
                        obscure: controller.obscure.value,
                      ),
                      const ForgotPasswordAndRememberMe(),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            controller.loginUser();
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
