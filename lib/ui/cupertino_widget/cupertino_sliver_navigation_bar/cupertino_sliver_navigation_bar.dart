import 'package:flutter/cupertino.dart';

class CupertinoSliverNavigationBarPage extends StatefulWidget {
  const CupertinoSliverNavigationBarPage({super.key});

  @override
  State<CupertinoSliverNavigationBarPage> createState() => _CupertinoSliverNavigationBarPageState();
}

class _CupertinoSliverNavigationBarPageState extends State<CupertinoSliverNavigationBarPage> {
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
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled){
            return [
              CupertinoSliverNavigationBar(
                padding: EdgeInsetsDirectional.zero,
                largeTitle: const Text('Sliver'),
                leading: CupertinoButton(
                  padding: EdgeInsets.zero,
                  child: const Icon(CupertinoIcons.add, size: 28),
                  onPressed: (){

                  },
                ),
                trailing: CupertinoButton(
                  padding: EdgeInsets.zero,
                  child: const Icon(CupertinoIcons.search),
                  onPressed: (){

                  },
                ),
              )
            ];
          },
          body: CupertinoScrollbar(
            child: ListView(
              padding: const EdgeInsets.all(8),
              children: List.generate(100, (index) {
                return Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('index $index'),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
