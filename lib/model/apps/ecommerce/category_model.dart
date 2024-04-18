import 'package:devkitflutter/config/apps/ecommerce/constant.dart';

class CategoryModel {
  late int id;
  late String name;
  late String image;

  CategoryModel({required this.id, required this.name, required this.image});
}

/*
Category Data Information
width = 110px
height = 110px
 */
List<CategoryModel> categoryData =[
  CategoryModel(
    id: 1,
    name: 'Fashion',
    image: '$globalUrl/apps/ecommerce/category/fashion.png',
  ),
  CategoryModel(
    id: 2,
    name: 'Smartphone & Tablets',
    image: '$globalUrl/apps/ecommerce/category/smartphone.png',
  ),
  CategoryModel(
    id: 3,
    name: 'Electronic',
    image: '$globalUrl/apps/ecommerce/category/electronic.png',
  ),
  CategoryModel(
    id: 4,
    name: 'Otomotif',
    image: '$globalUrl/apps/ecommerce/category/otomotif.png',
  ),
  CategoryModel(
    id: 5,
    name: 'Sport',
    image: '$globalUrl/apps/ecommerce/category/sport.png',
  ),
  CategoryModel(
    id: 6,
    name: 'Food',
    image: '$globalUrl/apps/ecommerce/category/food.png',
  ),
  CategoryModel(
    id: 7,
    name: 'Voucher\nGame',
    image: '$globalUrl/apps/ecommerce/category/voucher_game.png',
  ),
  CategoryModel(
    id: 8,
    name: 'Health & Care',
    image: '$globalUrl/apps/ecommerce/category/health.png',
  ),
];