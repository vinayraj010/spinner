import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';
import 'arrowWidget.dart';
import 'circlePainter.dart';

class CircularContainer extends StatefulWidget {
  @override
  _CircularContainerState createState() => _CircularContainerState();
}

class _CircularContainerState extends State<CircularContainer> {
  double rotationAngle = 0.0;
  bool isRotating = false;
  String selectedColor = "";

  // Define colors for each section
  final List<Color> colors = [Colors.red, Colors.blue, Colors.green, Colors.yellow];
  // Define color names corresponding to the colors list
  final List<String> colorNames = ["Green", "Blue", "Red", "Yellow"];

  void startRotationTimer() {
    if (!isRotating) {
      isRotating = true;
      Timer.periodic(Duration(milliseconds: 50), (timer) {
        setState(() {
          rotationAngle += 0.1;
          selectedColor = getColorNameAtAngle(rotationAngle);
        });
        if (timer.tick >= 100) {
          timer.cancel();
          isRotating = false;
        }
      });
    }
  }

  String getColorNameAtAngle(double angle) {
    // Calculate the index of the color based on the current angle
    int index = ((angle / (2 * pi)) * colors.length).floor() % colors.length;
    return colorNames[index];
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: (details) {
        startRotationTimer(); // Start the rotation timer when the user swipes
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 200.0,
            height: 200.0,
            child: CustomPaint(
              painter: CirclePainter(rotationAngle),
            ),
          ),
          Positioned(
            top: 25.0, // Adjust the position of the arrow
            child: ArrowWidget(),
          ),
          Positioned(
            bottom: 10.0,
            child: Text(selectedColor,style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w800
            ),),
          ),
        ],
      ),
    );
  }
}