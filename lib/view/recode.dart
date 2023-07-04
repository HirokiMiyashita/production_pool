import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:production_pool/component/drawer.dart';

import '../component/app_bar.dart';

class Recode extends HookConsumerWidget {
  Recode({super.key, required this.item});
  final List item;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      key: scaffoldKey,
      appBar: CostomAppBar(scaffoldKey: scaffoldKey),
      drawer: const AppDrawer(),
      body: ListView.builder(
        itemCount: item.length,
        itemBuilder: (context, index) {
          return Text(item[index]);
        },
      ),
    );
  }
}
