import 'package:flutter/material.dart';
import 'package:study_buddy/components/rounded_button.dart';

class StudyGroupContainer extends StatelessWidget {
  final void Function()? onTap;
  const StudyGroupContainer({
    super.key,
    required this.onTap,
  });

  void join() {}
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 175,
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  spreadRadius: 2,
                  blurRadius: 10,
                  offset: const Offset(2, 5),
                  color: Colors.black.withOpacity(0.1),
                ),
              ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Column(
              children: [
                const Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Math 51 Study Group",
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Join this group to study math together!",
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            "Members: 15",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                RoundedButton(
                  text: "Join",
                  onTap: join,
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  color: Theme.of(context).colorScheme.tertiaryContainer,
                  textcolor: Theme.of(context).colorScheme.inversePrimary,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}