import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ButtonWidgetPage extends StatefulWidget {
  const ButtonWidgetPage({super.key});

  @override
  State<ButtonWidgetPage> createState() => _ButtonWidgetPageState();
}

class _ButtonWidgetPageState extends State<ButtonWidgetPage> {
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
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _globalWidget.createDetailWidget(
                    title: 'Button Widget',
                    desc: 'This is the example of Button'),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const Text('Flat Button'),
                ),
                const Text('FlatButton is deprecated, use TextButton instead', style: TextStyle(
                    color: Colors.grey
                )),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) => Colors.blue,
                        ),
                        overlayColor: MaterialStateProperty.all(Colors.transparent),
                        shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3.0),
                            )
                        ),
                      ),
                      onPressed: () {
                        Fluttertoast.showToast(msg: 'Press Text Button', toastLength: Toast.LENGTH_SHORT);
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          'Text Button',
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      )
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const Text('Flat Button with border'),
                ),
                const Text('FlatButton is deprecated, use TextButton instead', style: TextStyle(
                    color: Colors.grey
                )),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) => Colors.blue,
                        ),
                        overlayColor: MaterialStateProperty.all(Colors.transparent),
                        shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            )
                        ),
                      ),
                      onPressed: () {
                        Fluttertoast.showToast(msg: 'Press Text Button', toastLength: Toast.LENGTH_SHORT);
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          'Text Button',
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      )
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text('Flat button with gradient'),
                ),
                const Text('FlatButton is deprecated, use TextButton instead', style: TextStyle(
                    color: Colors.grey
                )),
                TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) => Colors.transparent,
                      ),
                      overlayColor: MaterialStateProperty.all(Colors.transparent),
                    ),
                    onPressed: () {
                      Fluttertoast.showToast(msg: 'Press Text Button', toastLength: Toast.LENGTH_SHORT);
                    },
                    child: Ink(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: <Color>[
                            Color(0xFF0D47A1),
                            Color(0xFF42A5F5)
                          ],
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(3)),
                      ),
                      child: Container(
                        constraints: const BoxConstraints(maxWidth: 190, minHeight: 40), // min sizes for Material buttons
                        alignment: Alignment.center,
                        child: const Text(
                          "Gradient Button",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    )
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text('Flat button with border radius and gradient'),
                ),
                const Text('FlatButton is deprecated, use TextButton instead', style: TextStyle(
                    color: Colors.grey
                )),
                TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) => Colors.transparent,
                      ),
                      overlayColor: MaterialStateProperty.all(Colors.transparent),
                    ),
                    onPressed: () {
                      Fluttertoast.showToast(msg: 'Press Text Button', toastLength: Toast.LENGTH_SHORT);
                    },
                    child: Ink(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: <Color>[
                            Color(0xFF0D47A1),
                            Color(0xFF42A5F5),
                          ],
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Container(
                        constraints: const BoxConstraints(maxWidth: 190, minHeight: 40), // min sizes for Material buttons
                        alignment: Alignment.center,
                        child: const Text(
                          "OK",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    )
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const Text('Outline Button'),
                ),
                const Text('OutlineButton is deprecated, use OutlinedButton instead', style: TextStyle(
                    color: Colors.grey
                )),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: OutlinedButton(
                      onPressed: () {
                        Fluttertoast.showToast(msg: 'Press Outline Button', toastLength: Toast.LENGTH_SHORT);
                      },
                      style: ButtonStyle(
                          overlayColor: MaterialStateProperty.all(Colors.transparent),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              )
                          ),
                          side: MaterialStateProperty.all(
                            BorderSide(
                                color: Colors.grey[300]!,
                                width: 1.0
                            ),
                          )
                      ),
                      child: const Text(
                        'Outlined Button',
                        style: TextStyle(
                            fontSize: 14
                        ),
                        textAlign: TextAlign.center,
                      )
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text('Outline Button with border color and text color'),
                ),
                const Text('OutlineButton is deprecated, use OutlinedButton instead', style: TextStyle(
                    color: Colors.grey
                )),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: OutlinedButton(
                      onPressed: () {
                        Fluttertoast.showToast(msg: 'Press Outline Button', toastLength: Toast.LENGTH_SHORT);
                      },
                      style: ButtonStyle(
                          overlayColor: MaterialStateProperty.all(Colors.transparent),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              )
                          ),
                          side: MaterialStateProperty.all(
                            const BorderSide(
                                color: Colors.purple,
                                width: 1.0
                            ),
                          )
                      ),
                      child: const Text(
                        'Outlined Button',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.pinkAccent
                        ),
                        textAlign: TextAlign.center,
                      )
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text('Outline Button with border radius'),
                ),
                const Text('OutlineButton is deprecated, use OutlinedButton instead', style: TextStyle(
                    color: Colors.grey
                )),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: OutlinedButton(
                      onPressed: () {
                        Fluttertoast.showToast(msg: 'Press Outline Button', toastLength: Toast.LENGTH_SHORT);
                      },
                      style: ButtonStyle(
                          overlayColor: MaterialStateProperty.all(Colors.transparent),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(26),
                              )
                          ),
                          side: MaterialStateProperty.all(
                            const BorderSide(
                                color: Colors.purple,
                                width: 1.0
                            ),
                          )
                      ),
                      child: const Text(
                        'Outlined Button',
                        style: TextStyle(
                            fontSize: 14
                        ),
                        textAlign: TextAlign.center,
                      )
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text('Outline Button icon'),
                ),
                const Text('OutlineButton is deprecated, use OutlinedButton instead', style: TextStyle(
                    color: Colors.grey
                )),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: OutlinedButton.icon(
                      onPressed: () {
                        Fluttertoast.showToast(msg: 'Press Outline Button', toastLength: Toast.LENGTH_SHORT);
                      },
                      style: ButtonStyle(
                          overlayColor: MaterialStateProperty.all(Colors.cyanAccent),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(26),
                              )
                          ),
                          side: MaterialStateProperty.all(
                            const BorderSide(
                                color: Colors.purple,
                                width: 1.0
                            ),
                          )
                      ),
                    icon: const Icon(
                      Icons.add,
                      size: 18.0,
                    ),
                    label: const Text('Outline Button Icon'),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text('Raised button'),
                ),
                const Text('RaisedButton is deprecated, use ElevatedButton instead', style: TextStyle(
                    color: Colors.grey
                )),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) => Colors.blue,
                        ),
                        overlayColor: MaterialStateProperty.all(Colors.transparent),
                        shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3.0),
                            )
                        ),
                      ),
                      onPressed: () {
                        Fluttertoast.showToast(msg: 'Press Elevated Button', toastLength: Toast.LENGTH_SHORT);
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          'Add',
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      )
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text('Raised button with border'),
                ),
                const Text('RaisedButton is deprecated, use ElevatedButton instead', style: TextStyle(
                    color: Colors.grey
                )),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) => Colors.blue,
                        ),
                        overlayColor: MaterialStateProperty.all(Colors.transparent),
                        shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            )
                        ),
                      ),
                      onPressed: () {
                        Fluttertoast.showToast(msg: 'Press Elevated Button', toastLength: Toast.LENGTH_SHORT);
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          'Save',
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      )
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
