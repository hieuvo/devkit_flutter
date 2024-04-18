import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class FilterChipPage extends StatefulWidget {
  const FilterChipPage({super.key});

  @override
  State<FilterChipPage> createState() => _FilterChipPageState();
}

class _FilterChipPageState extends State<FilterChipPage> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  bool _isSelected1 = false;
  bool _isSelected2 = false;
  bool _isSelected3 = false;

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
                  title: 'Filter Chip',
                  desc: 'This is the example of filter chip'
              ),
              Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const Text('Filter')
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: Wrap(
                  children: [
                    FilterChip(
                      label: const Text('Official Store'),
                      labelStyle: const TextStyle(color: Colors.white),
                      selected: _isSelected1,
                      onSelected: (bool selected) {
                        setState(() {
                          _isSelected1 = !_isSelected1;
                        });
                      },
                      elevation: 0,
                      pressElevation: 0,
                      backgroundColor: Colors.pink[200],
                      selectedColor: Colors.pinkAccent,
                      checkmarkColor: Colors.white,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    FilterChip(
                      label: const Text('Free Delivery'),
                      labelStyle: const TextStyle(color: Colors.white),
                      selected: _isSelected2,
                      onSelected: (bool selected) {
                        setState(() {
                          _isSelected2 = !_isSelected2;
                        });
                      },
                      elevation: 0,
                      pressElevation: 0,
                      backgroundColor: Colors.pink[200],
                      selectedColor: Colors.pinkAccent,
                      checkmarkColor: Colors.white,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    FilterChip(
                      label: const Text('Discount'),
                      labelStyle: const TextStyle(color: Colors.white),
                      selected: _isSelected3,
                      onSelected: (bool selected) {
                        setState(() {
                          _isSelected3 = !_isSelected3;
                        });
                      },
                      elevation: 0,
                      pressElevation: 0,
                      backgroundColor: Colors.pink[200],
                      selectedColor: Colors.pinkAccent,
                      checkmarkColor: Colors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }
}
