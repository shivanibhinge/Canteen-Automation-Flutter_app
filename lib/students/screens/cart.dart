import 'package:flutter/material.dart';
import 'package:flutter_smart_home_ui/provider/meal_data.dart';
import 'package:flutter_smart_home_ui/students/widgets/student_drawer.dart';
import 'package:provider/provider.dart';

class MyCart extends StatefulWidget {
  static const routeName = "/my-cart";

  @override
  _MyCartState createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
 bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    final mealData = Provider.of<MealDesData>(context);
    final cartMeals = mealData.getCartMeal();
    return Scaffold(
      drawer: StudentDrawer(
        currentUserId: '002',
      ),
      appBar: AppBar(
        title: Text(
          'Your Cart',
        ),
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  cartMeals.isEmpty
                      ? Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.6,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  image: DecorationImage(
                                    image: AssetImage('images/empty_cart.gif'),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                child: Container(
                                  alignment: Alignment.bottomCenter,
                                  child: Text(
                                    'Looks like you haven\'t made your choice yet! :(',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      : Expanded(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.94,
                            child: Container(
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Container(
                                      height: cartMeals.length < 7
                                          ? MediaQuery.of(context).size.height *
                                              0.08 *
                                              cartMeals.length
                                          : MediaQuery.of(context).size.height *
                                              0.56,
                                      child: ListView.builder(
                                        itemCount: cartMeals.length,
                                        itemBuilder: (context, index) {
                                          return Card(
                                            elevation: 10,
                                            child: Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.07,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.4,
                                                    child: Container(
                                                      margin: EdgeInsets.only(
                                                          left: 5),
                                                      child: Text(
                                                        cartMeals[index].title,
                                                        style: TextStyle(
                                                          fontSize: 15,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    'Rs. ${mealData.setPrice(cartMeals[index].id)}',
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.01,
                                                  ),
                                                  Container(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        IconButton(
                                                          icon: Icon(Icons
                                                              .do_disturb_on_outlined),
                                                          onPressed: () {
                                                            setState(() {
                                                              _isLoading = true;
                                                            });
                                                            cartMeals[index]
                                                                        .counter >
                                                                    1
                                                                ? mealData
                                                                    .decrementCounter(
                                                                        cartMeals[index]
                                                                            .id)
                                                                    .then(
                                                                        (value) {
                                                                    setState(
                                                                        () {
                                                                      _isLoading =
                                                                          false;
                                                                    });
                                                                  })
                                                                : mealData
                                                                    .deleteItem(
                                                                        cartMeals[index]
                                                                            .id)
                                                                    .then(
                                                                        (value) {
                                                                    setState(
                                                                        () {
                                                                      _isLoading =
                                                                          false;
                                                                    });
                                                                  });
                                                          },
                                                        ),
                                                        Text(
                                                          '${mealData.getSingleCounter(cartMeals[index].id)}',
                                                          style: TextStyle(
                                                            fontSize: 15,
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        IconButton(
                                                          icon: Icon(Icons
                                                              .add_circle_outline_rounded),
                                                          onPressed: () {
                                                            setState(() {
                                                              _isLoading = true;
                                                            });
                                                            mealData
                                                                .incrementCounter(
                                                                    cartMeals[
                                                                            index]
                                                                        .id)
                                                                .then((value) {
                                                              setState(() {
                                                                _isLoading =
                                                                    false;
                                                              });
                                                            });
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    Card(
                                      color: Color(0xff00001a).withOpacity(0.8),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      child: Column(
                                        children: [
                                          Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.08,
                                            margin: EdgeInsets.only(
                                              bottom: 10,
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(
                                                    left: 5,
                                                  ),
                                                  child: Text(
                                                    'Total Amount: ',
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                    right: 5,
                                                  ),
                                                  child: Text(
                                                    'Rs ${mealData.totalPrice(cartMeals)}',
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 5),
                                      child: RaisedButton.icon(
                                        color: Color(0xff00001a),
                                        icon: Icon(
                                          Icons.arrow_right_alt_rounded,
                                          color: Colors.white,
                                        ),
                                        label: Text(
                                          'Proceed to Pay',
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                          ),
                                        ),
                                        onPressed: () {
                                          Map<String, dynamic> dummyList= {};
                                          for (var i = 0; i < cartMeals.length; i++) {
                                            dummyList.addAll({cartMeals[i].title: cartMeals[i].counter});
                                          }
                                          Navigator.of(context).pushNamed(
                                            '/final-Payment',
                                            arguments: {
                                              'totalPrice': mealData
                                                  .totalPrice(cartMeals)
                                                  .round(),
                                                  'totalBreakfast': mealData
                                                  .totalBreakfast(cartMeals)
                                                  .round(),
                                                  'totallunch': mealData
                                                  .totallunch(cartMeals)
                                                  .round(),
                                                  'totalDinner': mealData
                                                  .totalDinner(cartMeals)
                                                  .round(),
                                                  'totalOther': mealData
                                                  .totalOther(cartMeals)
                                                  .round(),
                                              'cartMealsInfo': dummyList,
                                            },
                                          );
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                ],
              ),
            ),
    );
  }
}
