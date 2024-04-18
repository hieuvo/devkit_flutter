import 'package:flutter/cupertino.dart';

class CupertinoPageScaffoldPage extends StatefulWidget {
  const CupertinoPageScaffoldPage({super.key});

  @override
  State<CupertinoPageScaffoldPage> createState() => _CupertinoPageScaffoldPageState();
}

class _CupertinoPageScaffoldPageState extends State<CupertinoPageScaffoldPage> {
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
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: GestureDetector(
            child: const Icon(CupertinoIcons.back),
            onTap: (){
              Navigator.pop(context);
            },
          ),
          middle: const Text('Scaffold Example'),
        ),
        child: const SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('This is the example of Cupertino Page Scaffold. This is the example of Cupertino Page Scaffold. This is the example of Cupertino Page Scaffold. This is the example of Cupertino Page Scaffold. This is the example of Cupertino Page Scaffold.'),
            )
        ),
      ),
    );
  }
}
