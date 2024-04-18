import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class InputChipPage extends StatefulWidget {
  const InputChipPage({super.key});

  @override
  State<InputChipPage> createState() => _InputChipPageState();
}

class _InputChipPageState extends State<InputChipPage> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  final TextEditingController _etEmail = TextEditingController();
  final _emailList = <String>[];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _etEmail.dispose();
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
                  title: 'Input Chip',
                  desc: 'This is the example of input chip'
              ),
              Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const Text('Interactive Example')
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: _etEmail,
                    onSubmitted: (value) {
                      setState(() {
                        _etEmail.text = '';
                        _emailList.add(value);
                      });
                    },
                    decoration: const InputDecoration(
                      hintText: 'Input a email',
                      isDense: true,
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 16,
                    children: _emailList.map((value) {
                      return InputChip(
                        backgroundColor: Colors.pinkAccent,
                        avatar: const CircleAvatar(
                          backgroundImage: NetworkImage('$globalUrl/user/avatar.png'),
                        ),
                        label: Text(value, style: const TextStyle(
                          color: Colors.white
                        )),
                        onDeleted: () {
                          setState(() {
                            _emailList.remove(value);
                          });
                        },
                        deleteIconColor: Colors.white,
                      );
                    }).toList(),
                  ),
                ],
              ),
              Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text('Default')
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: const InputChip(
                  label: Text('example@domain.com'),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text('With on press')
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: InputChip(
                  label: const Text('example@domain.com'),
                  onPressed: () {
                    Fluttertoast.showToast(msg: 'Click input chip', toastLength: Toast.LENGTH_SHORT);
                  },
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text('With avatar')
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: InputChip(
                  label: const Text('example@domain.com'),
                  onPressed: () {
                    Fluttertoast.showToast(msg: 'Click input chip', toastLength: Toast.LENGTH_SHORT);
                  },
                  avatar: const CircleAvatar(
                    backgroundImage: NetworkImage('$globalUrl/user/avatar.png'),
                  ),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text('With deleted icon')
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: InputChip(
                  label: const Text('example@domain.com'),
                  onPressed: () {
                    Fluttertoast.showToast(msg: 'Click input chip', toastLength: Toast.LENGTH_SHORT);
                  },
                  avatar: const CircleAvatar(
                    backgroundImage: NetworkImage('$globalUrl/user/avatar.png'),
                  ),
                  onDeleted: () {
                    Fluttertoast.showToast(msg: 'Click delete icon', toastLength: Toast.LENGTH_SHORT);
                  },
                  deleteIcon: const Icon(Icons.remove_circle, size: 18),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text('Add some color')
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: InputChip(
                  backgroundColor: Colors.pinkAccent,
                  label: const Text('example@domain.com', style: TextStyle(
                    color: Colors.white
                  )),
                  onPressed: () {
                    Fluttertoast.showToast(msg: 'Click input chip', toastLength: Toast.LENGTH_SHORT);
                  },
                  avatar: const CircleAvatar(
                    backgroundImage: NetworkImage('$globalUrl/user/avatar.png'),
                  ),
                  onDeleted: () {
                    Fluttertoast.showToast(msg: 'Click delete icon', toastLength: Toast.LENGTH_SHORT);
                  },
                  deleteIcon: const Icon(Icons.remove_circle, size: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        )
    );
  }
}
