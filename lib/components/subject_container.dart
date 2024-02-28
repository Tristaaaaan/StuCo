import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubjectContainer extends StatelessWidget {
  const SubjectContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 100,
        width: 64,
        child: Container(
          child: Column(
            children: [
              Container(
                height: 64,
                width: 64,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 10,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Icon(
                  Icons.abc,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    "Hehe",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}