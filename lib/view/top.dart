import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../component/app_bar.dart';
import '../component/drawer.dart';
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
      body: const SingleChildScrollView(child: TimerModel()),
    );
  }
}
