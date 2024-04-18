import 'package:devkitflutter/model/feature/chart_data_model.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CombinationChartPage extends StatefulWidget {
  const CombinationChartPage({super.key});

  @override
  State<CombinationChartPage> createState() => _CombinationChartPageState();
}

class _CombinationChartPageState extends State<CombinationChartPage> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  final List<ChartData> _data = <ChartData>[
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
                  title: 'Combination Chart',
                  desc: 'This is the example of combination chart'
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: SfCartesianChart(
                    primaryXAxis: CategoryAxis(
                        majorGridLines: const MajorGridLines(),
                        labelPlacement: LabelPlacement.onTicks),
                    tooltipBehavior: TooltipBehavior(enable: true),
                    legend: const Legend(isVisible: true),
                    series: <CartesianSeries>[
                      ColumnSeries<ChartData, String>(
                        name: 'Refrigerator',
                        dataSource: _data,
                        xValueMapper: (ChartData data, _) => data.x,
                        yValueMapper: (ChartData data, _) => data.y1,
                        opacity: 0.5,
                        markerSettings: const MarkerSettings(
                            isVisible: true
                        ),
                      ),
                      LineSeries<ChartData, String>(
                        name: 'SmartPhone',
                        dataSource: _data,
                        xValueMapper: (ChartData data, _) => data.x,
                        yValueMapper: (ChartData data, _) => data.y,
                        markerSettings: const MarkerSettings(
                            isVisible: true
                        ),
                      ),
                      ScatterSeries<ChartData, String>(
                        name: 'TV',
                        dataSource: _data,
                        xValueMapper: (ChartData data, _) => data.x,
                        yValueMapper: (ChartData data, _) => data.y2,
                          markerSettings: const MarkerSettings(
                              height: 15,
                              width: 15,
                              shape: DataMarkerType.diamond
                          )
                      )
                    ]
                ),
              ),
            ],
          ),
        )
    );
  }
}