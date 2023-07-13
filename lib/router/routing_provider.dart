import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../constant/main_root_config.dart';
import '../view/top.dart';
import '../view_model/record_model.dart';

part 'routing_provider.g.dart';

@riverpod
GoRouter routing(RoutingRef ref) {
  return GoRouter(
      routerNeglect: true,
      debugLogDiagnostics: true,
      initialLocation: MainRoute.measurement.path,
      errorBuilder: (context, state) {
        context.goNamed(MainRoute.measurement.path);
        return const SizedBox();
      },
      routes: [
        GoRoute(
          path: MainRoute.record.path,
          name: MainRoute.record.name,
          pageBuilder: (context, state) {
            return MaterialPage(child: RecordModel());
          },
        ),
        GoRoute(
          path: MainRoute.measurement.path,
          name: MainRoute.measurement.name,
          pageBuilder: (context, state) {
            return MaterialPage(child: Timer());
          },
        ),
      ]);
}
