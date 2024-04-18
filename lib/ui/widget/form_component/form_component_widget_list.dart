import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:devkitflutter/ui/widget/form_component/button_widget.dart';
import 'package:devkitflutter/ui/widget/form_component/checkbox_widget.dart';
import 'package:devkitflutter/ui/widget/form_component/date_picker_widget.dart';
import 'package:devkitflutter/ui/widget/form_component/dropdown_widget.dart';
import 'package:devkitflutter/ui/widget/form_component/radio_button_widget.dart';
import 'package:devkitflutter/ui/widget/form_component/slider_widget.dart';
import 'package:devkitflutter/ui/widget/form_component/switch_widget.dart';
import 'package:devkitflutter/ui/widget/form_component/text_field_widget.dart';
import 'package:devkitflutter/ui/widget/form_component/time_picker_widget.dart';
import 'package:devkitflutter/ui/widget/form_component/toggle_button_widget.dart';
import 'package:flutter/material.dart';

class FormComponentWidgetListPage extends StatefulWidget {
  const FormComponentWidgetListPage({super.key});

  @override
  State<FormComponentWidgetListPage> createState() =>
      _FormComponentWidgetListPageState();
}

class _FormComponentWidgetListPageState
    extends State<FormComponentWidgetListPage> {
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
        body: ListView(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
          children: [
            const Text('Form Component Widget',
                style: TextStyle(
                    fontSize: 18, color: black21, fontWeight: FontWeight.w500)),
            Container(
              margin: const EdgeInsets.only(top: 24),
              child: Row(
                children: [
                  const Flexible(
                      flex: 5,
                      child: Text(
                          'Form component usually used to manipulated data.',
                          style: TextStyle(
                              fontSize: 15,
                              color: black77,
                              letterSpacing: 0.5))),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: const Icon(Icons.list_alt,
                              size: 50, color: softBlue)))
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 48),
              child: const Text('List',
                  style: TextStyle(
                      fontSize: 18,
                      color: black21,
                      fontWeight: FontWeight.w500)),
            ),
            const SizedBox(height: 18),
            _globalWidget.screenDetailList(
                context: context,
                title: 'TextField',
                page: const TextFieldWidgetPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Checkbox',
                page: const CheckboxWidgetPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'RadioButton',
                page: const RadioButtonWidgetPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'DropdownButton',
                page: const DropdownButtonWidgetPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Button',
                page: const ButtonWidgetPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Slider',
                page: const SliderWidgetPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Switch',
                page: const SwitchWidgetPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'ToggleButton',
                page: const ToggleButtonWidgetPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'DatePicker',
                page: const DatePickerWidgetPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'TimePicker',
                page: const TimePickerWidgetPage()),
          ],
        ));
  }
}
