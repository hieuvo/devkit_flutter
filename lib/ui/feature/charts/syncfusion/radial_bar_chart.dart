import 'package:devkitflutter/model/feature/sales_model.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class RadialBarChartPage extends StatefulWidget {
  const RadialBarChartPage({super.key});

  @override
  State<RadialBarChartPage> createState() => _RadialBarChartPageState();
}

class _RadialBarChartPageState extends State<RadialBarChartPage> {
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
                  title: 'Radial Bar Chart',
                  desc: 'This is the example of radial bar chart'),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: SfCircularChart(series: <CircularSeries>[
                  RadialBarSeries<Sales, String>(
                      dataSource: _data,
                      xValueMapper: (Sales data, _) => data.year,
                      yValueMapper: (Sales data, _) => data.sale)
                ]),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: SfCircularChart(series: <CircularSeries>[
                  RadialBarSeries<Sales, String>(
                      dataSource: _data,
                      xValueMapper: (Sales data, _) => data.year,
                      yValueMapper: (Sales data, _) => data.sale,
                      radius: '50%')
                ]),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: SfCircularChart(series: <CircularSeries>[
                  RadialBarSeries<Sales, String>(
                      dataSource: _data,
                      xValueMapper: (Sales data, _) => data.year,
                      yValueMapper: (Sales data, _) => data.sale,
                      dataLabelSettings: const DataLabelSettings(
                        isVisible: true,
                      ))
                ]),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: SfCircularChart(
                    tooltipBehavior: TooltipBehavior(enable: true),
                    series: <CircularSeries>[
                      RadialBarSeries<Sales, String>(
                        dataSource: _data,
                        xValueMapper: (Sales data, _) => data.year,
                        yValueMapper: (Sales data, _) => data.sale,
                        name: 'Sale',
                      )
                    ]),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: SfCircularChart(
                    tooltipBehavior: TooltipBehavior(enable: true),
                    series: <CircularSeries>[
                      RadialBarSeries<Sales, String>(
                          dataSource: _data,
                          xValueMapper: (Sales data, _) => data.year,
                          yValueMapper: (Sales data, _) => data.sale,
                          name: 'Sale',
                          innerRadius: '20%')
                    ]),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: SfCircularChart(
                    tooltipBehavior: TooltipBehavior(enable: true),
                    series: <CircularSeries>[
                      RadialBarSeries<Sales, String>(
                          dataSource: _data,
                          xValueMapper: (Sales data, _) => data.year,
                          yValueMapper: (Sales data, _) => data.sale,
                          name: 'Sale',
                          cornerStyle: CornerStyle.bothCurve)
                    ]),
              ),
            ],
          ),
        ));
  }
}
