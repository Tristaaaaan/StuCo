import 'package:flutter/material.dart';
import 'package:study_buddy/components/rounded_button.dart';
import 'package:study_buddy/components/rounded_textfield.dart';
import 'package:study_buddy/pages/home_page.dart';

class LoginPage extends StatelessWidget {
  // on Tap
  final void Function()? onTap;

  const LoginPage({
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
            RoundedButton(
                text: "Sign in",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
                margin: const EdgeInsets.symmetric(horizontal: 25),
                color: Theme.of(context).colorScheme.inversePrimary,
                textcolor: Theme.of(context).colorScheme.background),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(right: 10),
                      child: Divider(
                        color: Theme.of(context).colorScheme.primary,
                        thickness: 1,
                      ),
                    ),
                  ),
                  Text(
                    "GET",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 12),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: Divider(
                        color: Theme.of(context).colorScheme.primary,
                        thickness: 1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Expanded(
                  child: RoundedButton(
                      text: "Facebook",
                      onTap: register,
                      margin: const EdgeInsets.only(left: 25),
                      color: Theme.of(context).colorScheme.primary,
                      textcolor: Theme.of(context).colorScheme.inversePrimary),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: RoundedButton(
                    text: "Google",
                    onTap: register,
                    margin: const EdgeInsets.only(right: 25),
                    color: Theme.of(context).colorScheme.primary,
                    textcolor: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Create an account",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 12)),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Sign up",
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
