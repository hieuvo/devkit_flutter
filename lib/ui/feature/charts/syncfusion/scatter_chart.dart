import 'package:devkitflutter/model/feature/sales_model.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ScatterChartPage extends StatefulWidget {
  const ScatterChartPage({super.key});

  @override
  State<ScatterChartPage> createState() => _ScatterChartPageState();
}

class _ScatterChartPageState extends State<ScatterChartPage> {
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
                  title: 'Scatter Chart',
                  desc: 'This is the example of scatter chart'),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: SfCartesianChart(
                    primaryXAxis: CategoryAxis(
                        majorGridLines: const MajorGridLines(),
                        labelPlacement: LabelPlacement.onTicks),
                    series: <ChartSeries>[
                      ScatterSeries<Sales, String>(
                        dataSource: _data,
                        xValueMapper: (Sales sales, _) => sales.year,
                        yValueMapper: (Sales sales, _) => sales.sale,
                      )
                    ]),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: SfCartesianChart(
                    primaryXAxis: CategoryAxis(
                        majorGridLines: const MajorGridLines(),
                        labelPlacement: LabelPlacement.onTicks),
                    series: <ChartSeries>[
                      ScatterSeries<Sales, String>(
                          dataSource: _data,
                          xValueMapper: (Sales sales, _) => sales.year,
                          yValueMapper: (Sales sales, _) => sales.sale,
                          dataLabelSettings: const DataLabelSettings(
                            isVisible: true,
                          ))
                    ]),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: SfCartesianChart(
                    primaryXAxis: CategoryAxis(
                        majorGridLines: const MajorGridLines(),
                        labelPlacement: LabelPlacement.onTicks),
                    tooltipBehavior: TooltipBehavior(enable: true),
                    series: <ChartSeries>[
                      ScatterSeries<Sales, String>(
                        dataSource: _data,
                        xValueMapper: (Sales sales, _) => sales.year,
                        yValueMapper: (Sales sales, _) => sales.sale,
                        name: 'Sale',
                      )
                    ]),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: SfCartesianChart(
                    primaryXAxis: CategoryAxis(
                        majorGridLines: const MajorGridLines(),
                        labelPlacement: LabelPlacement.onTicks),
                    series: <ChartSeries>[
                      ScatterSeries<Sales, String>(
                          dataSource: _data,
                          xValueMapper: (Sales sales, _) => sales.year,
                          yValueMapper: (Sales sales, _) => sales.sale,
                          name: 'Sale',
                          dataLabelSettings: const DataLabelSettings(
                            isVisible: true,
                          ),
                          markerSettings: const MarkerSettings(
                              height: 15,
                              width: 15,
                              shape: DataMarkerType.diamond))
                    ]),
              ),
            ],
          ),
        ));
  }
}
