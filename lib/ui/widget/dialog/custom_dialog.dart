import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class CustomDialogPage extends StatefulWidget {
  const CustomDialogPage({super.key});

  @override
  State<CustomDialogPage> createState() => _CustomDialogPageState();
}

class _CustomDialogPageState extends State<CustomDialogPage> {
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _globalWidget.createDetailWidget(
                  title: 'Custom Dialog',
                  desc: 'This is the example of custom dialog'
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: _globalWidget.createButton(
                    buttonName: 'Open Dialog',
                    onPressed: (){
                      _showPopup(context);
                    }
                ),
              ),
            ],
          ),
        )
    );
  }

  void _showPopup(BuildContext context) {
    showDialog(context: context,
        builder: (BuildContext context){
          return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              backgroundColor: Colors.transparent,
              child: contentBox(context)
          );
        }
    );
  }

  contentBox(context){
    return Stack(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(left: 20, top: 65, right: 20, bottom: 20),
          margin: const EdgeInsets.only(top: 45),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black,
                    offset: Offset(0,10),
                    blurRadius: 10
                ),
              ]
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text('Title', style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600),),
              const SizedBox(height: 15,),
              const Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit.', style: TextStyle(fontSize: 14),textAlign: TextAlign.center,),
              const SizedBox(height: 22,),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        'Ok',
                        style: TextStyle(fontSize: 18)
                      ),
                    )
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: 20,
          right: 20,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 45,
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(45)),
                child: Image.asset('assets/images/lamp.jpg')
            ),
          ),
        ),
      ],
    );
  }
}
