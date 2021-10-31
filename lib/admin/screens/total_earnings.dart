import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../provider/meal_data.dart';
import '../../Models/admin_earning_defination.dart';
// import '../icons/down_arrow_icons.dart';
// import '../icons/up_arrow_icons.dart';

class Balance extends StatefulWidget {
  static const routeName = '/balance_page';

  @override
  _BalanceState createState() => _BalanceState();
}


class _BalanceState extends State<Balance> {
  
  @override
  Widget build(BuildContext context) {
    final earningData = Provider.of<MealDesData>(context).admin;
    return Scaffold(
      appBar: AppBar(title: Text(
        'Monthly Track',
      ),),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                child: Text(
                  '${DateFormat.E().format(DateTime.now())}, ${DateFormat.d().format(DateTime.now())} ${DateFormat.LLLL().format(DateTime.now())}',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          'Hi, Canteen Store',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    // CircleAvatar(
                    //   child: Image(
                    //     image: AssetImage('assets/images/user.jpg'),
                    //     fit: BoxFit.fill,
                    //   ),
                    // ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.82,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey
                  ),
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25),
                    topLeft: Radius.circular(25),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10, left: 20),
                      child: Text(
                        'Earnings',
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 20),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                      child: Row(
                        children: [
                          Text(
                            'Total Balance',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                            ),
                          ),
                          Spacer(),
                          Text(
                            'Rs. ${earningData[0].totalEarning}',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(top: 20, left: 10, right: 10),
                      child: Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Container(
                          margin: EdgeInsets.only(top: 10, left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: Text(
                                      'Earning in ',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ),
                                  DropdownButton(
                                    //onChanged: (value) {},
                                    items: [
                                      DropdownMenuItem(
                                        child: Text(
                                          'January',
                                          style: TextStyle(
                                              color: Color(0xff00001a)),
                                        ),
                                      ),
                                      DropdownMenuItem(
                                        child: Text(
                                          'Febuary',
                                          style: TextStyle(
                                              color: Color(0xff00001a)),
                                        ),
                                      ),
                                      DropdownMenuItem(
                                        child: Text(
                                          'March',
                                          style: TextStyle(
                                              color: Color(0xff00001a)),
                                        ),
                                      ),
                                      DropdownMenuItem(
                                        child: Text(
                                          'April',
                                          style: TextStyle(
                                              color: Color(0xff00001a)),
                                        ),
                                      ),
                                      DropdownMenuItem(
                                        child: Text(
                                          'May',
                                          style: TextStyle(
                                              color: Color(0xff00001a)),
                                        ),
                                      ),
                                      DropdownMenuItem(
                                        child: Text(
                                          'June',
                                          style: TextStyle(
                                              color: Color(0xff00001a)),
                                        ),
                                      ),
                                      DropdownMenuItem(
                                        child: Text(
                                          'July',
                                          style: TextStyle(
                                              color: Color(0xff00001a)),
                                        ),
                                      ),
                                      DropdownMenuItem(
                                        child: Text(
                                          'August',
                                          style: TextStyle(
                                              color: Color(0xff00001a)),
                                        ),
                                      ),
                                      DropdownMenuItem(
                                        child: Text(
                                          'September',
                                          style: TextStyle(
                                              color: Color(0xff00001a)),
                                        ),
                                      ),
                                      DropdownMenuItem(
                                        child: Text(
                                          'October',
                                          style: TextStyle(
                                              color: Color(0xff00001a)),
                                        ),
                                      ),
                                      DropdownMenuItem(
                                        child: Text(
                                          'November',
                                          style: TextStyle(
                                              color: Color(0xff00001a)),
                                        ),
                                      ),
                                      DropdownMenuItem(
                                        child: Text(
                                          'December',
                                          style: TextStyle(
                                              color: Color(0xff00001a)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Rs.${earningData[0].totalEarning}',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  // Container(
                                  //   margin:
                                  //       EdgeInsets.only(left: 10, bottom: 10),
                                  //   child: Text(
                                  //     '+Rs. 346',
                                  //     style: TextStyle(
                                  //       color: Colors.grey,
                                  //       fontSize: 15,
                                  //       fontWeight: FontWeight.w600,
                                  //     ),
                                  //   ),
                                  // ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(top: 20, left: 10, right: 10),
                      child: Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Container(
                          margin: EdgeInsets.only(top: 10, left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                //crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: Text(
                                      'Todays Earnings',
                                      style: TextStyle(fontSize: 18,
                                      ),

                                    ),
                                  ),
                                 Spacer(),
                                  Container(
                                    margin: EdgeInsets.only(top: 10, right: 20),
                                    child:
                                    Text(
                                    'Rs. ${earningData[0].totalEarning}',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  )
                                  
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(

                                    margin:
                                        EdgeInsets.only(left: 10, bottom: 10, top: 15),
                                    child: Text(
                                      'Breakfast: +Rs. ${earningData[0].breakfastEarn}',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.only(left: 10, bottom: 10,),
                                    child: Text(
                                      'Lunch: +Rs. ${earningData[0].lunchEarn}',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.only(left: 10, bottom: 10),
                                    child: Text(
                                      'Dinner: +Rs. ${earningData[0].dinnerEarn}',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.only(left: 10, bottom: 10),
                                    child: Text(
                                      'Others: +Rs. ${earningData[0].otherEarn}',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
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
}
