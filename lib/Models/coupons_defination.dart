import 'package:flutter/foundation.dart';
import './meals_defination.dart';

class CouponDescription{
  final Map<String,dynamic> cartOrdersid;
  final String title;
  final String date;
  final String id;
  final int couponNumber;
  
  bool isClicked;

  CouponDescription(
    {
      
      required this.title,
      required this.date,
      required this.id,
      this.isClicked = false,
      required this.cartOrdersid,
      required this.couponNumber,
    }
  );

}
