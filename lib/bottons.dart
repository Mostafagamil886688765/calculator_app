import 'package:flutter/material.dart';

class MyBotton extends StatelessWidget {
  final Color;
  final textcolor;
  final String buttontext;
  final buttontabbed;
  MyBotton(
      {this.Color,
      this.textcolor,
      required this.buttontext,
      this.buttontabbed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttontabbed,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              color: Color,
              child: Center(
                  child: Text(
                buttontext,
                style: TextStyle(color: textcolor, fontSize: 20),
              )),
            )),
      ),
    );
  }
}
