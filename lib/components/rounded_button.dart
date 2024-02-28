import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  final EdgeInsetsGeometry? margin;
  final Color? color;

  const RoundedButton(
      {super.key,
      required this.text,
      required this.onTap,
      required this.margin,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(24)),
        padding: const EdgeInsets.all(25),
        margin: margin,
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: Theme.of(context).colorScheme.background),
          ),
        ),
      ),
    );
  }
}
