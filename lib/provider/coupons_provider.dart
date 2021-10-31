import 'dart:convert';

import '../students/screens/coupon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_home_ui/Models/meals_defination.dart';
import '../Models/coupons_defination.dart';
import 'package:http/http.dart' as http;

class Coupons with ChangeNotifier{
  List<CouponDescription> _items = [];
  List<CouponDescription> _fetchitems = [];
  List<CouponDescription> get items {
    return [..._items];
  }
  List<CouponDescription> get fetchitems {
    return [..._fetchitems];
  }
  void deleteCoupon() async{
    final url = 'https://i2it-canteen-default-rtdb.firebaseio.com/coupons.json';
    await http.delete(Uri.parse(url)).then((value) => _items = []);

  }
void createCoupon(Map<String, dynamic> listData, int couponNo) async{
  
  final url = 'https://i2it-canteen-default-rtdb.firebaseio.com/coupons.json';
  print(url);
  try  {
    final trial = CouponDescription(title: DateTime.now().toString() + _items.length.toString(), 
     date: DateTime.now().day.toString() +'/'+ DateTime.now().month.toString() + '/' + DateTime.now().year.toString(),
      id:DateTime.now().toString(),
      cartOrdersid: listData,
      couponNumber: couponNo  );
    await http.post(Uri.parse(url),
          body: json.encode({
            
            'id': trial.id,
            'cartOrders': trial.cartOrdersid,
            'title': trial.title,
            'date': trial.date,
            'isClicked': false,
            'couponNumber': trial.couponNumber,

            
          }));
          _items.add(trial);
          notifyListeners();
  } catch (e) {
    throw(e);
  }
  try {
      
    } catch (error) {
      throw (error);
    }
  // _items.add(CouponDescription(
  //   date: DateTime.now().day.toString() +'/'+ DateTime.now().month.toString() + '/' + DateTime.now().year.toString(),
  //   id: DateTime.now().toString(),
  //   title: DateTime.now().toString() + _items.length.toString(),
  //   ));
}
Future<void> fetchCoupons() async{
  final url = 'https://i2it-canteen-default-rtdb.firebaseio.com/coupons.json';
  
  try {
    final response = await http.get(Uri.parse(url));
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      // print(extractedData.keys);
      final List<CouponDescription> loadedMeals = [];
      extractedData.forEach((prodId, prodData){
        loadedMeals.add(CouponDescription(
          couponNumber: prodData['couponNumber'],
          date: prodData['date'],
          id: prodId,
          cartOrdersid: prodData['cartOrders'],
          title: prodData['title'],
          isClicked: prodData['isClicked']
        ));
      });
      _fetchitems = loadedMeals;
      notifyListeners();
  } catch (e) {
    throw(e);
  }
} 

}
