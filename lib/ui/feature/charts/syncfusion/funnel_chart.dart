import 'package:devkitflutter/model/feature/sales_model.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class FunnelChartPage extends StatefulWidget {
  const FunnelChartPage({super.key});

  @override
  State<FunnelChartPage> createState() => _FunnelChartPageState();
}

class _FunnelChartPageState extends State<FunnelChartPage> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  final List<Sales> _data = [
    Sales("2014", 50),
    Sales("2015", 120),
    Sales("2016", 140),
    Sales("2017", 170),
    Sales("2018", 80),
    Sales("2019", 110),
    Sales("2020", 260),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: _globalWidget.globalAppBar(),
        body: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _globalWidget.createDetailWidget(
                  title: 'Funnel Chart',
                  desc: 'This is the example of funnel chart'),
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: SfFunnelChart(
                      tooltipBehavior: TooltipBehavior(enable: true),
                      series: FunnelSeries<Sales, String>(
                          dataSource: _data,
                          xValueMapper: (Sales data, _) => data.year,
                          yValueMapper: (Sales data, _) => data.sale,
                          name: 'Sale'))),
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: SfFunnelChart(
                      series: FunnelSeries<Sales, String>(
                          height: '50%',
                          width: '50%',
                          dataSource: _data,
                          xValueMapper: (Sales data, _) => data.year,
                          yValueMapper: (Sales data, _) => data.sale,
                          dataLabelSettings: const DataLabelSettings(
                            isVisible: true,
                          )))),
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: SfFunnelChart(
                      tooltipBehavior: TooltipBehavior(enable: true),
                      series: FunnelSeries<Sales, String>(
                          gapRatio: 0.1,
                          dataSource: _data,
                          xValueMapper: (Sales data, _) => data.year,
                          yValueMapper: (Sales data, _) => data.sale,
                          name: 'Sale'))),
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: SfFunnelChart(
                      tooltipBehavior: TooltipBehavior(enable: true),
                      series: FunnelSeries<Sales, String>(
                          explode: true,
                          explodeOffset: '5%',
                          explodeIndex: 2,
                          dataSource: _data,
                          xValueMapper: (Sales data, _) => data.year,
                          yValueMapper: (Sales data, _) => data.sale,
                          name: 'Sale'))),
            ],
          ),
        ));
  }
}
