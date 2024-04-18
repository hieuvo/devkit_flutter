import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class StandartDialogPage extends StatefulWidget {
  const StandartDialogPage({super.key});

  @override
  State<StandartDialogPage> createState() => _StandartDialogPageState();
}

class _StandartDialogPageState extends State<StandartDialogPage> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  final FocusNode _focusField = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _focusField.dispose();
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
                  title: 'Dialog', desc: 'This is the example of dialog'),
              Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const Text('Dialog 1')),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: _globalWidget.createButton(
                    buttonName: 'Open Dialog 1',
                    onPressed: () {
                      _showPopup1(context);
                    }),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const Text(
                      'Dialog 2 (Cannot dismiss when click on the screen)')),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: _globalWidget.createButton(
                    buttonName: 'Open Dialog 2',
                    onPressed: () {
                      _showPopup2(context);
                    }),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const Text(
                      'Dialog 3 (Cannot dismiss when click on the screen or back button)')),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: _globalWidget.createButton(
                    buttonName: 'Open Dialog 3',
                    onPressed: () {
                      _showPopup3(context);
                    }),
              ),
            ],
          ),
        ));
  }

  void _showPopup1(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)), //this right here
            child: Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.fromLTRB(40, 20, 40, 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: black21),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) => primaryColor,
                        ),
                        overlayColor:
                            MaterialStateProperty.all(Colors.transparent),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3.0),
                        )),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 5),
                        child: Text(
                          'OK',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ))
                ],
              ),
            ),
          );
        });
  }

  void _showPopup2(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)), //this right here
            child: Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.fromLTRB(40, 20, 40, 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: black21),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) => primaryColor,
                        ),
                        overlayColor:
                            MaterialStateProperty.all(Colors.transparent),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3.0),
                        )),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 5),
                        child: Text(
                          'OK',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ))
                ],
              ),
            ),
          );
        });
  }

  void _showPopup3(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return PopScope(
            canPop: false,
            child: Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)), //this right here
              child: Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.fromLTRB(40, 20, 40, 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, color: black21),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) => primaryColor,
                          ),
                          overlayColor:
                              MaterialStateProperty.all(Colors.transparent),
                          shape:
                              MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3.0),
                          )),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 24, vertical: 5),
                          child: Text(
                            'OK',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ))
                  ],
                ),
              ),
            ),
          );
        });
  }
}
