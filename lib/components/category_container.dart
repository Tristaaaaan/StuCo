import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  final String text;
  final IconData? icons;
  final void Function()? onTap;

  const Category(
      {super.key,
      required this.text,
      required this.icons,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 140,
          width: 140,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.tertiaryContainer,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Icon(
                    icons,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  text,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
