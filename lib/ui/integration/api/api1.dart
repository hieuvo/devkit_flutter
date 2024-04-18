// Don't forget to initialize all bloc provider at main.dart

import 'package:devkitflutter/bloc/example/bloc.dart';
import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Api1Page extends StatefulWidget {
  const Api1Page({super.key});

  @override
  State<Api1Page> createState() => _Api1PageState();
}

class _Api1PageState extends State<Api1Page> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  late ExampleBloc _exampleBloc;
  CancelToken apiToken = CancelToken(); // used to cancel fetch data from API

  String _data = 'data will be appear here';

  @override
  void initState() {
    _exampleBloc = BlocProvider.of<ExampleBloc>(context);
    super.initState();
  }

  @override
  void dispose() {
    apiToken.cancel("cancelled"); // cancel fetch data from API
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _globalWidget.globalAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: _globalWidget.createDetailWidget(
                  title: 'API 1 (GET Method)',
                  desc: 'This is the example of get data from API using GET Method'
              ),
            ),
            Container(
                child: _globalWidget.createButton(
                    buttonName: 'Get Data',
                    onPressed: (){
                      _exampleBloc.add(GetExample(apiToken: apiToken));
                    }
                ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: const Text('Data :', style: TextStyle(
                  fontSize: 18, color: black21, fontWeight: FontWeight.w500
              )),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: BlocListener<ExampleBloc, ExampleState>(
                listener: (context, state) {
                  if(state is ExampleError) {
                    Fluttertoast.showToast(msg: 'error occured', toastLength: Toast.LENGTH_SHORT);
                  }
                  if(state is GetExampleSuccess) {
                    _data = state.exampleData;
                  }
                },
                child: BlocBuilder<ExampleBloc, ExampleState>(
                  builder: (context, state) {
                    if(state is ExampleError) {
                      return const Text('error occured');
                    } else if(state is ExampleWaiting) {
                      return const Text('waiting...');
                    } else {
                      return Text(_data);
                    }
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
