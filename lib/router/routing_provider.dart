import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../constant/main_root_config.dart';
import '../view/top.dart';

part 'routing_provider.g.dart';

@riverpod
GoRouter routing(RoutingRef ref) {
  return GoRouter(
      routerNeglect: true,
      debugLogDiagnostics: true,
      initialLocation: MainRoute.top.path,
      errorBuilder: (context, state) {
        context.goNamed(MainRoute.top.path);
        return const SizedBox();
      },
      routes: [
        GoRoute(
          path: MainRoute.top.path,
          name: MainRoute.top.name,
          pageBuilder: (context, state) {
            return MaterialPage(child: Top());
          },
        )
      ]);
}
