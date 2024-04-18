import 'package:devkitflutter/config/apps/ecommerce/constant.dart';
import 'package:devkitflutter/config/apps/ecommerce/global_style.dart';
import 'package:devkitflutter/model/apps/ecommerce/coupon_model.dart';
import 'package:devkitflutter/ui/apps/ecommerce/home/coupon_detail.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CouponPage extends StatefulWidget {
  const CouponPage({super.key});

  @override
  State<CouponPage> createState() => _CouponPageState();
}

class _CouponPageState extends State<CouponPage> {
  TextEditingController _etSearch = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _etSearch.dispose();
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
            'Coupon',
            style: GlobalStyle.appBarTitle,
          ),
          backgroundColor: GlobalStyle.appBarBackgroundColor,
          systemOverlayStyle: GlobalStyle.appBarSystemOverlayStyle,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                      color: Colors.grey[100]!,
                      width: 1.0,
                    )
                ),
              ),
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
              height: kToolbarHeight,
              child: TextFormField(
                controller: _etSearch,
                textAlignVertical: TextAlignVertical.bottom,
                maxLines: 1,
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                onChanged: (textValue) {
                  setState(() {});
                },
                decoration: InputDecoration(
                  fillColor: Colors.grey[100],
                  filled: true,
                  hintText: 'Enter promo code',
                  prefixIcon: Icon(Icons.search, color: Colors.grey[500]),
                  suffixIcon: (_etSearch.text == '')
                      ? null
                      : GestureDetector(
                      onTap: () {
                        setState(() {
                          _etSearch = TextEditingController(text: '');
                        });
                      },
                      child: Icon(Icons.close, color: Colors.grey[500])),
                  focusedBorder: UnderlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                      borderSide: BorderSide(color: Colors.grey[200]!)),
                  enabledBorder: UnderlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(color: Colors.grey[200]!),
                  ),
                ),
              ),
            ),
          ),
        ),
        body: PopScope(
          canPop: true,
          child: ListView.builder(
            itemCount: couponData.length,
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            physics: const AlwaysScrollableScrollPhysics(),
            // Add one more item for progress indicator
            itemBuilder: (BuildContext context, int index) {
              return _buildCouponCard(couponData[index]);
            },
          ),
        ));
  }

  Widget _buildCouponCard(CouponModel couponData){
    return Card(
      margin: const EdgeInsets.only(top: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      elevation: 2,
      color: Colors.white,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => CouponDetailPage(couponData: couponData)));
        },
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 5),
                padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                decoration: BoxDecoration(
                    color: softBlue,
                    borderRadius: BorderRadius.circular(5)
                ),
                child: const Text('Limited Offer', style: GlobalStyle.couponLimitedOffer),
              ),
              const SizedBox(height: 12),
              Text(couponData.name, style: GlobalStyle.couponName),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GlobalStyle.iconTime,
                      const SizedBox(
                        width: 4,
                      ),
                      Text('Expiring in ${couponData.day} days', style: GlobalStyle.couponExpired),
                    ],
                  ),
                  GestureDetector(
                    onTap: (){
                      Fluttertoast.showToast(msg: 'Coupon applied', toastLength: Toast.LENGTH_LONG);
                      Navigator.pop(context);
                    },
                    child: const Text('Use Now', style: TextStyle(
                        fontSize: 14, color: softBlue, fontWeight: FontWeight.bold
                    )),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
