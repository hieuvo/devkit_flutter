import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class PaddingContainerPage extends StatefulWidget {
  const PaddingContainerPage({super.key});

  @override
  State<PaddingContainerPage> createState() => _PaddingContainerPageState();
}

class _PaddingContainerPageState extends State<PaddingContainerPage> {
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
                  title: 'Padding on Container',
                  desc: 'This is the example of padding on container using different method'
              ),
              Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const Text('Padding left')
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: Container(
                  color: _containerColor,
                  padding: const EdgeInsets.only(left: 12),
                  child: Text('this text is inside container', style: TextStyle(color: _textColor)),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text('Padding right')
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: Container(
                  color: _containerColor,
                  padding: const EdgeInsets.fromLTRB(0, 0, 12, 0),
                  child: Text('this text is inside container', style: TextStyle(color: _textColor)),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text('Padding left and right with simetric')
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: Container(
                  color: _containerColor,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text('this text is inside container', style: TextStyle(color: _textColor)),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text('Padding all with same value')
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: Container(
                  color: _containerColor,
                  padding: const EdgeInsets.all(12),
                  child: Text('this text is inside container', style: TextStyle(color: _textColor)),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text('Padding all with different value')
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: Container(
                  color: _containerColor,
                  padding: const EdgeInsets.fromLTRB(12, 24, 36, 48),
                  child: Text('this text is inside container', style: TextStyle(color: _textColor)),
                ),
              ),
            ],
          ),
        )
    );
  }
}
