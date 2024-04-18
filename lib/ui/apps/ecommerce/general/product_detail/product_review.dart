import 'package:devkitflutter/config/apps/ecommerce/constant.dart';
import 'package:devkitflutter/config/apps/ecommerce/global_style.dart';
import 'package:devkitflutter/model/apps/ecommerce/review_model.dart';
import 'package:devkitflutter/ui/apps/ecommerce/reusable_widget.dart';
import 'package:flutter/material.dart';

class ProductReviewPage extends StatefulWidget {
  const ProductReviewPage({super.key});

  @override
  State<ProductReviewPage> createState() => _ProductReviewPageState();
}

class _ProductReviewPageState extends State<ProductReviewPage> {
  // initialize reusable widget
  final _reusableWidget = ReusableWidget();

  List<String> starList = ['All Review', '1', '2', '3', '4', '5'];
  int starIndex = 0;

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
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: GlobalStyle.appBarIconThemeColor,
          ),
          elevation: GlobalStyle.appBarElevation,
          title: const Text(
            'Product Review',
            style: GlobalStyle.appBarTitle,
          ),
          backgroundColor: GlobalStyle.appBarBackgroundColor,
          systemOverlayStyle: GlobalStyle.appBarSystemOverlayStyle,
          bottom: _reusableWidget.bottomAppBar(),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(starList.length, (index) {
                  return radioStar(starList[index], index);
                }),
              ),
            ),
            const SizedBox(height: 16),
            ListView.builder(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemCount: reviewData.length,
              // Add one more item for progress indicator
              itemBuilder: (BuildContext context, int index) {
                return _buildReviewCard(index);
              },
            ),
          ],
        )
    );
  }

  Widget radioStar(String txt, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          starIndex = index;
        });
      },
      child: Container(
          padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
          margin: const EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
              color: starIndex == index ? softBlue : Colors.white,
              border: Border.all(
                  width: 1,
                  color: starIndex == index ? softBlue : Colors.grey[300]!),
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          child: index == 0
              ? Text(txt, style: TextStyle(color: starIndex == index ? Colors.white : charcoal))
              : Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text(txt, style: TextStyle(color: starIndex == index ? Colors.white : charcoal)),
              const SizedBox(width: 2),
              Icon(Icons.star, color: starIndex == index ? Colors.white : Colors.yellow[700], size: 12),
            ],
          )),
    );
  }

  Widget _buildReviewCard(index){
    return Card(
      margin: const EdgeInsets.only(top: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 2,
      color: Colors.white,
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(reviewData[index].date, style: const TextStyle(fontSize: 13, color: softGrey)),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(reviewData[index].name, style: const TextStyle(
                    fontSize: 14, fontWeight: FontWeight.bold
                )),
                _reusableWidget.createRatingBar(rating: reviewData[index].rating, size: 12)
              ],
            ),
            const SizedBox(height: 4),
            Text(reviewData[index].review)
          ],
        ),
      ),
    );
  }
}
