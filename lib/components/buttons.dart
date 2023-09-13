import 'package:flutter/material.dart';

class myButton extends StatelessWidget {
  final color;
  final textcolor;
  final buttontext;
  final ontapp;

  const myButton(
      {super.key, this.color, this.textcolor, this.buttontext, this.ontapp});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontapp,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: color,
            child: Center(
              child: Text(
                buttontext,
                style: TextStyle(
                    color: textcolor,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
