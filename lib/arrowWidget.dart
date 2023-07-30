import 'package:flutter/material.dart';
import 'dart:math';

class ArrowWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: pi / 4, // Adjust the rotation angle of the arrow
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}

