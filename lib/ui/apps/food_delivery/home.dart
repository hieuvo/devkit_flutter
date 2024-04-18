import 'package:carousel_slider/carousel_slider.dart';
import 'package:devkitflutter/config/apps/food_delivery/constant.dart';
import 'package:devkitflutter/config/apps/food_delivery/global_style.dart';
import 'package:devkitflutter/ui/apps/food_delivery/detail_food.dart';
import 'package:devkitflutter/ui/apps/food_delivery/detail_restaurant.dart';
import 'package:devkitflutter/ui/apps/food_delivery/order_history.dart';
import 'package:devkitflutter/ui/apps/food_delivery/reusable_widget.dart';
import 'package:devkitflutter/model/feature/banner_slider_model.dart';
import 'package:devkitflutter/model/feature/category_model.dart';
import 'package:devkitflutter/model/apps/food_delivery/food_model.dart';
import 'package:devkitflutter/model/apps/food_delivery/restaurant_model.dart';
import 'package:devkitflutter/ui/apps/food_delivery/category_menu.dart';
import 'package:devkitflutter/ui/apps/food_delivery/coupon.dart';
import 'package:devkitflutter/ui/apps/food_delivery/favorites_food_list.dart';
import 'package:devkitflutter/ui/apps/food_delivery/search_restaurant.dart';
import 'package:devkitflutter/ui/reusable/cache_image_network.dart';
import 'package:devkitflutter/ui/reusable/global_function.dart';
import 'package:devkitflutter/ui/apps/food_delivery/food_list.dart';
import 'package:devkitflutter/ui/apps/food_delivery/restaurant_list.dart';
import 'package:devkitflutter/ui/apps/food_delivery/user_profile.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // initialize global function and reusable widget
  final _globalFunction = GlobalFunction();
  final _reusableWidget = ReusableWidget();

  int _currentImageSlider = 0;
  final List<BannerSliderModel> _bannerData = [];
  final List<CategoryModel> _categoryData = [];
  List<RestaurantModel> _nearbyFoodData = [];
  List<RestaurantModel> _orderAgainData = [];
  List<FoodModel> _foodDiscountData = [];
  List<RestaurantModel> _moreRestaurantData = [];

  final List<String> _addressData = [];
  String _address = 'Home Address';

  @override
  void initState() {
    _getData();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _getData() {
    _addressData.add('Home Address');
    _addressData.add('Office Address');
    _addressData.add('Apartment Address');
    _addressData.add('Mom Address');

    /*
    Banner Data Information
    width = 800px
    height = 320px
     */
    _bannerData.add(BannerSliderModel(
        id: 1, image: '$globalUrl/apps/food_delivery/home_banner/1.jpg'));
    _bannerData.add(BannerSliderModel(
        id: 2, image: '$globalUrl/apps/food_delivery/home_banner/2.jpg'));
    _bannerData.add(BannerSliderModel(
        id: 3, image: '$globalUrl/apps/food_delivery/home_banner/3.jpg'));
    _bannerData.add(BannerSliderModel(
        id: 4, image: '$globalUrl/apps/food_delivery/home_banner/4.jpg'));

    /*
    Image Information
    width = 110px
    height = 110px
     */
    _categoryData.add(CategoryModel(
        id: 1,
        name: 'Nearby',
        image: '$globalUrl/apps/food_delivery/category/nearby.png'));
    _categoryData.add(CategoryModel(
        id: 2,
        name: 'Western Food',
        image: '$globalUrl/apps/food_delivery/category/western.png'));
    _categoryData.add(CategoryModel(
        id: 3,
        name: 'Eastern Food',
        image: '$globalUrl/apps/food_delivery/category/eastern.png'));
    _categoryData.add(CategoryModel(
        id: 4,
        name: 'Healthy Food',
        image: '$globalUrl/apps/food_delivery/category/health.png'));
    _categoryData.add(CategoryModel(
        id: 5,
        name: 'Coffee',
        image: '$globalUrl/apps/food_delivery/category/coffee.png'));
    _categoryData.add(CategoryModel(
        id: 6,
        name: 'New Comers',
        image: '$globalUrl/apps/food_delivery/category/new.png'));
    _categoryData.add(CategoryModel(
        id: 7,
        name: 'Best Sellers',
        image: '$globalUrl/apps/food_delivery/category/best.png'));
    _categoryData.add(CategoryModel(
        id: 8,
        name: 'All Foods',
        image: '$globalUrl/apps/food_delivery/category/all.png'));

    /*
    Image Information
    width = 800px
    height = 600px
    ratio width height = 4:3
     */
    _nearbyFoodData = [
      RestaurantModel(
          id: 1,
          name: "Mr. Hungry",
          tag: "Chicken, Rice",
          image: "$globalUrl/apps/food_delivery/food/1.jpg",
          rating: 4.9,
          distance: 0.4,
          promo: '50% Off | Get Gift Voucher If You Buy 4 pcs',
          location: "Crown Street"),
      RestaurantModel(
          id: 2,
          name: "Beef Lovers",
          tag: "Beef, Yakiniku, Japanese Food",
          image: "$globalUrl/apps/food_delivery/food/2.jpg",
          rating: 5,
          distance: 0.6,
          promo: 'Buy 1 Get 1',
          location: "Montgomery Street"),
      RestaurantModel(
          id: 3,
          name: "Salad Stop",
          tag: "Healthy Food, Salad",
          image: "$globalUrl/apps/food_delivery/food/3.jpg",
          rating: 4.3,
          distance: 0.7,
          promo: '',
          location: "Empire Boulevard"),
      RestaurantModel(
          id: 4,
          name: "Steam Boat Lovers",
          tag: "Hot, Fresh, Steam",
          image: "$globalUrl/apps/food_delivery/food/4.jpg",
          rating: 4.9,
          distance: 0.7,
          promo: '20% Off',
          location: "Lefferts Avenue"),
      RestaurantModel(
          id: 5,
          name: "Italian Food",
          tag: "Penne, Western Food",
          image: "$globalUrl/apps/food_delivery/food/5.jpg",
          rating: 4.6,
          distance: 0.9,
          promo: '',
          location: "New York Avenue"),
      RestaurantModel(
          id: 6,
          name: "Bread and Cookies",
          tag: "Bread",
          image: "$globalUrl/apps/food_delivery/food/6.jpg",
          rating: 4.8,
          distance: 0.9,
          promo: '',
          location: "Mapple Street"),
      RestaurantModel(
          id: 7,
          name: "Awesome Health",
          tag: "Salad, Healthy Food, Fresh",
          image: "$globalUrl/apps/food_delivery/food/7.jpg",
          rating: 4.9,
          distance: 1.1,
          promo: '10% Off',
          location: "Fenimore Street"),
      RestaurantModel(
          id: 8,
          name: "Chicken Specialties",
          tag: "Chicken, Rice, Teriyaki",
          image: "$globalUrl/apps/food_delivery/food/8.jpg",
          rating: 4.7,
          distance: 3.9,
          promo: '10% Off',
          location: "Liberty Avenue"),
    ];

    /*
    Image Information
    width = 800px
    height = 600px
    ratio width height = 4:3
     */
    _orderAgainData = [
      RestaurantModel(
          id: 5,
          name: "Italian Food",
          tag: "Penne, Western Food",
          image: "$globalUrl/apps/food_delivery/food/5.jpg",
          rating: 4.6,
          distance: 0.9,
          promo: '',
          location: "New York Avenue"),
      RestaurantModel(
          id: 6,
          name: "Bread and Cookies",
          tag: "Bread",
          image: "$globalUrl/apps/food_delivery/food/6.jpg",
          rating: 4.8,
          distance: 0.9,
          promo: '',
          location: "Mapple Street"),
      RestaurantModel(
          id: 7,
          name: "Awesome Health",
          tag: "Salad, Healthy Food, Fresh",
          image: "$globalUrl/apps/food_delivery/food/7.jpg",
          rating: 4.9,
          distance: 1.1,
          promo: '10% Off',
          location: "Fenimore Street"),
      RestaurantModel(
          id: 8,
          name: "Chicken Specialties",
          tag: "Chicken, Rice, Teriyaki",
          image: "$globalUrl/apps/food_delivery/food/8.jpg",
          rating: 4.7,
          distance: 3.9,
          promo: '10% Off',
          location: "Liberty Avenue"),
      RestaurantModel(
          id: 1,
          name: "Mr. Hungry",
          tag: "Chicken, Rice",
          image: "$globalUrl/apps/food_delivery/food/1.jpg",
          rating: 4.9,
          distance: 0.4,
          promo: '50% Off | Get Gift Voucher If You Buy 4 pcs',
          location: "Crown Street"),
      RestaurantModel(
          id: 2,
          name: "Beef Lovers",
          tag: "Beef, Yakiniku, Japanese Food",
          image: "$globalUrl/apps/food_delivery/food/2.jpg",
          rating: 5,
          distance: 0.6,
          promo: 'Buy 1 Get 1',
          location: "Montgomery Street"),
      RestaurantModel(
          id: 3,
          name: "Salad Stop",
          tag: "Healthy Food, Salad",
          image: "$globalUrl/apps/food_delivery/food/3.jpg",
          rating: 4.3,
          distance: 0.7,
          promo: '',
          location: "Empire Boulevard"),
      RestaurantModel(
          id: 4,
          name: "Steam Boat Lovers",
          tag: "Hot, Fresh, Steam",
          image: "$globalUrl/apps/food_delivery/food/4.jpg",
          rating: 4.9,
          distance: 0.7,
          promo: '20% Off',
          location: "Lefferts Avenue"),
    ];

    /*
    Image Information
    width = 800px
    height = 600px
    ratio width height = 4:3
     */
    _foodDiscountData = [
      FoodModel(
          id: 8,
          restaurantName: "Chicken Specialties",
          name: "Chicken Rice Teriyaki",
          image: "$globalUrl/apps/food_delivery/food/8.jpg",
          price: 5,
          discount: 10,
          location: "Liberty Avenue"),
      FoodModel(
          id: 7,
          restaurantName: "Taco Salad Beef Classic",
          name: "Awesome Health",
          image: "$globalUrl/apps/food_delivery/food/7.jpg",
          price: 4.9,
          discount: 10,
          location: "Fenimore Street"),
      FoodModel(
          id: 6,
          restaurantName: "Bread and Cookies",
          name: "Delicious Croissant",
          image: "$globalUrl/apps/food_delivery/food/6.jpg",
          price: 5,
          discount: 0,
          location: "Mapple Street"),
      FoodModel(
          id: 5,
          restaurantName: "Italian Food",
          name: "Chicken Penne With Tomato",
          image: "$globalUrl/apps/food_delivery/food/5.jpg",
          price: 6.5,
          discount: 20,
          location: "New York Avenue"),
      FoodModel(
          id: 4,
          restaurantName: "Steam Boat Lovers",
          name: "Seafood shabu-shabu",
          image: "$globalUrl/apps/food_delivery/food/4.jpg",
          price: 6,
          discount: 20,
          location: "Lefferts Avenue"),
      FoodModel(
          id: 3,
          restaurantName: "Salad Stop",
          name: "Sesame Salad",
          image: "$globalUrl/apps/food_delivery/food/3.jpg",
          price: 4.8,
          discount: 10,
          location: "Empire Boulevard"),
      FoodModel(
          id: 2,
          restaurantName: "Beef Lovers",
          name: "Beef Yakiniku",
          image: "$globalUrl/apps/food_delivery/food/2.jpg",
          price: 3.6,
          discount: 20,
          location: "Montgomery Street"),
      FoodModel(
          id: 1,
          restaurantName: "Mr. Hungry",
          name: "Hainam Chicken Rice",
          image: "$globalUrl/apps/food_delivery/food/1.jpg",
          price: 5,
          discount: 50,
          location: "Crown Street"),
    ];

    /*
    Image Information
    width = 800px
    height = 600px
    ratio width height = 4:3
     */
    _moreRestaurantData = [
      RestaurantModel(
          id: 2,
          name: "Beef Lovers",
          tag: "Beef, Yakiniku, Japanese Food",
          image: "$globalUrl/apps/food_delivery/food/2.jpg",
          rating: 5,
          distance: 0.6,
          promo: 'Buy 1 Get 1',
          location: "Montgomery Street"),
      RestaurantModel(
          id: 4,
          name: "Steam Boat Lovers",
          tag: "Hot, Fresh, Steam",
          image: "$globalUrl/apps/food_delivery/food/4.jpg",
          rating: 4.9,
          distance: 0.7,
          promo: '20% Off',
          location: "Lefferts Avenue"),
      RestaurantModel(
          id: 6,
          name: "Bread and Cookies",
          tag: "Bread",
          image: "$globalUrl/apps/food_delivery/food/6.jpg",
          rating: 4.8,
          distance: 0.9,
          promo: '',
          location: "Mapple Street"),
      RestaurantModel(
          id: 8,
          name: "Chicken Specialties",
          tag: "Chicken, Rice, Teriyaki",
          image: "$globalUrl/apps/food_delivery/food/8.jpg",
          rating: 4.7,
          distance: 3.9,
          promo: '10% Off',
          location: "Liberty Avenue"),
      RestaurantModel(
          id: 1,
          name: "Mr. Hungry",
          tag: "Chicken, Rice",
          image: "$globalUrl/apps/food_delivery/food/1.jpg",
          rating: 4.9,
          distance: 0.4,
          promo: '50% Off | Get Gift Voucher If You Buy 4 pcs',
          location: "Crown Street"),
      RestaurantModel(
          id: 3,
          name: "Salad Stop",
          tag: "Healthy Food, Salad",
          image: "$globalUrl/apps/food_delivery/food/3.jpg",
          rating: 4.3,
          distance: 0.7,
          promo: '',
          location: "Empire Boulevard"),
      RestaurantModel(
          id: 5,
          name: "Italian Food",
          tag: "Penne, Western Food",
          image: "$globalUrl/apps/food_delivery/food/5.jpg",
          rating: 4.6,
          distance: 0.9,
          promo: '',
          location: "New York Avenue"),
      RestaurantModel(
          id: 7,
          name: "Awesome Health",
          tag: "Salad, Healthy Food, Fresh",
          image: "$globalUrl/apps/food_delivery/food/7.jpg",
          rating: 4.9,
          distance: 1.1,
          promo: '10% Off',
          location: "Fenimore Street"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final double boxImageSize = (MediaQuery.of(context).size.width / 3);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: GlobalStyle.appBarIconThemeColor,
        ),
        systemOverlayStyle: GlobalStyle.appBarSystemOverlayStyle,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('DELIVER TO',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.black)),
            GestureDetector(
              onTap: () {
                showModalBottomSheet<void>(
                  isScrollControlled: true,
                  context: context,
                  builder: (BuildContext context) {
                    return _reusableWidget.showPopup(_address, _addressData,
                        (String newAddress) {
                      setState(() {
                        _address = newAddress;
                      });
                    });
                  },
                );
              },
              child: Row(
                children: [
                  Flexible(
                    child: Text(_address,
                        style:
                            const TextStyle(fontSize: 15, color: Colors.black),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis),
                  ),
                  const Icon(Icons.arrow_drop_down)
                ],
              ),
            ),
          ],
        ),
        backgroundColor: GlobalStyle.appBarBackgroundColor,
        // create search text field in the app bar
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                color: Colors.grey[100]!,
                width: 1.0,
              )),
            ),
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            height: kToolbarHeight,
            child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) => Colors.grey[100]!,
                  ),
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  )),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SearchRestaurantPage()));
                },
                child: Row(
                  children: [
                    const SizedBox(width: 8),
                    Icon(Icons.search, color: Colors.grey[500], size: 18),
                    const SizedBox(width: 8),
                    Text('What are you craving ?',
                        style: TextStyle(
                            color: Colors.grey[500],
                            fontWeight: FontWeight.normal))
                  ],
                )),
          ),
        ),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 16),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FavoritesFoodListPage()));
                },
                child: const Icon(Icons.favorite_border, color: black77),
              )),
          Padding(
              padding: const EdgeInsets.only(right: 16),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const OrderHistoryPage()));
                },
                child: const Icon(Icons.receipt_long_outlined, color: black77),
              )),
          Padding(
              padding: const EdgeInsets.only(right: 16),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const UserProfilePage()));
                },
                child: const Icon(Icons.person, color: black77),
              )),
        ],
      ),
      body: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          _buildHomeBanner(),
          _buildCoupon(),
          const SizedBox(height: 16),
          _buildMenu(),
          _buildNearbyFood(boxImageSize),
          _buildOrderAgain(boxImageSize),
          _buildFood(boxImageSize),
          _buildMoreRestaurant()
        ],
      ),
      floatingActionButton: _reusableWidget.fabCart(context),
    );
  }

  Widget _buildHomeBanner() {
    return Column(
      children: [
        const SizedBox(height: 12),
        CarouselSlider(
          items: _bannerData
              .map((item) => ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    child: buildCacheNetworkImage(
                        url: item.image,
                        width: 0.87 * MediaQuery.of(context).size.width),
                  ))
              .toList(),
          options: CarouselOptions(
              aspectRatio: 2.88,
              viewportFraction: 0.9,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 4),
              autoPlayAnimationDuration: const Duration(milliseconds: 300),
              enlargeCenterPage: false,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentImageSlider = index;
                });
              }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _bannerData.map((item) {
            int index = _bannerData.indexOf(item);
            return AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              width: _currentImageSlider == index ? 8.0 : 4.0,
              height: 4.0,
              margin:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 2.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color:
                    _currentImageSlider == index ? softBlue : Colors.grey[300],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildCoupon() {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const CouponPage()));
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
        decoration: BoxDecoration(
            color: assentColor, borderRadius: BorderRadius.circular(5)),
        child: const Row(
          children: [
            Expanded(
              child: Text(
                'There are 10 food promo waiting',
                style: TextStyle(
                    fontSize: 14,
                    color: Color(0xffffffff),
                    fontWeight: FontWeight.bold),
              ),
            ),
            Icon(Icons.local_offer, color: Colors.white)
          ],
        ),
      ),
    );
  }

  Widget _buildMenu() {
    return GridView.count(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      primary: false,
      childAspectRatio: 1,
      shrinkWrap: true,
      crossAxisSpacing: 0,
      mainAxisSpacing: 0,
      crossAxisCount: 4,
      children: List.generate(_categoryData.length, (index) {
        return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          CategoryMenuPage(title: _categoryData[index].name)));
            },
            child: Column(children: [
              buildCacheNetworkImage(
                  width: 40,
                  height: 40,
                  url: _categoryData[index].image,
                  plColor: Colors.transparent),
              Flexible(
                child: Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Text(
                    _categoryData[index].name,
                    style: const TextStyle(
                      color: black55,
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ]));
      }),
    );
  }

  Widget _buildNearbyFood(boxImageSize) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Food Around You', style: GlobalStyle.horizontalTitle),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RestaurantListPage(
                              title: 'Food Arround You')));
                },
                child: const Text('View All',
                    style: GlobalStyle.viewAll, textAlign: TextAlign.end),
              )
            ],
          ),
        ),
        Container(
            margin: const EdgeInsets.only(top: 8),
            height: boxImageSize * GlobalStyle.cardHeightMultiplication,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              scrollDirection: Axis.horizontal,
              itemCount: _nearbyFoodData.length,
              itemBuilder: (BuildContext context, int index) {
                return _reusableWidget.buildHorizontalListCard(
                    context, _nearbyFoodData[index]);
              },
            )),
      ],
    );
  }

  Widget _buildOrderAgain(boxImageSize) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Order Again', style: GlobalStyle.horizontalTitle),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const RestaurantListPage(title: 'Order Again')));
                },
                child: const Text('View All',
                    style: GlobalStyle.viewAll, textAlign: TextAlign.end),
              )
            ],
          ),
        ),
        Container(
            margin: const EdgeInsets.only(top: 8),
            height: boxImageSize * GlobalStyle.cardHeightMultiplication,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              scrollDirection: Axis.horizontal,
              itemCount: _orderAgainData.length,
              itemBuilder: (BuildContext context, int index) {
                return _reusableWidget.buildHorizontalListCard(
                    context, _orderAgainData[index]);
              },
            )),
      ],
    );
  }

  Widget _buildFood(boxImageSize) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Food on Promotion',
                  style: GlobalStyle.horizontalTitle),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const FoodListPage(title: 'Food on Promotion')));
                },
                child: const Text('View All',
                    style: GlobalStyle.viewAll, textAlign: TextAlign.end),
              )
            ],
          ),
        ),
        Container(
            margin: const EdgeInsets.only(top: 8),
            height: boxImageSize * 1.9,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              scrollDirection: Axis.horizontal,
              itemCount: _foodDiscountData.length,
              itemBuilder: (BuildContext context, int index) {
                return _buildFoodCard(_foodDiscountData[index]);
              },
            )),
      ],
    );
  }

  Widget _buildFoodCard(data) {
    final double imageWidth = (MediaQuery.of(context).size.width / 2.3);
    final double imageheight = (MediaQuery.of(context).size.width / 3.07);
    return SizedBox(
      width: imageWidth,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        elevation: 2,
        color: Colors.white,
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const DetailRestaurantPage()));
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const DetailFoodPage()));
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(6)),
                  child: buildCacheNetworkImage(
                      width: imageWidth, height: imageheight, url: data.image)),
              Container(
                margin: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 36,
                      child: Text(data.name,
                          style: GlobalStyle.cardTitle,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis),
                    ),
                    const SizedBox(height: 6),
                    Text(data.restaurantName + ' - ' + data.location,
                        style: GlobalStyle.textRestaurantNameSmall,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Text(
                            '\$ ${_globalFunction.removeDecimalZeroFormat(((100 - data.discount) * data.price / 100))}',
                            style: GlobalStyle.textPrice),
                        data.discount != 0
                            ? const SizedBox(width: 6)
                            : const SizedBox.shrink(),
                        data.discount != 0
                            ? Text(
                                '\$ ${_globalFunction.removeDecimalZeroFormat(data.price)}',
                                style: GlobalStyle.textPriceLineThrough)
                            : const SizedBox.shrink()
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMoreRestaurant() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
          child:
              const Text('More Restaurant', style: GlobalStyle.horizontalTitle),
        ),
        Container(
            margin: const EdgeInsets.only(top: 4),
            child: ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: _moreRestaurantData.length,
              padding: const EdgeInsets.symmetric(vertical: 0),
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return _reusableWidget.buildRestaurantList(
                    context, index, _moreRestaurantData);
              },
            )),
      ],
    );
  }
}
