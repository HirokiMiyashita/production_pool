import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:production_pool/constant/main_root_config.dart';

import '../view_model/timer_model.dart';

class Recode extends HookConsumerWidget {
  Recode({super.key});

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Center(
            child: Text(
              'レコード',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          ),
          leading: IconButton(
            color: Colors.black,
            iconSize: 40,
            onPressed: () {
              scaffoldKey.currentState!.openDrawer();
            },
            icon: const Icon(Icons.supervised_user_circle_rounded),
          ),
          actions: <Widget>[
            Row(
              children: [
                Text(
                  DateTime.now().toString(),
                  style: const TextStyle(color: Colors.black),
                )
              ],
            ),
          ],
        ),
        drawer: Drawer(
          child: Column(
            children: [
              const SizedBox(height: 48),
              Row(
                children: [
                  const SizedBox(width: 16),
                  const Icon(
                    Icons.timer_sharp,
                    size: 48,
                  ),
                  const SizedBox(width: 16),
                  TextButton(
                      onPressed: () {
                        context.goNamed(MainRoute.measurement.name);
                      },
                      child: const Text(
                        '計測',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ],
              ),
              const SizedBox(height: 32),
              Row(
                children: [
                  const SizedBox(width: 16),
                  const Icon(
                    Icons.auto_graph,
                    size: 48,
                  ),
                  const SizedBox(width: 16),
                  TextButton(
                      onPressed: () {
                        context.goNamed(MainRoute.record.name);
                      },
                      child: const Text(
                        'レコード',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ],
              )
            ],
          ),
        ),
        body: SingleChildScrollView(child: TimerModel()));
  }
}
