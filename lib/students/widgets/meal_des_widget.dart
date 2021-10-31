import 'package:flutter/material.dart';
import 'package:flutter_smart_home_ui/Models/meals_defination.dart';
import 'package:provider/provider.dart';
import '../../provider/meal_data.dart';
import '../screens/cart.dart';

class MealDes extends StatefulWidget {
  static const routename = '/meal-des';

  @override
  _MealDesState createState() => _MealDesState();
}

class _MealDesState extends State<MealDes> {
 bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    final mealInfo = Provider.of<MealDesData>(context);
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
    final mealDataId = routeArgs['mealDataId'] as String;
    final mealData =
        Provider.of<MealDesData>(context).getSingleItem(mealDataId);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          mealData.title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: FileImage(mealData.iconImage),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Text(
                      mealData.title,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                   Container(
                     margin: const EdgeInsets.all(15.0),
                      padding: const EdgeInsets.all(7.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 4,
                        color: Colors.deepPurple,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                      ),
                    //alignment: Alignment.center,
                    //margin: EdgeInsets.only(top: 20, left: 10, right: 10),
                    child: Text(
                      "Price: ${mealData.price.toString()}",
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 20, left: 10, right: 10),
                    child: Text(
                      mealData.description,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                  ),
                 
                  SizedBox(
                    height: 60,
                  ),
                  
                  !mealData.isCart
                      ? Container(
                          margin: EdgeInsets.all(10),
                          // color: Colors.purple,
                          width: double.infinity,
                          child: RaisedButton(
                            color: Colors.purple,
                            child: Text(
                              'Add To Cart',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                _isLoading = true;
                              });
                              mealInfo.addToCart(mealDataId).then((value) {
                                setState(() {
                                  _isLoading = false;
                                });
                              });
                            },
                          ),
                        )
                      : Container(
                          //height: MediaQuery.of(context).size.height * 0.3,
                          width: double.infinity,
                          margin: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                  icon: Icon(Icons.remove_circle_outline),
                                  onPressed: () {
                                    setState(() {
                                      _isLoading = true;
                                    });
                                    mealData.counter > 1
                                        ? mealInfo
                                            .decrementCounter(mealData.id)
                                            .then((value) {
                                            setState(() {
                                              _isLoading = false;
                                            });
                                          })
                                        : mealInfo
                                            .deleteItem(mealData.id)
                                            .then((value) {
                                            setState(() {
                                              _isLoading = false;
                                            });
                                          });
                                  }),
                              Text(
                                '${mealInfo.items.firstWhere((element) => element.id == mealData.id).counter}',
                              ),
                              IconButton(
                                  icon: Icon(Icons.add_circle_outline),
                                  onPressed: () {
                                    setState(() {
                                      _isLoading = true;
                                    });
                                    mealInfo
                                        .incrementCounter(mealData.id)
                                        .then((value) {
                                      setState(() {
                                        _isLoading = false;
                                      });
                                    });
                                  }),
                            ],
                          ),
                        ),
                ],
              ),
            ),
      bottomNavigationBar: mealData.isCart
          ? Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.06,
              child: RaisedButton(
                color: Color(0xff00001a),
                child: Row(
                  children: [
                    Container(
                      child: Text(
                        '${mealInfo.items.firstWhere((element) => element.id == mealData.id).counter} items | Rs.${mealInfo.items.firstWhere((element) => element.id == mealData.id).counter * mealData.price} ',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Spacer(),
                    Container(
                      
                      child: FlatButton(onPressed: (){
                        Navigator.of(context).popAndPushNamed(MyCart.routeName);
                      },
                        shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white, width: 2)
                  ),
                      child: Text(
                        'Your Cart',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                        )
                        ),
                    )
                  ],
                ),
                onPressed: () {

                },
              ),
            )
          : Container(
              height: 0,
            ),
    );
  }
}
