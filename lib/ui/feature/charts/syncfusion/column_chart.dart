import 'package:devkitflutter/model/feature/sales_model.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ColumnChartPage extends StatefulWidget {
  const ColumnChartPage({super.key});

  @override
  State<ColumnChartPage> createState() => _ColumnChartPageState();
}

class _ColumnChartPageState extends State<ColumnChartPage> {
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

  final List<ChartData> _data2 = <ChartData>[
    ChartData('2014', 50, 30, 80),
    ChartData('2015', 120, 150, 170),
    ChartData('2016', 140, 180, 160),
    ChartData('2017', 170, 270, 220),
    ChartData('2018', 80, 180, 120),
    ChartData('2019', 110, 90, 150),
    ChartData('2020', 260, 370, 310),
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
                  title: 'Column Chart',
                  desc: 'This is the example of column chart'),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: SfCartesianChart(
                    primaryXAxis: CategoryAxis(),
                    primaryYAxis: NumericAxis(),
                    tooltipBehavior: TooltipBehavior(enable: true),
                    series: <ChartSeries<Sales, String>>[
                      ColumnSeries<Sales, String>(
                          dataSource: _data,
                          xValueMapper: (Sales data, _) => data.year,
                          yValueMapper: (Sales data, _) => data.sale,
                          name: 'Sale',
                          color: const Color.fromRGBO(8, 142, 255, 1))
                    ]),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: SfCartesianChart(
                    primaryXAxis: CategoryAxis(),
                    primaryYAxis:
                        NumericAxis(minimum: 0, maximum: 300, interval: 40),
                    series: <ChartSeries<Sales, String>>[
                      ColumnSeries<Sales, String>(
                          dataSource: _data,
                          xValueMapper: (Sales data, _) => data.year,
                          yValueMapper: (Sales data, _) => data.sale,
                          name: 'Sale',
                          dataLabelSettings: const DataLabelSettings(
                            isVisible: true,
                          ),
                          color: Colors.green)
                    ]),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: SfCartesianChart(
                    primaryXAxis: CategoryAxis(),
                    primaryYAxis: NumericAxis(),
                    tooltipBehavior: TooltipBehavior(enable: true),
                    series: <ChartSeries<Sales, String>>[
                      ColumnSeries<Sales, String>(
                          dataSource: _data,
                          xValueMapper: (Sales data, _) => data.year,
                          yValueMapper: (Sales data, _) => data.sale,
                          name: 'Sale',
                          borderRadius: const BorderRadius.all(Radius.circular(15)))
                    ]),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: SfCartesianChart(
                    primaryXAxis: CategoryAxis(),
                    primaryYAxis: NumericAxis(),
                    tooltipBehavior: TooltipBehavior(enable: true),
                    legend: const Legend(isVisible: true),
                    series: <CartesianSeries>[
                      ColumnSeries<ChartData, String>(
                          name: 'SmartPhone',
                          dataSource: _data2,
                          xValueMapper: (ChartData data, _) => data.x,
                          yValueMapper: (ChartData data, _) => data.y),
                      ColumnSeries<ChartData, String>(
                          name: 'Refrigerator',
                          dataSource: _data2,
                          xValueMapper: (ChartData data, _) => data.x,
                          yValueMapper: (ChartData data, _) => data.y1),
                      ColumnSeries<ChartData, String>(
                          name: 'TV',
                          dataSource: _data2,
                          xValueMapper: (ChartData data, _) => data.x,
                          yValueMapper: (ChartData data, _) => data.y2)
                    ]),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: SfCartesianChart(
                    primaryXAxis: CategoryAxis(),
                    primaryYAxis: NumericAxis(),
                    tooltipBehavior: TooltipBehavior(enable: true),
                    enableSideBySideSeriesPlacement: false,
                    legend: const Legend(isVisible: true),
                    series: <CartesianSeries>[
                      ColumnSeries<ChartData, String>(
                          name: 'SmartPhone',
                          dataSource: _data2,
                          xValueMapper: (ChartData data, _) => data.x,
                          yValueMapper: (ChartData data, _) => data.y),
                      ColumnSeries<ChartData, String>(
                          name: 'Refrigerator',
                          opacity: 0.9,
                          width: 0.6,
                          dataSource: _data2,
                          xValueMapper: (ChartData data, _) => data.x,
                          yValueMapper: (ChartData data, _) => data.y1),
                      ColumnSeries<ChartData, String>(
                          name: 'TV',
                          opacity: 0.7,
                          width: 0.3,
                          dataSource: _data2,
                          xValueMapper: (ChartData data, _) => data.x,
                          yValueMapper: (ChartData data, _) => data.y2)
                    ]),
              ),
            ],
          ),
        ));
  }
}

class ChartData {
  ChartData(this.x, this.y, this.y1, this.y2);

  final String x;
  final double? y;
  final double? y1;
  final double? y2;
}
