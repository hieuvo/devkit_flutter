import 'package:devkitflutter/config/apps/ecommerce/constant.dart';
import 'package:devkitflutter/config/apps/ecommerce/global_style.dart';
import 'package:devkitflutter/model/apps/ecommerce/chat_model.dart';
import 'package:devkitflutter/ui/apps/ecommerce/reusable_widget.dart';
import 'package:devkitflutter/ui/reusable/cache_image_network.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatUsPage extends StatefulWidget {
  const ChatUsPage({super.key});

  @override
  State<ChatUsPage> createState() => _ChatUsPageState();
}

class _ChatUsPageState extends State<ChatUsPage> {
  // initialize reusable widget
  final _reusableWidget = ReusableWidget();

  final TextEditingController _etChat = TextEditingController();

  String _lastDate = '13 Sep 2019';

  final List<ChatModel> _chatList = [];
  List<ChatModel> _chatListReversed = [];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _initForLang();
    });

    super.initState();
  }

  void _initForLang() {
    setState(() {
      // set chat dummy data
      _chatList.add(ChatModel(1, null, 'date', '9 Sep 2019', null, null));
      _chatList
          .add(ChatModel(2, 'buyer', 'text', 'Good morning', '13:59', true));
      _chatList.add(ChatModel(3, 'buyer', 'image',
          '$globalUrl/apps/ecommerce/product/80.jpg', null, null));
      _chatList.add(ChatModel(4, 'buyer', 'text',
          'I want to ask about the samsung tv product', '13:59', true));
      _chatList.add(ChatModel(5, 'buyer', 'text',
          'Is the Samsung LED TV 32 Inch is still on sale ?', '14:01', true));
      _chatList.add(ChatModel(6, 'seller', 'text',
          'Hello, thank you for contacting us', '14:18', true));
      _chatList.add(ChatModel(
          7,
          'seller',
          'text',
          'We are sorry, but the promotion for Samsung LED TV 32 Inch has ended. Don\'t forget to turn on notification setting for promotion so you will get the news about our product',
          '14:20',
          null));
      _chatList.add(ChatModel(8, 'buyer', 'text',
          'Ok, thank you for your information.', '14:22', true));
      _chatList.add(ChatModel(9, null, 'date', '13 Sep 2019', null, null));
      _chatList.add(ChatModel(10, 'buyer', 'image',
          '$globalUrl/apps/ecommerce/product/21.jpg', null, null));
      _chatList.add(ChatModel(
          11,
          'buyer',
          'text',
          'Hi, is Adidas Polo Shirt size L is ready ? For the black color.',
          '08:58',
          true));
      _chatList.add(ChatModel(
          12, 'buyer', 'text', 'I want to order for 2 pcs.', '09:00', true));
      _chatList.add(ChatModel(
          13,
          'buyer',
          'text',
          'And can I change it if the size doesn\'t fit my body?',
          '09:00',
          true));
      _chatList.add(ChatModel(
          14,
          'seller',
          'text',
          'Hello, good morning. The product is ready and you can change if the size is not fit your body',
          '09:14',
          null));

      // reverse the list
      _chatListReversed = _chatList.reversed.toList();
    });
  }

  @override
  void dispose() {
    _etChat.dispose();
    super.dispose();
  }

  void _addDate(String currentDate) {
    _chatListReversed.insert(
        0, ChatModel(15, null, 'date', currentDate, null, null));
  }

  void _addMessage(String message) {
    DateTime now = DateTime.now();
    String currentTime = DateFormat('kk:mm').format(now);
    _chatListReversed.insert(
        0, ChatModel(16, 'buyer', 'text', message, currentTime, false));
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
            'Chat',
            style: GlobalStyle.appBarTitle,
          ),
          backgroundColor: GlobalStyle.appBarBackgroundColor,
          systemOverlayStyle: GlobalStyle.appBarSystemOverlayStyle,
          bottom: _reusableWidget.bottomAppBar(),
        ),
        body: PopScope(
          canPop: true,
          child: Column(
            children: [
              Flexible(
                child: ListView.builder(
                  reverse: true,
                  itemCount: _chatListReversed.length,
                  padding: const EdgeInsets.all(16),
                  itemBuilder: (context, index) {
                    if (_chatListReversed[index].getTextImageDate == 'date') {
                      return _buildDate(_chatListReversed[index].getMessage);
                    } else if (_chatListReversed[index].getTextImageDate ==
                        'image') {
                      return _buildImage(_chatListReversed[index].getMessage);
                    } else {
                      if (_chatListReversed[index].getType == 'buyer') {
                        return _buildChatBuyer(
                            _chatListReversed[index].getMessage,
                            _chatListReversed[index].getDate!,
                            _chatListReversed[index].getRead!);
                      } else {
                        return _buildChatSeller(
                            _chatListReversed[index].getMessage,
                            _chatListReversed[index].getDate!);
                      }
                    }
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Flexible(
                      child: TextFormField(
                        controller: _etChat,
                        minLines: 1,
                        maxLines: 4,
                        textAlignVertical: TextAlignVertical.bottom,
                        style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                        onChanged: (textValue) {
                          setState(() {});
                        },
                        decoration: InputDecoration(
                          fillColor: Colors.grey[200],
                          filled: true,
                          hintText: 'Write Message',
                          focusedBorder: UnderlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5.0)),
                              borderSide: BorderSide(color: Colors.grey[200]!)),
                          enabledBorder: UnderlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5.0)),
                            borderSide: BorderSide(color: Colors.grey[200]!),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (_etChat.text != '') {
                          //debugPrint('send message : ${_etChat.text}');
                          setState(() {
                            DateTime now = DateTime.now();
                            String currentDate =
                                DateFormat('d MMM yyyy').format(now);
                            if (_lastDate != currentDate) {
                              _lastDate = currentDate;
                              _addDate(currentDate);
                            }
                            _addMessage(_etChat.text);
                            _etChat.text = '';
                          });
                        }
                      },
                      child: ClipOval(
                        child: Container(
                            color: softBlue,
                            padding: const EdgeInsets.all(10),
                            child: const Icon(Icons.send, color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }

  Widget _buildDate(String date) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Center(
        child:
            Text(date, style: const TextStyle(color: softGrey, fontSize: 11)),
      ),
    );
  }

  Widget _buildChatBuyer(String message, String time, bool read) {
    final double boxChatSize = MediaQuery.of(context).size.width / 1.3;
    return Container(
      margin: const EdgeInsets.only(top: 4),
      child: Wrap(
        alignment: WrapAlignment.end,
        children: [
          Container(
            constraints: BoxConstraints(maxWidth: boxChatSize),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey[300]!),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(5),
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(12),
                ),
                color: Colors.grey[300]),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Text(message, style: const TextStyle(color: charcoal)),
                ),
                Wrap(
                  children: [
                    const SizedBox(width: 4),
                    Icon(Icons.done_all,
                        color: read == true ? primaryColor : softGrey,
                        size: 11),
                    const SizedBox(width: 2),
                    Text(time,
                        style: const TextStyle(color: softGrey, fontSize: 9)),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChatSeller(String message, String date) {
    final double boxChatSize = MediaQuery.of(context).size.width / 1.3;
    return Container(
      margin: const EdgeInsets.only(top: 4),
      child: Wrap(
        children: [
          Container(
              constraints: BoxConstraints(maxWidth: boxChatSize),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey[300]!),
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(5),
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(5),
                  )),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child:
                        Text(message, style: const TextStyle(color: charcoal)),
                  ),
                  Wrap(
                    children: [
                      const SizedBox(width: 2),
                      Text(date,
                          style:
                              const TextStyle(color: softGrey, fontSize: 9)),
                    ],
                  )
                ],
              )),
        ],
      ),
    );
  }

  Widget _buildImage(String imageUrl) {
    final double boxChatSize = MediaQuery.of(context).size.width / 1.3;
    final double boxImageSize = (MediaQuery.of(context).size.width / 6);
    return Container(
      margin: const EdgeInsets.only(top: 4),
      child: Wrap(
        alignment: WrapAlignment.end,
        children: [
          Container(
            constraints: BoxConstraints(maxWidth: boxChatSize),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey[300]!),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(5),
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(12),
                )),
            child: SizedBox(
              width: boxImageSize,
              height: boxImageSize,
              child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  child: buildCacheNetworkImage(
                      width: boxImageSize,
                      height: boxImageSize,
                      url: imageUrl)),
            ),
          ),
        ],
      ),
    );
  }
}
