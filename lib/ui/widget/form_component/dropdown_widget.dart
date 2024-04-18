import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class DropdownButtonWidgetPage extends StatefulWidget {
  const DropdownButtonWidgetPage({super.key});

  @override
  State<DropdownButtonWidgetPage> createState() => _DropdownButtonWidgetPageState();
}

class _DropdownButtonWidgetPageState extends State<DropdownButtonWidgetPage> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  String? _valYear;
  String? _valScroll;
  final List _yearList = [
    "2019",
    "2020",
    "2021",
    "2022",
    "2023",
    "2024",
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
                  title: 'DropdownButton Widget',
                  desc: 'This is the example of DropdownButton'
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: DropdownButton<String>(
                  hint: const Text("Select Year"),
                  value: _valYear,
                  items: _yearList.map((value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      _valYear = value!;
                    });
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: DropdownButton(
                  hint: const Text("Option value with scroll"),
                  icon: const Icon(Icons.keyboard_arrow_down),
                  underline: Container(
                    height: 4,
                    color: Colors.deepPurpleAccent,
                  ),
                  value: _valScroll,
                  items: List.generate(50, (index){
                    return DropdownMenuItem(
                      value: (index+1).toString(),
                      child: Text((index+1).toString()),
                    );
                  }),
                  onChanged: (String? value) {
                    setState(() {
                      _valScroll = value!;
                    });
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    hint: const Text("Select Year"),
                    value: _valYear,
                    items: _yearList.map((value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        _valYear = value!;
                      });
                    },
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: Card(
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        hint: const Text("Select Year"),
                        value: _valYear,
                        items: _yearList.map((value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          setState(() {
                            _valYear = value!;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: Card(
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        isExpanded: true,
                        hint: const Text("Select Year"),
                        value: _valYear,
                        items: _yearList.map((value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          setState(() {
                            _valYear = value!;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: Card(
                  color: Colors.pinkAccent,
                  elevation: 5,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        icon: const Icon(Icons.keyboard_arrow_down),
                        dropdownColor: Colors.pinkAccent,
                        iconEnabledColor: Colors.white,
                        hint: const Text("Select Year", style: TextStyle(color: Colors.white)),
                        value: _valYear,
                        items: _yearList.map((value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value, style: const TextStyle(color: Colors.white)),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          setState(() {
                            _valYear = value!;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: DropdownButton<String>(
                  hint: const Text("Select Year"),
                  icon: const Icon(Icons.calendar_today),
                  value: _valYear,
                  items: _yearList.map((value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      _valYear = value!;
                    });
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: DropdownButton<String>(
                  hint: const Text("Select Year"),
                  icon: const Icon(Icons.calendar_today),
                  isExpanded: true,
                  iconEnabledColor: Colors.red,
                  value: _valYear,
                  items: _yearList.map((value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      _valYear = value!;
                    });
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: DropdownButton<String>(
                  hint: const Text("Select Year"),
                  dropdownColor: Colors.purpleAccent,
                  value: _valYear,
                  items: _yearList.map((value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      _valYear = value!;
                    });
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: Container(
                  width: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.pinkAccent,
                  ),
                  child: DropdownButtonFormField<String>(
                    dropdownColor: Colors.pinkAccent,
                    iconEnabledColor: Colors.white,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none
                      ),
                    ),
                    hint: const Text("Select Year", style: TextStyle(color: Colors.white)),
                    value: _valYear,
                    items: _yearList.map((value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value, style: const TextStyle(color: Colors.white)),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        _valYear = value!;
                      });
                    },
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  hint: const Text("Select Year"),
                  value: _valYear,
                  items: _yearList.map((value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      _valYear = value!;
                    });
                  },
                ),
              ),
            ],
          ),
        )
    );
  }
}
