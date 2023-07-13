import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../component/_common/app_bar.dart';
import '../component/_common/drawer.dart';
import '../component/chart/line_chart.dart';
import '../component/chart/price_points.dart';

class Recode extends HookConsumerWidget {
  Recode({super.key, required this.item});
  final List<Map<String, dynamic>> item;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<double> formatedItem =
        item.map((entry) => entry["value"] as double).toList();
    return Scaffold(
      key: scaffoldKey,
      appBar: CostomAppBar(scaffoldKey: scaffoldKey),
      drawer: const AppDrawer(),
      body: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        child: Column(
          children: [
            const SizedBox(height: 16),
            LineChartWidget(getPricePoints(formatedItem)),
          ],
        ),
      ),
    );
  }
}
