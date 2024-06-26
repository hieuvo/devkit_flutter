// Don't forget to initialize all bloc provider at main.dart

import 'package:devkitflutter/bloc/student/bloc.dart';
import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/ui/reusable/global_function.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddDataPage extends StatefulWidget {
  const AddDataPage({super.key});

  @override
  State<AddDataPage> createState() => _AddDataPageState();
}

class _AddDataPageState extends State<AddDataPage> {
  // initialize global widget and global function
  final _globalWidget = GlobalWidget();
  final _globalFunction = GlobalFunction();

  late StudentBloc _studentBloc;
  CancelToken apiToken = CancelToken(); // used to cancel fetch data from API

  final Color _underlineColor = const Color(0xFFCCCCCC);
  final Color _mainColor = Colors.blue;
  final Color _color1 = const Color(0xFF515151);
  final Color _color2 = const Color(0xff777777);

  final TextEditingController _etStudentName = TextEditingController();
  final TextEditingController _etStudentPhoneNumber = TextEditingController();
  final TextEditingController _etStudentAddress = TextEditingController();

  final List<bool> _isSelectGender = [true, false];

  @override
  void initState() {
    _studentBloc = BlocProvider.of<StudentBloc>(context);
    super.initState();
  }

  @override
  void dispose() {
    apiToken.cancel("cancelled"); // cancel fetch data from API
    _etStudentName.dispose();
    _etStudentPhoneNumber.dispose();
    _etStudentAddress.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: _globalWidget.globalAppBar(),
        body: BlocListener<StudentBloc, StudentState>(
          listener: (context, state) {
            if(state is StudentErrorValidation) {
              Fluttertoast.showToast(msg: state.errorMessage, toastLength: Toast.LENGTH_SHORT, backgroundColor: Colors.red, textColor: Colors.white, fontSize: 13);
            }
            if(state is AddStudentWaiting) {
              FocusScope.of(context).unfocus();
              _globalFunction.showProgressDialog(context);
            }
            if(state is AddStudentError){
              Navigator.pop(context);
              Fluttertoast.showToast(msg: state.errorMessage, toastLength: Toast.LENGTH_SHORT, backgroundColor: Colors.red, textColor: Colors.white, fontSize: 13);
            }
          },
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              const Text('Add Data', style: TextStyle(
                  fontSize: 18, color: black21, fontWeight: FontWeight.w500
              )),
              TextFormField(
                controller: _etStudentName,
                keyboardType: TextInputType.text,
                style: TextStyle(color: _color1),
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: _mainColor, width: 2.0)),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: _underlineColor),
                  ),
                  labelText: 'Student Name',
                  labelStyle: TextStyle(color: _color2),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _etStudentPhoneNumber,
                keyboardType: TextInputType.phone,
                style: TextStyle(color: _color1),
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: _mainColor, width: 2.0)),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: _underlineColor),
                  ),
                  labelText: 'Student Phone Number',
                  labelStyle: TextStyle(color: _color2),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 16),
                child: Text('Gender', style: TextStyle(
                  fontSize: 16, color: Colors.grey[600]
                )),
              ),
              ToggleButtons(
                color: Colors.grey,
                selectedColor: Colors.white,
                fillColor: Colors.cyan,
                selectedBorderColor: Colors.cyan,
                borderRadius: BorderRadius.circular(4),
                onPressed: (int index) {
                  setState(() {
                    for (int buttonIndex = 0; buttonIndex < _isSelectGender.length; buttonIndex++) {
                      if (buttonIndex == index) {
                        _isSelectGender[buttonIndex] = true;
                      } else {
                        _isSelectGender[buttonIndex] = false;
                      }
                    }
                  });
                },
                isSelected: _isSelectGender,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    child: const Text('Male')
                  ),
                  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      child: const Text('Female')
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: _etStudentAddress,
                maxLines: null,
                decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: _mainColor, width: 2.0)),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: _underlineColor),
                    ),
                    labelText: 'Student Address',
                    labelStyle: TextStyle(color: _color2)),
              ),
              const SizedBox(height: 40),
              _globalWidget.createButton(
                  buttonName: 'ADD STUDENT',
                  onPressed: (){
                    _studentBloc.add(AddStudent(sessionId: '5f0e6bfbafe255.00218389', studentName: _etStudentName.text, studentPhoneNumber: _etStudentPhoneNumber.text, studentGender: _isSelectGender[0]?'male':'female', studentAddress: _etStudentAddress.text, apiToken: apiToken));
                  }
              ),
            ],
          ),
        )
    );
  }
}
