class ProductListviewModel {
  late int id;
  late String name;
  late double price;
  late String image;
  late double rating;
  late int review;
  late int sale;
  late String location;

  ProductListviewModel({required this.id, required this.name, required this.price, required this.image, required this.rating, required this.review, required this.sale, required this.location});

  ProductListviewModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'].toDouble();
    image = json['image'];
    rating = json['rating'].toDouble();
    review = json['review'];
    sale = json['sale'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['image'] = image;
    data['rating'] = rating;
    data['review'] = review;
    data['sale'] = sale;
    data['location'] = location;
    return data;
  }
}
