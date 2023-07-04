import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../constant/main_root_config.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
