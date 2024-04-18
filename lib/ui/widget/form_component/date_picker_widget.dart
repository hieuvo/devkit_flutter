import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class DatePickerWidgetPage extends StatefulWidget {
  const DatePickerWidgetPage({super.key});

  @override
  State<DatePickerWidgetPage> createState() => _DatePickerWidgetPageState();
}

class _DatePickerWidgetPageState extends State<DatePickerWidgetPage> {
  // initialize global widget
  final _globalWidget = GlobalWidget();
  DateTime _selectedDate = DateTime.now(), initialDate = DateTime.now();
  TextEditingController _etDate = TextEditingController();

  @override
  void initState() {
    _etDate = TextEditingController(text: _selectedDate.toLocal().toString().split(' ')[0]);
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
                  title: 'DatePicker Widget',
                  desc: 'This is the example of DatePicker'
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: const Text('Standart DatePicker from 2019 to 2025'),
              ),
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: IconButton(
                      onPressed: (){
                        _selectDate(context);
                      },
                      icon: const Icon(
                          Icons.date_range
                      )
                  )
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: const Text('Change text of calendar'),
              ),
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: IconButton(
                      onPressed: (){
                        _selectDate2(context);
                      },
                      icon: const Icon(
                          Icons.date_range
                      )
                  )
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: const Text('DatePicker with min date < 3 month and max date today + 7 days'),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: TextField(
                  controller: _etDate,
                  readOnly: true,
                  onTap: () {
                    _selectDateWithMinMaxDate(context);
                  },
                  maxLines: 1,
                  cursorColor: Colors.grey[600],
                  style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  decoration: InputDecoration(
                    isDense: true,
                    suffixIcon: const Icon(Icons.date_range, color: Colors.pinkAccent),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey[600]!),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey[600]!),
                    ),
                    labelText: '',
                    contentPadding: const EdgeInsets.only(bottom: 2),
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }

  Future<Null> _selectDate(BuildContext context) async {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
  }

  Future<Null> _selectDate2(BuildContext context) async {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
      helpText: 'Select booking date', // Can be used as title
      cancelText: 'Not now',
      confirmText: 'Book',
    );
  }

  Future<Null> _selectDateWithMinMaxDate(BuildContext context) async {
    var firstDate = DateTime(initialDate.year, initialDate.month - 3, initialDate.day);
    var lastDate = DateTime(initialDate.year, initialDate.month, initialDate.day + 7);
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: firstDate,
      lastDate: lastDate,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.pinkAccent,
            colorScheme: const ColorScheme.light(primary: Colors.pinkAccent, secondary: Colors.pinkAccent),
            buttonTheme: const ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _etDate = TextEditingController(
            text: _selectedDate.toLocal().toString().split(' ')[0]);
      });
    }
  }
}
