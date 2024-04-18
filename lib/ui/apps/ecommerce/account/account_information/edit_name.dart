import 'package:devkitflutter/config/apps/ecommerce/constant.dart';
import 'package:devkitflutter/config/apps/ecommerce/global_style.dart';
import 'package:devkitflutter/ui/apps/ecommerce/reusable_widget.dart';
import 'package:flutter/material.dart';

class EditNamePage extends StatefulWidget {
  const EditNamePage({super.key});

  @override
  State<EditNamePage> createState() => _EditNamePageState();
}

class _EditNamePageState extends State<EditNamePage> {
  // initialize reusable widget
  final _reusableWidget = ReusableWidget();

  TextEditingController _etName = TextEditingController();

  @override
  void initState() {
    _etName = TextEditingController(text: 'Robert Steven');
    super.initState();
  }

  @override
  void dispose() {
    _etName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: GlobalStyle.appBarIconThemeColor,
          ),
          elevation: GlobalStyle.appBarElevation,
          title: const Text(
            'Edit Name',
            style: GlobalStyle.appBarTitle,
          ),
          backgroundColor: GlobalStyle.appBarBackgroundColor,
          systemOverlayStyle: GlobalStyle.appBarSystemOverlayStyle,
          bottom: _reusableWidget.bottomAppBar(),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextField(
              controller: _etName,
              decoration: const InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide:
                      BorderSide(color: primaryColor, width: 2.0)),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFCCCCCC)),
                  ),
                  labelText: 'Name',
                  labelStyle:
                  TextStyle(color: blackGrey)),
            ),
            const SizedBox(
              height: 40,
            ),
            TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) => primaryColor,
                  ),
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3.0),
                      )
                  ),
                ),
                onPressed: () {
                  _reusableWidget.startLoading(context, 'Edit Name Success', 1);
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.0),
                  child: Text(
                    'Save',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                )
            ),
          ],
        )
    );
  }
}
