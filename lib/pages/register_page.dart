import 'package:flutter/material.dart';
import 'package:study_buddy/components/rounded_button.dart';
import 'package:study_buddy/components/rounded_textfield.dart';
import 'package:study_buddy/services/auth/auth_service.dart';

class RegisterPage extends StatelessWidget {
  final void Function()? onTap;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _confirmPwController = TextEditingController();

  RegisterPage({
    super.key,
    required this.onTap,
  });

  // register

  void register(BuildContext context) {
    // get auth service
    final auth = AuthService();

    // password match => create user
    if (_pwController.text == _confirmPwController.text) {
      try {
        auth.signUpWithEmailPassword(_emailController.text, _pwController.text);
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text("Password does not match"),
        ),
      );
    }
  }

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
            RoundedTextField(
              hintText: "Email",
              obscureText: false,
              controller: _emailController,
            ),
            const SizedBox(
              height: 25,
            ),
            RoundedTextField(
                hintText: "Password",
                obscureText: true,
                controller: _pwController),
            const SizedBox(
              height: 25,
            ),
            RoundedTextField(
                hintText: "Confirm password",
                obscureText: true,
                controller: _confirmPwController),
            const SizedBox(
              height: 25,
            ),
            RoundedButton(
                text: "Sign up",
                onTap: () => register(context),
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
