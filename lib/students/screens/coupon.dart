import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_smart_home_ui/provider/coupons_provider.dart';
import 'package:flutter_smart_home_ui/provider/meal_data.dart';
import 'package:provider/provider.dart';

class ConfirmationCoupon extends StatefulWidget {
  static const routeName = '/confirmation-coupon';
  
  @override
  _ConfirmationCouponState createState() => _ConfirmationCouponState();
}

class _ConfirmationCouponState extends State<ConfirmationCoupon> {
  bool _onPress = false;
  @override
  Widget build(BuildContext context) {
    final couponData = Provider.of<Coupons>(context).items;
    
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(icon: Icon(Icons.arrow_back_sharp)
          ,onPressed: (){
            Provider.of<MealDesData>(context, listen: false).clearCart();
            Navigator.of(context).pop();
            Navigator.of(context).pop();
          },),
          title: Text(
            'Order Confirmation',
          ),
        ),
        body: Center(
            child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                top: 45,
              ),
              child: Text(
                'Order Confirmed!!',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              height: MediaQuery.of(context).size.height * 0.35,
              width: MediaQuery.of(context).size.width * 0.55,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://p.kindpng.com/picc/s/405-4059088_icon-transparent-background-green-check-mark-hd-png.png'))),
            ),
            Container(
              margin: EdgeInsets.only(top: 35),
              decoration:
                  BoxDecoration(border: Border.all(color: Color(0xff00001a))),
              child: Column(
                children:<Widget> [
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20, top: 15),
                    child: RaisedButton(
                      color: _onPress?Colors.green : Colors.grey[400],
                      onPressed: () {
                        setState(() {
                          _onPress = true;
                        });
                      },
                      
                      child: Text(
                      
                        'Coupon Code: ${couponData[couponData.length-1].couponNumber}',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5, bottom: 15),
                    child: Text(
                      'Date: ${couponData[couponData.length-1].date}',
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        )));
  }
}
