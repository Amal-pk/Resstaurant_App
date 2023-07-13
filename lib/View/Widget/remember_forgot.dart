import 'package:flutter/material.dart';

class ForgotPasswordAndRememberMe extends StatelessWidget {
  const ForgotPasswordAndRememberMe({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
              value: false,
              onChanged: (value) {},
            ),
            const Text("Remember me")
          ],
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            "Forgot Password?",
            style: TextStyle(
              color: Color.fromARGB(255, 2, 42, 103),
            ),
          ),
        )
      ],
    );
  }
}