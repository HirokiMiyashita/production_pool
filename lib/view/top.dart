import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Top extends HookConsumerWidget {
  Top({super.key});
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

    return Scaffold(
      appBar: AppBar(
        // 左側のアイコン
        leading: const Icon(Icons.arrow_back),
        // タイトルテキスト
        title: Text(counter.value.toString()),
        // 右側のアイコン一覧
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite),
          ),
          IconButton(
            onPressed: () {
              startTimer();
            },
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            !cancelFlg.value ? startTimer() : stopTimer();
          },
          child: Text(cancelFlg.value ? 'STOP' : 'START'),
        ),
      ),
    );
  }
}
