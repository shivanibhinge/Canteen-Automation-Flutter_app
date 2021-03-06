import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import '../Models/meals_defination.dart';
import '../Models/admin_earning_defination.dart';
import 'package:http/http.dart' as http;

class MealDesData with ChangeNotifier {
  List<MealData> _items = [
    // MealData(
    //   title: 'Idli',
    //   id: '001',
    //   categories: [
    //     'breakfast',
    //   ],
    //   price: 40,
    //   description:
    //       'Idli are a type of savoury rice cake, originating from the Indian subcontinent popular as breakfast foods in Southern India and in Sri Lanka. 1 bowl chatni, 1 bowl sambhar and 4 pieces of Idli',
    //   time: '7.30 - 11',
    //   iconImage:
    //       // 'https://resize.indiatvnews.com/en/resize/newbucket/715_-/2019/03/breakfast-1553786111.jpg',
    //       // 'https://smedia2.intoday.in/aajtak/images/stories/112015/poha-pakwangali_520_112615053233.jpg',
    //       'https://resize.indiatvnews.com/en/resize/newbucket/715_-/2019/03/breakfast-1553786111.jpg',
    //   // desc: [
    //   //   MealDescription(
    //   //     title: 'Idli',
    //   //     description:'Idli are a type of savoury rice cake, originating from the Indian subcontinent popular as breakfast foods in Southern India and in Sri Lanka. 1 bowl chatni, 1 bowl sambhar and 4 pieces of Idli',
    //   //     price: 40,
    //   //     time: '7.30 - 11',
    //   //      )
    //   // ],
    // ),
    // MealData(
    //   title: 'Pohe',
    //   id: '002',
    //   categories: [
    //     'breakfast',
    //   ],
    //   description: '1 plate pohe ',
    //   price: 20,
    //   time: '7.30 - 11',
    //   iconImage:
    //       'https://smedia2.intoday.in/aajtak/images/stories/112015/poha-pakwangali_520_112615053233.jpg',
    //   // 'https://images.app.goo.gl/oB5fFSvzAg7d7q3d9',
    //   // desc: [
    //   //   MealDescription(
    //   //     title: 'Pohe',
    //   //     description:'1 plate pohe ',
    //   //     price: 20,
    //   //     time: '7.30 - 11',
    //   //      )
    //   // ],
    // ),
    // MealData(
    //   title: 'Sabudana Wada',
    //   id: '003',
    //   categories: [
    //     'breakfast',
    //   ],
    //   description: '1 plate Rava upma with shev and chatni',
    //   price: 30,
    //   time: '7.30 - 11',
    //   iconImage:
    //       'https://www.indianveggiedelight.com/wp-content/uploads/2020/04/Sabudana_vada_deepfry-1.jpg',
    //   // desc: [
    //   //   MealDescription(
    //   //     title: 'Rava Upma',
    //   //     description: '1 plate Rava upma with shev and chatni',
    //   //     price: 30,
    //   //     time: '7.30 - 11',
    //   //      )
    //   // ],
    // ),
    // MealData(
    //   title: 'Misal Pav',
    //   id: '004',
    //   categories: [
    //     'breakfast',
    //   ],
    //   description: '1 plate Rava upma with shev and chatni',
    //   price: 30,
    //   time: '7.30 - 11',
    //   iconImage:
    //       'https://pipingpotcurry.com/wp-content/uploads/2018/06/Misal-Pav-Pressure-Cooker.jpg',
    //   // desc: [
    //   //   MealDescription(
    //   //     title: 'Misal Pav',
    //   //     description: '1 plate Rava upma with shev and chatni',
    //   //     price: 30,
    //   //     time: '7.30 - 11',
    //   //      )
    //   // ],
    // ),
    // MealData(
    //   title: 'Udid Wada',
    //   id: '005',
    //   categories: [
    //     'breakfast',
    //   ],
    //   description: '1 plate Rava upma with shev and chatni',
    //   price: 30,
    //   time: '7.30 - 11',
    //   iconImage:
    //       'https://static2.bigstockphoto.com/1/5/2/large1500/251764444.jpg',
    //   // desc: [
    //   //   MealDescription(
    //   //     title: 'Rava Upma',
    //   //     description: '1 plate Rava upma with shev and chatni',
    //   //     price: 30,
    //   //     time: '7.30 - 11',
    //   //      )
    //   // ],
    // ),
    // MealData(
    //   title: 'Thali ',
    //   id: '006',
    //   categories: [
    //     'Lunch',
    //   ],
    //   description: '1 plate Rava upma with shev and chatni',
    //   price: 30,
    //   time: '12 - 2.30',
    //   iconImage:
    //       'https://images-na.ssl-images-amazon.com/images/I/51crfiIGJRL._AC_SY400_.jpg',
    //   // 'https://www.google.com/imgres?imgurl=https://thumbs.dreamstime.com/b/typical-north-indian-thali-consisting-multiple-bowls-full-vegetables-curries-complete-meal-food-served-hostel-178707854.jpg&imgrefurl=https://www.dreamstime.com/photos-images/indian-thali.html&tbnid=VHKZDOsDbdxKoM&vet=1&docid=IymgacRa_ba7rM&w=800&h=600&source=sh/x/im',
    //   // desc: [
    //   //   MealDescription(
    //   //     title: 'Thali',
    //   //     description: '1 plate Rava upma with shev and chatni',
    //   //     price: 30,
    //   //     time: '12 - 2.30',
    //   //      )
    //   // ],
    // ),
    // MealData(
    //   title: 'Thali ',
    //   id: '007',
    //   categories: [
    //     'Lunch',
    //   ],
    //   description: '1 plate Rava upma with shev and chatni',
    //   price: 30,
    //   time: '12 - 2.30',
    //   iconImage:
    //       'https://live.staticflickr.com/1871/30682664488_18e7c3ffbd_b.jpg',
    //   // 'https://www.google.com/imgres?imgurl=https://thumbs.dreamstime.com/b/typical-north-indian-thali-consisting-multiple-bowls-full-vegetables-curries-complete-meal-food-served-hostel-178707854.jpg&imgrefurl=https://www.dreamstime.com/photos-images/indian-thali.html&tbnid=VHKZDOsDbdxKoM&vet=1&docid=IymgacRa_ba7rM&w=800&h=600&source=sh/x/im',
    //   // desc: [
    //   //   MealDescription(
    //   //     title: 'Thali',
    //   //     description: '1 plate Rava upma with shev and chatni',
    //   //     price: 30,
    //   //     time: '12 - 2.30',
    //   //      )
    //   // ],
    // ),
    // MealData(
    //   title: 'Thali ',
    //   id: '008',
    //   categories: [
    //     'Lunch',
    //   ],
    //   description: '1 plate Rava upma with shev and chatni',
    //   price: 30,
    //   time: '12 - 2.30',
    //   iconImage:
    //       'https://smedia2.intoday.in/indiatoday/images/stories/2017July/railfood3-mos_072617043635.jpg',
    //   // 'https://images-na.ssl-images-amazon.com/images/I/51crfiIGJRL._AC_SY400_.jpg',
    //   // 'https://www.google.com/imgres?imgurl=https://thumbs.dreamstime.com/b/typical-north-indian-thali-consisting-multiple-bowls-full-vegetables-curries-complete-meal-food-served-hostel-178707854.jpg&imgrefurl=https://www.dreamstime.com/photos-images/indian-thali.html&tbnid=VHKZDOsDbdxKoM&vet=1&docid=IymgacRa_ba7rM&w=800&h=600&source=sh/x/im',
    //   // desc: [
    //   //   MealDescription(
    //   //     title: 'Thali',
    //   //     description: '1 plate Rava upma with shev and chatni',
    //   //     price: 30,
    //   //     time: '12 - 2.30',
    //   //      )
    //   // ],
    // ),
    // MealData(
    //   title: 'Small Thali ',
    //   id: '009',
    //   categories: [
    //     'Dinner',
    //   ],
    //   description: '1 plate Rava upma with shev and chatni',
    //   price: 30,
    //   time: '12 - 2.30',
    //   iconImage:
    //       'https://www.holidify.com/images/cmsuploads/compressed/shutterstock_1609322191_20200113173000.jpg',
    //   // 'https://www.google.com/imgres?imgurl=https://imgstaticcontent.lbb.in/lbbnew/wp-content/uploads/sites/2/2016/08/Chaipatty-i.jpg&imgrefurl=https://lbb.in/bangalore/head-to-these-places-in-town-to-celebrate-maggis-comeback-in-bowlfuls/&tbnid=ff617dRPZ6168M&vet=1&docid=Oqvv9g_tPljl6M&w=750&h=500&source=sh/x/im',
    //   // desc: [
    //   //   MealDescription(
    //   //     title: 'Thali',
    //   //     description: '1 plate Rava upma with shev and chatni',
    //   //     price: 30,
    //   //     time: '12 - 2.30',
    //   //      )
    //   // ],
    // ),
    // MealData(
    //   title: 'Small Thali ',
    //   id: '0010',
    //   categories: [
    //     'Dinner',
    //   ],
    //   description: '1 plate Rava upma with shev and chatni',
    //   price: 30,
    //   time: '12 - 2.30',
    //   iconImage:
    //       'https://b.zmtcdn.com/data/pictures/chains/5/18808035/ec802dfec9654beda5aa3d51b15aa4c5.jpg',
    //   // 'https://www.google.com/imgres?imgurl=https://imgstaticcontent.lbb.in/lbbnew/wp-content/uploads/sites/2/2016/08/Chaipatty-i.jpg&imgrefurl=https://lbb.in/bangalore/head-to-these-places-in-town-to-celebrate-maggis-comeback-in-bowlfuls/&tbnid=ff617dRPZ6168M&vet=1&docid=Oqvv9g_tPljl6M&w=750&h=500&source=sh/x/im',
    //   // desc: [
    //   //   MealDescription(
    //   //     title: 'Thali',
    //   //     description: '1 plate Rava upma with shev and chatni',
    //   //     price: 30,
    //   //     time: '12 - 2.30',
    //   //      )
    //   // ],
    // ),
    // MealData(
    //   title: 'Small Thali ',
    //   id: '0011',
    //   categories: [
    //     'Dinner',
    //   ],
    //   description: '1 plate Rava upma with shev and chatni',
    //   price: 30,
    //   time: '12 - 2.30',
    //   iconImage:
    //       'https://media-cdn.tripadvisor.com/media/photo-s/12/b9/68/d1/mvimg-20180303-161330.jpg',
    //   // 'https://www.google.com/imgres?imgurl=https://imgstaticcontent.lbb.in/lbbnew/wp-content/uploads/sites/2/2016/08/Chaipatty-i.jpg&imgrefurl=https://lbb.in/bangalore/head-to-these-places-in-town-to-celebrate-maggis-comeback-in-bowlfuls/&tbnid=ff617dRPZ6168M&vet=1&docid=Oqvv9g_tPljl6M&w=750&h=500&source=sh/x/im',
    //   // desc: [
    //   //   MealDescription(
    //   //     title: 'Thali',
    //   //     description: '1 plate Rava upma with shev and chatni',
    //   //     price: 30,
    //   //     time: '12 - 2.30',
    //   //      )
    //   // ],
    // ),
    // MealData(
    //   title: 'Tea',
    //   id: '0012',
    //   categories: [
    //     'Other',
    //   ],
    //   description: '1 plate Rava upma with shev and chatni',
    //   price: 30,
    //   time: '12 - 2.30',
    //   iconImage:
    //       'https://images-na.ssl-images-amazon.com/images/I/41hlqqfiNHL._SX425_.jpg',
    //   // 'https://www.google.com/imgres?imgurl=https://imgstaticcontent.lbb.in/lbbnew/wp-content/uploads/sites/2/2016/08/Chaipatty-i.jpg&imgrefurl=https://lbb.in/bangalore/head-to-these-places-in-town-to-celebrate-maggis-comeback-in-bowlfuls/&tbnid=ff617dRPZ6168M&vet=1&docid=Oqvv9g_tPljl6M&w=750&h=500&source=sh/x/im',
    //   // desc: [
    //   //   MealDescription(
    //   //     title: 'Maggi',
    //   //     description: '1 plate Rava upma with shev and chatni',
    //   //     price: 30,
    //   //     time: '12 - 2.30',
    //   //      )
    //   // ],
    // ),
    // MealData(
    //   title: 'Maggi ',
    //   id: '0013',
    //   categories: [
    //     'Other',
    //   ],
    //   description: '1 plate Rava upma with shev and chatni',
    //   price: 30,
    //   time: '12 - 2.30',
    //   iconImage:
    //       'https://mypullzone-9vexd6dl53at.netdna-ssl.com/wp-content/uploads/2020/01/Vegetable-Masala-Maggi-Recipe-Step-By-Step-Instructions-scaled.jpg',
    //   // 'https://www.google.com/imgres?imgurl=https://imgstaticcontent.lbb.in/lbbnew/wp-content/uploads/sites/2/2016/08/Chaipatty-i.jpg&imgrefurl=https://lbb.in/bangalore/head-to-these-places-in-town-to-celebrate-maggis-comeback-in-bowlfuls/&tbnid=ff617dRPZ6168M&vet=1&docid=Oqvv9g_tPljl6M&w=750&h=500&source=sh/x/im',
    //   // desc: [
    //   //   MealDescription(
    //   //     title: 'Maggi',
    //   //     description: '1 plate Rava upma with shev and chatni',
    //   //     price: 30,
    //   //     time: '12 - 2.30',
    //   //      )
    //   // ],
    // ),
    // MealData(
    //   title: 'Boiled Egg',
    //   id: '0014',
    //   categories: [
    //     'Other',
    //   ],
    //   description: '1 plate Rava upma with shev and chatni',
    //   price: 30,
    //   time: '12 - 2.30',
    //   iconImage:
    //       'https://feelgoodfoodie.net/wp-content/uploads/2020/01/Air-Fryer-Hard-Boiled-Eggs-6.jpg',
    //   // 'https://www.google.com/imgres?imgurl=https://imgstaticcontent.lbb.in/lbbnew/wp-content/uploads/sites/2/2016/08/Chaipatty-i.jpg&imgrefurl=https://lbb.in/bangalore/head-to-these-places-in-town-to-celebrate-maggis-comeback-in-bowlfuls/&tbnid=ff617dRPZ6168M&vet=1&docid=Oqvv9g_tPljl6M&w=750&h=500&source=sh/x/im',
    //   // desc: [
    //   //   MealDescription(
    //   //     title: 'Maggi',
    //   //     description: '1 plate Rava upma with shev and chatni',
    //   //     price: 30,
    //   //     time: '12 - 2.30',
    //   //      )
    //   // ],
    // ),
    // MealData(
    //   title: 'Sandwich',
    //   id: '0015',
    //   categories: [
    //     'Other',
    //   ],
    //   description: '1 plate Rava upma with shev and chatni',
    //   price: 30,
    //   time: '12 - 2.30',
    //   iconImage: 'https://live.staticflickr.com/34/72274279_ac4254dc68_z.jpg',
    //   // 'https://www.google.com/imgres?imgurl=https://imgstaticcontent.lbb.in/lbbnew/wp-content/uploads/sites/2/2016/08/Chaipatty-i.jpg&imgrefurl=https://lbb.in/bangalore/head-to-these-places-in-town-to-celebrate-maggis-comeback-in-bowlfuls/&tbnid=ff617dRPZ6168M&vet=1&docid=Oqvv9g_tPljl6M&w=750&h=500&source=sh/x/im',
    //   // desc: [
    //   //   MealDescription(
    //   //     title: 'Maggi',
    //   //     description: '1 plate Rava upma with shev and chatni',
    //   //     price: 30,
    //   //     time: '12 - 2.30',
    //   //      )
    //   // ],
    // ),
  ];
  List<AdminEarnings> _adminList = [AdminEarnings(breakfastEarn: 0, lunchEarn: 0, otherEarn: 0, totalEarning: 0, dinnerEarn: 0)];
  List<MealData> get items {
    return [..._items];
  }
  List<AdminEarnings> get admin {
    return [..._adminList];
  }

  Future<void> adminDataPost(AdminEarnings givenData) async{
    final url = 'https://i2it-canteen-default-rtdb.firebaseio.com/admin_earnings/-Mc0h5BEQMWoE2hX85xi.json';
    try {
      http.patch(Uri.parse(url), body: json.encode({
        'totalEarning': givenData.totalEarning,
        'breakfastEarn': givenData.breakfastEarn,
        'lunchEarn': givenData.lunchEarn,
        'dinnerEarn': givenData.dinnerEarn,
        'otherEarn': givenData.otherEarn,
      }) );
    } catch (e) {
    }
  }

  // void getTotalValue(){

  // }

  Future<void> studentFetchData() async {
    final url = 'https://i2it-canteen-default-rtdb.firebaseio.com/meals.json';
    try {
      final response = await http.get(Uri.parse(url));
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      // print(extractedData.keys);
      final List<MealData> loadedMeals = [];
      _items = [];
      extractedData.forEach((prodId, prodData) {
        if (prodData['isSelected'] == true) {
          loadedMeals.add(MealData(
            id: prodId,
            title: prodData["title"],
            description: prodData["description"],
            price: prodData["price"],
            iconImage: File(prodData["iconImage"]),
            categories: prodData["categories"].toString().toLowerCase(),
            toTime: prodData["toTime"],
            fromTime: prodData["fromTime"],
            isCart: prodData["isCart"],
            isSelected: prodData['isSelected'],
            counter: prodData["counter"],
          ));
        }
        // print(prodData['categories']);
      });
      _items.clear();
      // for (var i = 0; i < loadedMeals.length; i++) {
      //   if (loadedMeals[i].isSelected) {
      //     try {
      //       // ignore: unused_local_variable
      //       var alreadyItem =
      //           _items.indexWhere((element) => element.id == loadedMeals[i].id);
      //       loadedMeals.removeAt(alreadyItem);
      //     } catch (e) {
      //       _items.add(loadedMeals[i]);
      //     }
      //   }
      // }
      _items = loadedMeals;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }

  List<MealData> getCategoryMeal(String category) {
    List<MealData> _trial = [];
    for (var i = 0; i < _items.length; i++) {
      if (_items[i].categories == category) {
        _trial.add(_items[i]);
      }
    }
    return _trial;
  }

  

  Future<void> changeSelected(String id) async {
    var currentIndex = _items.indexWhere((element) => element.id == id);
    if (currentIndex >= 0) {
      final url =
          'https://i2it-canteen-default-rtdb.firebaseio.com/meals/$id.json';
      return await http
          .patch(Uri.parse(url),
              body: json.encode({
                'isSelected':
                    !_items.firstWhere((element) => element.id == id).isSelected
              }))
          .then((value) {
        _items[currentIndex] = _items.firstWhere((element) => element.id == id);
        notifyListeners();
      });
    } else {
      print('kuch bhi');
    }
    notifyListeners();
  }

  Future<void> adminfetchData() async{
    final url = 'https://i2it-canteen-default-rtdb.firebaseio.com/admin_earnings.json';
    try {
      final response = await http.get(Uri.parse(url));
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
       //print(extractedData.keys);
      final List<AdminEarnings> loadedMeals = [];

      extractedData.forEach((prodId, prodData) {
         
          loadedMeals.add(AdminEarnings(
            totalEarning: prodData['totalEarning'],
             breakfastEarn:  prodData['breakfastEarn'], 
             dinnerEarn:  prodData['dinnerEarn'], 
             lunchEarn:  prodData['lunchEarn'], 
             otherEarn: prodData['otherEarn'])
            
            
          );
        
        // print(prodData['categories']);
      });
      
      
      
      _adminList = loadedMeals;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }

  void addItem(
      {required File savedImage,
      required String categorie,
      required String des,
      required int price,
      required String title,
      required String ft,
      required String tt,
      required BuildContext context}) {
    final url = 'https://i2it-canteen-default-rtdb.firebaseio.com/meals.json';
    final newItem = MealData(
      categories: categorie.toLowerCase(),
      description: des,
      iconImage: savedImage,
      id: DateTime.now().toString(),
      price: price,
      fromTime: ft,
      toTime: tt,
      title: title,
    );
    try {
      http.post(Uri.parse(url),
          body: json.encode({
            'categories': categorie.toLowerCase(),
            'description': des,
            'iconImage': savedImage.path,
            'id': DateTime.now().toString(),
            'price': price,
            'fromTime': ft,
            'toTime': tt,
            'title': title,
            'isCart': false,
            'counter': 1,
            'isSelected': false,
          }));
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            actions: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      'Error',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      'Could not add the item. Please try again later.',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FlatButton(
                        child: Text(
                          'Close',
                          style: TextStyle(fontSize: 15),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      )
                    ],
                  )
                ],
              ),
            ],
          );
        },
      );
    }

    _items.add(newItem);
    notifyListeners();
  }

  Future<void> fetchData() async {
    final url = 'https://i2it-canteen-default-rtdb.firebaseio.com/meals.json';
    try {
      final response = await http.get(Uri.parse(url));
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      // print(extractedData.keys);
      final List<MealData> loadedMeals = [];
      extractedData.forEach((prodId, prodData) {
        loadedMeals.add(MealData(
          id: prodId,
          title: prodData["title"],
          description: prodData["description"],
          price: prodData["price"],
          iconImage: File(prodData["iconImage"]),
          categories: prodData["categories"].toString().toLowerCase(),
          toTime: prodData["toTime"],
          fromTime: prodData["fromTime"],
          isCart: prodData["isCart"],
          isSelected: prodData['isSelected'],
          counter: prodData["counter"],
        ));
        // print(prodData['categories']);
      });
      _items = loadedMeals;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }

  List<MealData> getSelectedMeals(){
    List<MealData> dummyList = [];
    for (var i = 0; i < _items.length; i++) {
      if (_items[i].isSelected) {
        dummyList.add(_items[i]);
      }
    }  
    return dummyList;
  }
  


  List<MealData> getCategorieMeal(String givenCat) {
    List<MealData> _trial = [];
    for (var i = 0; i < _items.length; i++) {
      if (_items[i].categories == givenCat) {
        _trial.add(_items[i]);
      }
    }
    return _trial;
  }

  Future<void> addToCart(
    String id,
  ) async {
    var currentMEal = _items.indexWhere((element) => element.id == id);
    if (currentMEal >= 0) {
      final url =
          'https://i2it-canteen-default-rtdb.firebaseio.com/meals/$id.json';
      return await http
          .patch(Uri.parse(url),
              body: json.encode({
                'isCart':
                    !_items.firstWhere((element) => element.id == id).isCart
              }))
          .then((value) {
        _items[currentMEal] = _items.firstWhere((element) => element.id == id);
        notifyListeners();
      });
    } else {
      print('kuch bhi');
    }
    notifyListeners();
  }

  Future<void> incrementCounter(String id) async {
    var currentMEal = _items.indexWhere((element) => element.id == id);
    var newItem = _items[currentMEal].counter;
    newItem = newItem + 1;
    if (currentMEal >= 0) {
      final url =
          'https://i2it-canteen-default-rtdb.firebaseio.com/meals/$id.json';
      return await http
          .patch(Uri.parse(url),
              body: json.encode({
                'counter': newItem,
              }))
          .then((value) {
        _items[currentMEal] = _items.firstWhere((element) => element.id == id);
        notifyListeners();
      });
    } else {
      print('kuch bhi');
    }
    notifyListeners();
  }

  Future<void> decrementCounter(String id) async {
    var currentMEal = _items.indexWhere((element) => element.id == id);
    var newCounter = _items.firstWhere((element) => element.id == id).counter;
    newCounter = newCounter - 1;
    if (currentMEal >= 0) {
      final url =
          'https://i2it-canteen-default-rtdb.firebaseio.com/meals/$id.json';
      return await http
          .patch(Uri.parse(url),
              body: json.encode({
                'counter': newCounter,
              }))
          .then((value) {
        _items[currentMEal] = _items.firstWhere((element) => element.id == id);
        notifyListeners();
      });
    } else {
      print('kuch bhi');
    }
    notifyListeners();
  }

  Future<void> deleteItem(String id) async {
    var currentMEal = _items.indexWhere((element) => element.id == id);
    if (currentMEal >= 0) {
      final url =
          'https://i2it-canteen-default-rtdb.firebaseio.com/meals/$id.json';
      return await http
          .patch(Uri.parse(url),
              body: json.encode({
                'isCart':
                    !_items.firstWhere((element) => element.id == id).isCart,
                'counter': 1
              }))
          .then((value) {
        _items[currentMEal] = _items.firstWhere((element) => element.id == id);
        notifyListeners();
      });
    } else {
      print('kuch bhi');
    }

    notifyListeners();
  }

  MealData getSingleItem(String id) {
    return _items.firstWhere((element) => element.id == id);
  }

  List<MealData> getCartMeal() {
    return _items.where((element) => element.isCart).toList();
  }

  double setPrice(String id) {
    var currentMEal = _items.firstWhere((element) => element.id == id);
    var price = currentMEal.price * (currentMEal.counter);
    return price.toDouble();
  }

  int getSingleCounter(String givenId) {
    return _items.firstWhere((element) => element.id == givenId).counter;
  }

  Future<void> clearCart() async{
    print('kuch bhi');
    for (var i = 0; i < _items.length; i++) {
      if (_items[i].isCart) {
        var id = _items[i].id;
    final url =
          'https://i2it-canteen-default-rtdb.firebaseio.com/meals/$id.json';
          try {
            await http.patch(Uri.parse(url), body: json.encode({
              'isCart':false,
            }));

        _items[i].isCart = false;
          } catch (e) {
          }
        
      }
    }
    notifyListeners();
  }

  double totalPrice(List<MealData> cartMealsData) {
    double temp = 0;
    for (var i = 0; i < cartMealsData.length; i++) {
      var currentMeal =
          _items.firstWhere((element) => element.id == cartMealsData[i].id);
      temp = temp + currentMeal.price * (currentMeal.counter);
    }
    // notifyListeners();
    return temp;
  }
  double totalBreakfast(List<MealData> cartMealsData) {
    double temp = 0;
    for (var i = 0; i < cartMealsData.length; i++) {
      var currentMeal =
          _items.firstWhere((element) => element.id == cartMealsData[i].id);
          if (currentMeal.categories == 'breakfast') {
            temp = temp + currentMeal.price * (currentMeal.counter);
          }
      
    }
    // notifyListeners();
    return temp;
  }
  double totallunch(List<MealData> cartMealsData) {
    double temp = 0;
    for (var i = 0; i < cartMealsData.length; i++) {
      var currentMeal =
          _items.firstWhere((element) => element.id == cartMealsData[i].id);
          if (currentMeal.categories == 'lunch') {
            temp = temp + currentMeal.price * (currentMeal.counter);
          }
      
    }
    // notifyListeners();
    return temp;
  }
  double totalDinner(List<MealData> cartMealsData) {
    double temp = 0;
    for (var i = 0; i < cartMealsData.length; i++) {
      var currentMeal =
          _items.firstWhere((element) => element.id == cartMealsData[i].id);
          if (currentMeal.categories == 'dinner') {
            temp = temp + currentMeal.price * (currentMeal.counter);
          }
      
    }
    // notifyListeners();
    return temp;
  }
  double totalOther(List<MealData> cartMealsData) {
    double temp = 0;
    for (var i = 0; i < cartMealsData.length; i++) {
      var currentMeal =
          _items.firstWhere((element) => element.id == cartMealsData[i].id);
          if (currentMeal.categories == 'others') {
            temp = temp + currentMeal.price * (currentMeal.counter);
          }
      
    }
    // notifyListeners();
    return temp;
  }
  void clearData(){
    _items.clear();
  }
}
