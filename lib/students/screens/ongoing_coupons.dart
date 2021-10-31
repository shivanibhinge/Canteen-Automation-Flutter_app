import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_smart_home_ui/Models/coupons_defination.dart';
import 'package:flutter_smart_home_ui/provider/coupons_provider.dart';
import 'package:provider/provider.dart';
import '../widgets/student_drawer.dart';

class OngoingCoupons extends StatefulWidget {
  static const routeName='/ongoing_coupons';

  @override
  _OngoingCouponsState createState() => _OngoingCouponsState();
}

class _OngoingCouponsState extends State<OngoingCoupons> {
  void  generateRandomNumber() {

 var random = new Random();

    // Printing Random Number between 1 to 100 on Terminal Window.
    print(random.nextInt(100));

}
  @override
    void didChangeDependencies() {
      // TODO: implement didChangeDependencies
      Provider.of<Coupons>(context).fetchCoupons();
      super.didChangeDependencies();
    }
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
    final id = routeArgs['id'];
    final couponData = Provider.of<Coupons>(context).fetchitems;
    return Scaffold(
      drawer: StudentDrawer(
        currentUserId: id.toString(),
      ),
      appBar: AppBar(
        title: Text(
          'Your Coupons',
        ),
      ),
      body: ListView.builder(itemCount: couponData.length, itemBuilder: (context, index) => 
        Card(
          child: ListTile(
            leading: 
             Icon(
                Icons.card_giftcard,
                color: Colors.black,
                size: 40,
              ),
            title: Column(
              children: [
                Row(
                  children: [
                    Container(
                      child: Text(
                        'Coupon Code: ${couponData[index].couponNumber.toString()}',
                      ),
                      
                    ),
                    Spacer(),
                    Container(
                      child: Text(
                        'Quantity',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
            subtitle: Row(
              children: [
                Container(
                  child: Text(
                    couponData[index].cartOrdersid.keys.toString(),
                  ),
                ),
                Spacer(),
                Container(
                  child: Text(
              couponData[index].cartOrdersid.values.toString(),
            ),)
              ],
            ),
            ),
        ),
        )
        );
      
    
  }
}
//couponData[index].title,