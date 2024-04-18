import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class MarginContainerPage extends StatefulWidget {
  const MarginContainerPage({super.key});

  @override
  State<MarginContainerPage> createState() => _MarginContainerPageState();
}

class _MarginContainerPageState extends State<MarginContainerPage> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  final Color _containerColor = Colors.indigoAccent;
  final Color _textColor = Colors.white;

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
                  title: 'Margin on Container',
                  desc: 'This is the example of margin on container using different method'
              ),
              Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const Text('Margin left')
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: Container(
                  color: _containerColor,
                  margin: const EdgeInsets.only(left: 12),
                  child: Text('this text is inside container', style: TextStyle(color: _textColor)),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text('Margin right')
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: Container(
                  color: _containerColor,
                  margin: const EdgeInsets.fromLTRB(0, 0, 12, 0),
                  child: Text('this text is inside container', style: TextStyle(color: _textColor)),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text('Margin left and right with simetric')
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: Container(
                  color: _containerColor,
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text('this text is inside container', style: TextStyle(color: _textColor)),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text('Margin all with same value')
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: Container(
                  color: _containerColor,
                  margin: const EdgeInsets.all(12),
                  child: Text('this text is inside container', style: TextStyle(color: _textColor)),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text('Margin all with different value')
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: Container(
                  color: _containerColor,
                  margin: const EdgeInsets.fromLTRB(12, 24, 36, 48),
                  child: Text('this text is inside container', style: TextStyle(color: _textColor)),
                ),
              ),
            ],
          ),
        )
    );
  }
}
