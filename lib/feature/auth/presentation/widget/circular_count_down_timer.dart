import 'package:Thimar/core/constant/app_constant.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';

class CustomCircularCountDownTimer extends StatelessWidget {
  const CustomCircularCountDownTimer({super.key});

  @override
  Widget build(BuildContext context) {
     return Center(
       child: CircularCountDownTimer(
        duration: 5,
        initialDuration: 0,
        controller: CountDownController(),
        width: MediaQuery.of(context).size.width / 4,
        height: MediaQuery.of(context).size.height / 4,
        ringColor: Colors.grey.shade100,
        ringGradient: null,
        fillColor: Colors.white,
        fillGradient: null,
        backgroundColor: Colors.white,
        backgroundGradient: null,
         
        strokeCap: StrokeCap.round,
        textStyle: const TextStyle(
            fontSize: 25.0, color: buttonColor, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
        textFormat: CountdownTextFormat.S,
        isReverse: false,
        isReverseAnimation: false,
        isTimerTextShown: true,
        autoStart: false,
        onStart: () {
          debugPrint('Countdown Started');
        },
        onComplete: () {
          debugPrint('Countdown Ended');
        },
        onChange: (String timeStamp) {
          debugPrint('Countdown Changed $timeStamp');
        },
        timeFormatterFunction: (defaultFormatterFunction, duration) {
          if (duration.inSeconds == 0) {
            return "Start";
          } else {
            return Function.apply(defaultFormatterFunction, [duration]);
          }
        },
           ),
     );
  }
}
