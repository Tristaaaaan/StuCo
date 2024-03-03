import 'package:flutter/material.dart';
import 'package:study_buddy/components/rounded_button.dart';
import 'package:study_buddy/components/rounded_textfield.dart';
import 'package:study_buddy/services/auth/auth_service.dart';

class LoginPage extends StatelessWidget {
  // on Tap
  final void Function()? onTap;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();

  LoginPage({
    super.key,
    required this.onTap,
  });

  void register() {}
  // login method
  void login(BuildContext context) async {
    // auth service
    final authService = AuthService();

    //try login
    try {
      await authService.signInWithEmailPassword(
        _emailController.text,
        _pwController.text,
      );
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ),
      );
    }
    // catch any errors
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          alignment: Alignment.center,
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 20),
            shrinkWrap: true,
            children: [
              Column(
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
                    controller: _pwController,
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  RoundedButton(
                      text: "Sign in",
                      onTap: () => login(context),
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
                            textcolor:
                                Theme.of(context).colorScheme.inversePrimary),
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
                          textcolor:
                              Theme.of(context).colorScheme.inversePrimary,
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
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
