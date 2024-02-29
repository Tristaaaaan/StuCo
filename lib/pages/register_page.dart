import 'package:flutter/material.dart';
import 'package:study_buddy/components/rounded_button.dart';
import 'package:study_buddy/components/rounded_textfield.dart';

class RegisterPage extends StatelessWidget {
  final void Function()? onTap;

  const RegisterPage({
    super.key,
    required this.onTap,
  });

  void register() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "StuCo",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontSize: 40),
            ),
            Text(
              "Find study groups and tutors easily",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontSize: 16),
            ),
            const SizedBox(
              height: 50,
            ),
            const RoundedTextField(
              hintText: "Email",
              obscureText: false,
            ),
            const SizedBox(
              height: 25,
            ),
            const RoundedTextField(
              hintText: "Password",
              obscureText: true,
            ),
            const SizedBox(
              height: 25,
            ),
            const RoundedTextField(
              hintText: "Confirm password",
              obscureText: true,
            ),
            const SizedBox(
              height: 25,
            ),
            RoundedButton(
                text: "Sign up",
                onTap: register,
                margin: const EdgeInsets.symmetric(horizontal: 25),
                color: Theme.of(context).colorScheme.inversePrimary,
                textcolor: Theme.of(context).colorScheme.background),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account?",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 12)),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Login now",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
