import 'package:devkitflutter/model/feature/chart_data_model.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BubbleChartPage extends StatefulWidget {
  const BubbleChartPage({super.key});

  @override
  State<BubbleChartPage> createState() => _BubbleChartPageState();
}

class _BubbleChartPageState extends State<BubbleChartPage> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  final List<ChartData> _data = <ChartData>[
    ChartData('2014', 50, 0.2, 0),
    ChartData('2015', 120, 0.1, 0),
    ChartData('2016', 140, 0.3, 0),
    ChartData('2017', 170, 1, 0),
    ChartData('2018', 80, 0.25, 0),
    ChartData('2019', 110, 0.55, 0),
    ChartData('2020', 260, 0.7, 0),
  ];

  final List<Color> _color = <Color>[];
  final List<double> _stops = <double>[];

  late LinearGradient _gradientColors;

  @override
  void initState() {
    _color.add(Colors.blue[50]!);
    _color.add(Colors.blue[200]!);
    _color.add(Colors.blue);

    _stops.add(0.0);
    _stops.add(0.5);
    _stops.add(1.0);

    _gradientColors = LinearGradient(colors: _color, stops: _stops);

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
                  title: 'Bubble Chart',
                  desc: 'This is the example of bubble chart'),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: SfCartesianChart(
                    primaryXAxis: CategoryAxis(
                        majorGridLines: const MajorGridLines(),
                        labelPlacement: LabelPlacement.onTicks),
                    series: <ChartSeries>[
                      BubbleSeries<ChartData, String>(
                        dataSource: _data,
                        sizeValueMapper: (ChartData data, _) => data.y1,
                        xValueMapper: (ChartData data, _) => data.x,
                        yValueMapper: (ChartData data, _) => data.y,
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
                      BubbleSeries<ChartData, String>(
                        dataSource: _data,
                        sizeValueMapper: (ChartData data, _) => data.y1,
                        xValueMapper: (ChartData data, _) => data.x,
                        yValueMapper: (ChartData data, _) => data.y,
                        dataLabelSettings: const DataLabelSettings(
                          isVisible: true,
                        ),
                      )
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
                      BubbleSeries<ChartData, String>(
                        dataSource: _data,
                        name: 'Sale',
                        sizeValueMapper: (ChartData data, _) => data.y1,
                        xValueMapper: (ChartData data, _) => data.x,
                        yValueMapper: (ChartData data, _) => data.y,
                      )
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
                      BubbleSeries<ChartData, String>(
                          dataSource: _data,
                          name: 'Sale',
                          sizeValueMapper: (ChartData data, _) => data.y1,
                          xValueMapper: (ChartData data, _) => data.x,
                          yValueMapper: (ChartData data, _) => data.y,
                          gradient: _gradientColors)
                    ]),
              ),
            ],
          ),
        ));
  }
}
