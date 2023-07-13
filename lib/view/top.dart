import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../component/_common/app_bar.dart';
import '../component/_common/drawer.dart';
import '../view_model/timer_model.dart';

class Timer extends HookConsumerWidget {
  Timer({super.key});

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      key: scaffoldKey,
      appBar: CostomAppBar(scaffoldKey: scaffoldKey),
      drawer: const AppDrawer(),
      body: TimerModel(),
    );
  }
}
