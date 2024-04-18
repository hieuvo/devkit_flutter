import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class TableBorderPage extends StatefulWidget {
  const TableBorderPage({super.key});

  @override
  State<TableBorderPage> createState() => _TableBorderPageState();
}

class _TableBorderPageState extends State<TableBorderPage> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

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
                  title: 'Table Border',
                  desc: 'This is the example of table with border'
              ),
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: Table(
                    border: TableBorder.all(color: Colors.pinkAccent, width: 2),
                    children: const [
                      TableRow(
                          children: [
                            TableCell(child: Center(child: Text('1'))),
                            TableCell(child: Center(child: Text('2'))),
                            TableCell(child: Center(child: Text('3'))),
                          ]
                      ),
                      TableRow(
                          children: [
                            TableCell(child: Center(child: Text('4'))),
                            TableCell(child: Center(child: Text('5'))),
                            TableCell(child: Center(child: Text('6'))),
                          ]
                      ),
                      TableRow(
                          children: [
                            TableCell(child: Center(child: Text('7'))),
                            TableCell(child: Center(child: Text('8'))),
                            TableCell(child: Center(child: Text('9'))),
                          ]
                      )
                    ],
                  )
              ),
            ],
          ),
        )
    );
  }
}
