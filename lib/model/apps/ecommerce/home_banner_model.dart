import 'package:devkitflutter/config/apps/ecommerce/constant.dart';

class HomeBannerModel {
  late int id;
  late String image;

  HomeBannerModel({required this.id, required this.image});
}

/*
Banner Data Information
width = 800px
height = 600px
 */
List<HomeBannerModel> homeBannerData =[
  HomeBannerModel(id: 1, image: '$globalUrl/apps/ecommerce/home_banner/1.jpg'),
  HomeBannerModel(id: 2, image: '$globalUrl/apps/ecommerce/home_banner/2.jpg'),
  HomeBannerModel(id: 3, image: '$globalUrl/apps/ecommerce/home_banner/3.jpg'),
  HomeBannerModel(id: 4, image: '$globalUrl/apps/ecommerce/home_banner/4.jpg'),
  HomeBannerModel(id: 5, image: '$globalUrl/apps/ecommerce/home_banner/5.jpg'),
];