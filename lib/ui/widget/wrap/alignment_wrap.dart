import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class AlignmentWrapPage extends StatefulWidget {
  const AlignmentWrapPage({super.key});

  @override
  State<AlignmentWrapPage> createState() => _AlignmentWrapPageState();
}

class _AlignmentWrapPageState extends State<AlignmentWrapPage> {
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
                  title: 'Alignment Wrap',
                  desc: 'This is the example of wrap with alignment'
              ),
              Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const Text('Align left', style: TextStyle(color: softBlue))
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: const Wrap(
                  spacing: 8,
                  alignment: WrapAlignment.start,
                  children: [
                    Text('aaa'),
                    Text('bbb'),
                    Text('ccc'),
                    Text('ddd'),
                    Text('eee'),
                    Text('fff'),
                    Text('ggg'),
                    Text('hhh'),
                    Text('iii'),
                    Text('jjj'),
                    Text('kkk'),
                    Text('lll'),
                    Text('mmm'),
                    Text('nnn'),
                    Text('ooo'),
                    Text('ppp'),
                    Text('qqq'),
                    Text('rrr'),
                    Text('sss'),
                    Text('ttt'),
                    Text('uuu'),
                    Text('vvv'),
                    Text('www'),
                    Text('111'),
                    Text('222'),
                    Text('333'),
                  ],
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text('Align center', style: TextStyle(color: softBlue))
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: const Wrap(
                  spacing: 8,
                  alignment: WrapAlignment.center,
                  children: [
                    Text('aaa'),
                    Text('bbb'),
                    Text('ccc'),
                    Text('ddd'),
                    Text('eee'),
                    Text('fff'),
                    Text('ggg'),
                    Text('hhh'),
                    Text('iii'),
                    Text('jjj'),
                    Text('kkk'),
                    Text('lll'),
                    Text('mmm'),
                    Text('nnn'),
                    Text('ooo'),
                    Text('ppp'),
                    Text('qqq'),
                    Text('rrr'),
                    Text('sss'),
                    Text('ttt'),
                    Text('uuu'),
                    Text('vvv'),
                    Text('www'),
                    Text('111'),
                    Text('222'),
                    Text('333'),
                  ],
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text('Align right', style: TextStyle(color: softBlue))
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: const Wrap(
                  spacing: 8,
                  alignment: WrapAlignment.end,
                  children: [
                    Text('aaa'),
                    Text('bbb'),
                    Text('ccc'),
                    Text('ddd'),
                    Text('eee'),
                    Text('fff'),
                    Text('ggg'),
                    Text('hhh'),
                    Text('iii'),
                    Text('jjj'),
                    Text('kkk'),
                    Text('lll'),
                    Text('mmm'),
                    Text('nnn'),
                    Text('ooo'),
                    Text('ppp'),
                    Text('qqq'),
                    Text('rrr'),
                    Text('sss'),
                    Text('ttt'),
                    Text('uuu'),
                    Text('vvv'),
                    Text('www'),
                    Text('111'),
                    Text('222'),
                    Text('333'),
                  ],
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text('Align center & give same space left right at all widget', style: TextStyle(color: softBlue))
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: const Wrap(
                  spacing: 8,
                  alignment: WrapAlignment.spaceAround,
                  children: [
                    Text('aaa'),
                    Text('bbb'),
                    Text('ccc'),
                    Text('ddd'),
                    Text('eee'),
                    Text('fff'),
                    Text('ggg'),
                    Text('hhh'),
                    Text('iii'),
                    Text('jjj'),
                    Text('kkk'),
                    Text('lll'),
                    Text('mmm'),
                    Text('nnn'),
                    Text('ooo'),
                    Text('ppp'),
                    Text('qqq'),
                    Text('rrr'),
                    Text('sss'),
                    Text('ttt'),
                    Text('uuu'),
                    Text('vvv'),
                    Text('www'),
                    Text('111'),
                    Text('222'),
                    Text('333'),
                  ],
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text('Align center & give same space between the middle widget', style: TextStyle(color: softBlue))
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: const Wrap(
                  spacing: 8,
                  alignment: WrapAlignment.spaceBetween,
                  children: [
                    Text('aaa'),
                    Text('bbb'),
                    Text('ccc'),
                    Text('ddd'),
                    Text('eee'),
                    Text('fff'),
                    Text('ggg'),
                    Text('hhh'),
                    Text('iii'),
                    Text('jjj'),
                    Text('kkk'),
                    Text('lll'),
                    Text('mmm'),
                    Text('nnn'),
                    Text('ooo'),
                    Text('ppp'),
                    Text('qqq'),
                    Text('rrr'),
                    Text('sss'),
                    Text('ttt'),
                    Text('uuu'),
                    Text('vvv'),
                    Text('www'),
                    Text('111'),
                    Text('222'),
                    Text('333'),
                  ],
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text('Align center & give same space in every widget', style: TextStyle(color: softBlue))
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: const Wrap(
                  spacing: 8,
                  alignment: WrapAlignment.spaceEvenly,
                  children: [
                    Text('aaa'),
                    Text('bbb'),
                    Text('ccc'),
                    Text('ddd'),
                    Text('eee'),
                    Text('fff'),
                    Text('ggg'),
                    Text('hhh'),
                    Text('iii'),
                    Text('jjj'),
                    Text('kkk'),
                    Text('lll'),
                    Text('mmm'),
                    Text('nnn'),
                    Text('ooo'),
                    Text('ppp'),
                    Text('qqq'),
                    Text('rrr'),
                    Text('sss'),
                    Text('ttt'),
                    Text('uuu'),
                    Text('vvv'),
                    Text('www'),
                    Text('111'),
                    Text('222'),
                    Text('333'),
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }
}
