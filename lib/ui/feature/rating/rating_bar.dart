import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class RatingBarPage extends StatefulWidget {
  const RatingBarPage({super.key});

  @override
  State<RatingBarPage> createState() => _RatingBarPageState();
}

class _RatingBarPageState extends State<RatingBarPage> {
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
                  title: 'Rating Bar',
                  desc: 'This is the example to create rating bar.\n\n'
                      'If decimal number below 0.25, then floor the number.\n'
                      'If decimal number between and equal 0.25 to 0.75, then draw the half star.\n'
                      'If decimal number above 0.75, then ceil the number.\n'
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: _createRatingBar(rating: 5, size: 12),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: _createRatingBar(rating: 1, size: 16),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: _createRatingBar(rating: 3),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: _createRatingBar(rating: 5, size: 40),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: _createRatingBar(rating: 4),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: _createRatingBar(rating: 0),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text('2.1')
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: _createRatingBar(rating: 2.1),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text('2.4')
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: _createRatingBar(rating: 2.4),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text('2.8')
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: _createRatingBar(rating: 2.8),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text('4.8')
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: _createRatingBar(rating: 4.8),
              ),
            ],
          ),
        )
    );
  }

  Widget _createRatingBar({double rating=5, double size=24}){
    if(rating < 0){
      rating = 0;
    } else if(rating>5){
      rating = 5;
    }

    bool absolute = false;
    int fullStar = 0;
    int emptyStar = 0;

    if(rating == 0 || rating == 1 || rating == 2 || rating == 3 || rating == 4 || rating == 5){
      absolute = true;
    } else {
      double dec = (rating - int.parse(rating.toString().substring(0,1)));
      if(dec > 0 && dec < 1){
        if(dec >= 0.25 && dec <= 0.75){
          absolute = false;
        } else {
          absolute = true;
          if(dec < 0.25){
            emptyStar = 1;
          } else if(dec > 0.75){
            fullStar = 1;
          }
        }
      }
    }
    return Row(
      children: [
        for(int i=1;i<=rating+fullStar;i++) Icon(Icons.star, color: Colors.yellow[700], size: size),
        !absolute?Icon(Icons.star_half, color: Colors.yellow[700], size: size):const SizedBox.shrink(),
        for(int i=1;i<=(5-rating+emptyStar);i++) Icon(Icons.star_border, color: Colors.yellow[700], size: size),
      ],
    );
  }
}
