import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/Controller/login_controller.dart';

class TextFieldWidgets extends StatelessWidget {
  TextFieldWidgets({
    Key? key,
    required this.hint,
    required this.validator,
    required this.controller,
    required this.keybord,
    this.suffIcon, required this.obscure,
  }) : super(key: key);
  final TextEditingController? controller;
  final TextInputType keybord;
  final String hint;
  final String validator;
  final Widget? suffIcon;
  final bool obscure;
  final loginController = Get.find<LoginController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.orange),
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscure,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          suffixIcon: suffIcon,
        ),
        keyboardType: keybord,
      ),
    );
  }
}
