import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/ui/reusable/cache_image_network.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class ChipWidgetPage extends StatefulWidget {
  const ChipWidgetPage({super.key});

  @override
  State<ChipWidgetPage> createState() => _ChipWidgetPageState();
}

class _ChipWidgetPageState extends State<ChipWidgetPage> {
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
            _globalWidget.createDetailWidget2(
                title: 'Chip Widget',
                desc: 'Chip Widget usually used for labeling, tags, choises, etc.',
                icon: Icons.label
            ),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                const Chip(
                  label: Text('Example 1')
                ),
                const Chip(
                  label: Text('Example 2', style: TextStyle(
                      color: Colors.white
                  )),
                  backgroundColor: Colors.pinkAccent,
                ),
                const Chip(
                  label: Text('Example 3', style: TextStyle(
                      color: Colors.white
                  )),
                  padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                  backgroundColor: Colors.pinkAccent,
                ),
                const Chip(
                  label: Text('Example 4', style: TextStyle(
                      color: Colors.white
                  )),
                  backgroundColor: Colors.pinkAccent,
                  elevation: 10,
                ),
                const Chip(
                  label: Text('Example 5', style: TextStyle(
                      color: Colors.white
                  )),
                  backgroundColor: Colors.pinkAccent,
                  elevation: 10,
                  shadowColor: Colors.yellow,
                ),
                Chip(
                  label: const Text('Example 6', style: TextStyle(
                      color: Colors.white
                  )),
                  backgroundColor: Colors.pinkAccent,
                  avatar: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: buildCacheNetworkImage(url: '$globalUrl/category/otomotif.png'),
                  ),
                ),
                const Chip(
                  label: Text('Example 7', style: TextStyle(
                      color: Colors.white
                  )),
                  backgroundColor: Colors.pinkAccent,
                  avatar: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Text('A'),
                  ),
                ),
                Chip(
                  label: const Text('Example 8', style: TextStyle(
                      color: Colors.white, fontSize: 26
                  )),
                  padding: const EdgeInsets.all(8),
                  backgroundColor: Colors.pinkAccent,
                  avatar: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: buildCacheNetworkImage(url: '$globalUrl/category/otomotif.png'),
                  ),
                ),
                Chip(
                  label: const Text('Example 9', style: TextStyle(
                      color: Colors.white
                  )),
                  backgroundColor: Colors.pinkAccent,
                  avatar: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: buildCacheNetworkImage(url: '$globalUrl/category/otomotif.png'),
                  ),
                  onDeleted: () {
                    debugPrint('input chip when onDeleted');
                  },
                  deleteIconColor: Colors.white,
                ),
                Chip(
                  label: const Text('Example 10', style: TextStyle(
                      color: Colors.white
                  )),
                  elevation: 5,
                  backgroundColor: Colors.pinkAccent,
                  avatar: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: buildCacheNetworkImage(url: '$globalUrl/category/otomotif.png'),
                  ),
                  onDeleted: () {
                    debugPrint('input chip when onDeleted');
                  },
                  deleteIconColor: Colors.white,
                  deleteIcon: const Icon(Icons.delete),
                ),
              ],
            )
          ],
        )
    );
  }
}
