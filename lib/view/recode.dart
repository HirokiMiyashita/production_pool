import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../component/_common/app_bar.dart';
import '../component/_common/drawer.dart';
import '../component/chart/lineChart.dart';
import '../component/chart/pricePoints.dart';

class Recode extends HookConsumerWidget {
  Recode({super.key, required this.item});
  final List<double> item;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      key: scaffoldKey,
      appBar: CostomAppBar(scaffoldKey: scaffoldKey),
      drawer: const AppDrawer(),
      body: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        child: Column(
          children: [
            SizedBox(height: 16),
            LineChartWidget(getPricePoints(item)),
          ],
        ),
      ),
    );
  }
}
