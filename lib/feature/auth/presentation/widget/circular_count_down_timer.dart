import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';

class CustomCircularCountDownTimer extends StatelessWidget {
  const CustomCircularCountDownTimer({super.key});

  @override
  Widget build(BuildContext context) {
    return   Center(
                    child: CircularCountDownTimer(
                      duration: 65, // Total duration in seconds
                      width: 100, // Width of the circular timer
                      height: 100, // Height of the circular timer
                      ringColor: Colors.grey[300]!, // Background color
                      fillColor: Colors.green, // Progress color
                      strokeWidth: 5.0, // Stroke width
                      textStyle: TextStyle(
                        fontSize: 24, // Text size
                        color: Colors.green, // Text color
                      ),
                      isReverse: true, // Countdown direction
                      isReverseAnimation: true,
                       // Reverse animation
                      onComplete: () {
                        // Action when timer completes
                        print("Timer completed!");
                      },
                    ),
    );
  }
}