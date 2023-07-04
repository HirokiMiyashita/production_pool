import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';

class TimerModel extends HookConsumerWidget {
  TimerModel({super.key});
  Timer? timer;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cancelFlg = useState(false);
    final counter = useState(0);

    void startTimer() {
      cancelFlg.value = true;

      timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        counter.value += 1;
      });
    }

    void stopTimer() {
      cancelFlg.value = false;
      timer?.cancel();
    }

    return Column(children: [
      const SizedBox(height: 40),
      GestureDetector(
        onTap: () {},
        child: Image.asset(
          'assets/images/top_banner.png',
        ),
      ),
      Column(
        children: [
          Lottie.asset(
            'assets/jsons/7731-water-loading.json',
            repeat: cancelFlg.value,
            animate: cancelFlg.value,
          ),
        ],
      ),
      Container(
        alignment: Alignment.bottomCenter,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: !cancelFlg.value ? Colors.indigo : Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
          ),
          onPressed: () {
            !cancelFlg.value ? startTimer() : stopTimer();
          },
          child: Padding(
            padding: const EdgeInsets.only(
                left: 40.0, right: 40.0, top: 4, bottom: 4),
            child: Text(
              cancelFlg.value ? 'ストップ' : 'スタート',
              style: TextStyle(
                  fontSize: 36, color: cancelFlg.value ? Colors.indigo : null),
            ),
          ),
        ),
      ),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        onPressed: () {
          !cancelFlg.value ? startTimer() : stopTimer();
        },
        child: const Padding(
          padding: EdgeInsets.only(left: 40.0, right: 40.0, top: 4, bottom: 4),
          child: Text(
            '計測を終了',
            style: TextStyle(fontSize: 36, color: Colors.white),
          ),
        ),
      ),
      const SizedBox(
        height: 60,
      )
    ]);
  }
}
