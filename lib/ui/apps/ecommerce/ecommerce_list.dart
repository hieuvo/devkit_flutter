import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/model/apps/ecommerce/category_model.dart';
import 'package:devkitflutter/model/apps/ecommerce/coupon_model.dart';
import 'package:devkitflutter/model/apps/ecommerce/recomended_product_model.dart';
import 'package:devkitflutter/model/apps/ecommerce/shopping_cart_model.dart';
import 'package:devkitflutter/ui/apps/ecommerce/account/about.dart';
import 'package:devkitflutter/ui/apps/ecommerce/account/account_information/account_information.dart';
import 'package:devkitflutter/ui/apps/ecommerce/account/account_information/edit_email.dart';
import 'package:devkitflutter/ui/apps/ecommerce/account/account_information/edit_name.dart';
import 'package:devkitflutter/ui/apps/ecommerce/account/account_information/edit_phone_number.dart';
import 'package:devkitflutter/ui/apps/ecommerce/account/last_seen_product.dart';
import 'package:devkitflutter/ui/apps/ecommerce/account/notification_setting.dart';
import 'package:devkitflutter/ui/apps/ecommerce/account/order/order_detail.dart';
import 'package:devkitflutter/ui/apps/ecommerce/account/order/order_list.dart';
import 'package:devkitflutter/ui/apps/ecommerce/account/order/order_status.dart';
import 'package:devkitflutter/ui/apps/ecommerce/account/payment_method/add_payment_method.dart';
import 'package:devkitflutter/ui/apps/ecommerce/account/payment_method/edit_payment_method.dart';
import 'package:devkitflutter/ui/apps/ecommerce/account/payment_method/payment_method.dart';
import 'package:devkitflutter/ui/apps/ecommerce/account/privacy_policy.dart';
import 'package:devkitflutter/ui/apps/ecommerce/account/set_address/add_address.dart';
import 'package:devkitflutter/ui/apps/ecommerce/account/set_address/edit_address.dart';
import 'package:devkitflutter/ui/apps/ecommerce/account/set_address/set_address.dart';
import 'package:devkitflutter/ui/apps/ecommerce/account/terms_conditions.dart';
import 'package:devkitflutter/ui/apps/ecommerce/authentication/forgot_password.dart';
import 'package:devkitflutter/ui/apps/ecommerce/authentication/signin.dart';
import 'package:devkitflutter/ui/apps/ecommerce/authentication/signup.dart';
import 'package:devkitflutter/ui/apps/ecommerce/general/chat_us.dart';
import 'package:devkitflutter/ui/apps/ecommerce/general/notification.dart';
import 'package:devkitflutter/ui/apps/ecommerce/general/product_detail/delivery_estimated.dart';
import 'package:devkitflutter/ui/apps/ecommerce/general/product_detail/product_description.dart';
import 'package:devkitflutter/ui/apps/ecommerce/general/product_detail/product_detail.dart';
import 'package:devkitflutter/ui/apps/ecommerce/general/product_detail/product_review.dart';
import 'package:devkitflutter/ui/apps/ecommerce/home.dart';
import 'package:devkitflutter/ui/apps/ecommerce/home/coupon.dart';
import 'package:devkitflutter/ui/apps/ecommerce/home/flashsale.dart';
import 'package:devkitflutter/ui/apps/ecommerce/home/last_search.dart';
import 'package:devkitflutter/ui/apps/ecommerce/home/product_category.dart';
import 'package:devkitflutter/ui/apps/ecommerce/home/search.dart';
import 'package:devkitflutter/ui/apps/ecommerce/home/search_product.dart';
import 'package:devkitflutter/ui/apps/ecommerce/onboarding.dart';
import 'package:devkitflutter/ui/apps/ecommerce/shopping_cart/change_address.dart';
import 'package:devkitflutter/ui/apps/ecommerce/shopping_cart/delivery.dart';
import 'package:devkitflutter/ui/apps/ecommerce/shopping_cart/payment.dart';
import 'package:devkitflutter/ui/apps/ecommerce/splash_screen.dart';
import 'package:devkitflutter/ui/apps/ecommerce/home/coupon_detail.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class EcommerceListPage extends StatefulWidget {
  const EcommerceListPage({super.key});

  @override
  State<EcommerceListPage> createState() => _EcommerceListPageState();
}

class _EcommerceListPageState extends State<EcommerceListPage> {
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
            const Text('E-Commerce',
                style: TextStyle(
                    fontSize: 18, color: black21, fontWeight: FontWeight.w500)),
            Container(
              margin: const EdgeInsets.only(top: 24),
              child: Row(
                children: [
                  const Flexible(
                      flex: 5,
                      child: Text(
                          'E-Commerce apps used for online shop services.',
                          style: TextStyle(
                              fontSize: 15,
                              color: black77,
                              letterSpacing: 0.5))),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: const Icon(Icons.shopping_cart,
                              size: 50, color: softBlue)))
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 48),
              child: const Text('Screen List',
                  style: TextStyle(
                      fontSize: 18,
                      color: black21,
                      fontWeight: FontWeight.w500)),
            ),
            const SizedBox(height: 18),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Splash Screen',
                page: const SplashScreenPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'On Boarding',
                page: const OnBoardingPage()),
            _globalWidget.screenDetailList(
                context: context, title: 'Sign In', page: const SigninPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Sign Up',
                page: const SignupPage(
                  fromList: true,
                )),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Forgot Password',
                page: const ForgotPasswordPage()),
            _globalWidget.screenDetailList(
                context: context, title: 'Home', page: const HomePage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Home Tab (Product Category)',
                page: ProductCategoryPage(
                    categoryId: categoryData[0].id,
                    categoryName: categoryData[0].name)),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Home Tab (Search)',
                page: const SearchPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Home Tab (Search Product)',
                page: const SearchProductPage(words: 'adidas')),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Home Tab (Flash Sale)',
                page: const FlashSalePage(seconds: 1800)),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Home Tab (Coupon)',
                page: const CouponPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Home Tab (Coupon Detail)',
                page: CouponDetailPage(
                    couponData: couponData[0], fromList: true)),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Home Tab (Last Search)',
                page: const LastSearchPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Shopping Cart Tab (Delivery)',
                page: DeliveryPage(shoppingCartData: shoppingCartData)),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Shopping Cart Tab (Change Address)',
                page: const ChangeAddressPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Shopping Cart Tab (Payment)',
                page: const PaymentPage(fromList: true)),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Account (Account Information)',
                page: const AccountInformationPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Account (Edit Name)',
                page: const EditNamePage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Account (Edit Email)',
                page: const EditEmailPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Account (Edit Phone Number)',
                page: const EditPhoneNumberPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Account (Set Address for Delivery)',
                page: const SetAddressPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Account (Add Address)',
                page: const AddAddressPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Account (Edit Address)',
                page: const EditAddressPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Account (Order List)',
                page: const OrderListPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Account (Order Detail)',
                page: const OrderDetailPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Account (Order Status)',
                page: const OrderStatusPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Account (Payment Method)',
                page: const PaymentMethodPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Account (Add Payment Method)',
                page: const AddPaymentMethodPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Account (Edit Payment Method)',
                page: const EditPaymentMethodPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Account (Last Seen Product)',
                page: const LastSeenProductPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Account (Notification Setting)',
                page: const NotificationSettingPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Account (About)',
                page: const AboutPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Account (Privacy Policy)',
                page: const PrivacyPolicyPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Account (Terms and Conditions)',
                page: const TermsConditionsPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'General (Chat Us)',
                page: const ChatUsPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'General (Notification)',
                page: const NotificationPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'General (Product Detail)',
                page: ProductDetailPage(
                    name: recomendedProductData[17].name,
                    image: recomendedProductData[17].image,
                    price: recomendedProductData[17].price,
                    rating: recomendedProductData[17].rating,
                    review: recomendedProductData[17].review,
                    sale: recomendedProductData[17].sale)),
            _globalWidget.screenDetailList(
                context: context,
                title: 'General (Product Description)',
                page: ProductDescriptionPage(
                    name: recomendedProductData[17].name,
                    image: recomendedProductData[17].image)),
            _globalWidget.screenDetailList(
                context: context,
                title: 'General (Delivery Estimated)',
                page: const DeliveryEstimatedPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'General (Product Review)',
                page: const ProductReviewPage()),
          ],
        ));
  }
}
