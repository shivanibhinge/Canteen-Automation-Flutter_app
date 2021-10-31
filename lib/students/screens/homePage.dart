import 'package:flutter/material.dart';
import 'package:flutter_smart_home_ui/provider/coupons_provider.dart';

import '../widgets/student_drawer.dart';
import '../../provider/meal_data.dart';
import 'package:provider/provider.dart';
import '../../provider/user_data.dart';
import '../widgets/meal_des_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final appTitle = 'Drawer Demo';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  static const routeName = '/StudentHome';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _progressesController = false;

  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    
    await Provider.of<MealDesData>(context).studentFetchData().then((value) {
      
      setState(() {
        _progressesController = true;
      }); 
    });
   

    super.didChangeDependencies();
  } 

  @override
  Widget build(BuildContext context) {
    final routeAurge =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final currentUserId = routeAurge['id'];

    final mealDesData = Provider.of<MealDesData>(context);

    final pMeal = mealDesData.getCategorieMeal('breakfast');
    final lmeal = mealDesData.getCategorieMeal('lunch');
    final dmeal = mealDesData.getCategorieMeal('dinner');
    final omeal = mealDesData.getCategorieMeal('others');

    return Scaffold(
      appBar: AppBar(title: Text("MENU")),
      body: !_progressesController
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Container(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height * 0.07,
                      width: MediaQuery.of(context).size.width * 0.875,
                      margin: EdgeInsets.only(top: 15, left: 15, right: 15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.white),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                          ),
                        ],
                      ),
                      child: TextField(
                        style: TextStyle(
                          decoration: TextDecoration.none,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Restaurant,Seller name...',
                          prefixIcon: Icon(
                            Icons.search_rounded,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: 8,
                        left: 30,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "BREAKFAST",
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 15),
                            child: IconButton(
                              icon: Icon(Icons.more_horiz_rounded),
                              iconSize: 30,
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.185,
                      width: double.infinity,
                      margin: EdgeInsets.only(left: 20, right: 20),
                      child: pMeal.isEmpty
                          ? Card(
                              color: Colors.purple,
                              elevation: 5,
                              child: Center(
                                child: Text(
                                  'No meals added to BreakFast yet .',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )
                          : GridView.count(
                              crossAxisCount: 1,
                              scrollDirection: Axis.horizontal,
                              children: List.generate(
                                pMeal.length,
                                (index) => Card(
                                  elevation: 3,
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: () {},
                                    child: GestureDetector(
                                      onTap: () =>
                                          Navigator.of(context).pushNamed(
                                        MealDes.routename,
                                        arguments: ({
                                          'mealDataId': pMeal[index].id,
                                        }),
                                      ),
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.1,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.25,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: FileImage(
                                              pMeal[index].iconImage,
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0)),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            DecoratedBox(
                                              decoration: const BoxDecoration(
                                                // color: Color(0xAA000000),
                                                color: Colors.black87,
                                                borderRadius: BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(10.0),
                                                    bottomRight:
                                                        Radius.circular(10.0)),
                                              ),
                                              child: SizedBox(
                                                width: double.infinity,
                                                // height: 101,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.04,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    FittedBox(
                                                      fit: BoxFit.fitWidth,
                                                      child: Text(
                                                        pMeal[index].title,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: 8,
                        left: 30,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "LUNCH",
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 15),
                            child: IconButton(
                              icon: Icon(Icons.more_horiz_rounded),
                              iconSize: 30,
                              onPressed: () {
                                // Navigator.of(context).push(
                                //   MaterialPageRoute(
                                //     builder: (context) => PartyPageDesign(pMeal),
                                //     settings:
                                //         RouteSettings(arguments: 'PARTY ORDERS'),
                                //   ),
                                // );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.185,
                      width: double.infinity,
                      margin: EdgeInsets.only(left: 20, right: 20),
                      child: lmeal.isEmpty
                          ? Card(
                              color: Colors.purple,
                              elevation: 5,
                              child: Center(
                                child: Text(
                                  'No meals added to Lunch yet',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )
                          : GridView.count(
                              crossAxisCount: 1,
                              scrollDirection: Axis.horizontal,
                              children: List.generate(
                                lmeal.length,
                                (index) => Card(
                                  elevation: 3,
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: () {
                                      // Navigator.of(context).push(
                                      //   MaterialPageRoute(
                                      //     builder: (context) =>
                                      //         MealDes(pMeal[index].id),
                                      //   ),
                                      // );
                                    },
                                    child: GestureDetector(
                                      onTap: () =>
                                          Navigator.of(context).pushNamed(
                                        MealDes.routename,
                                        arguments: ({
                                          'mealDataId': lmeal[index].id,
                                        }),
                                      ),
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.1,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.25,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: FileImage(
                                              lmeal[index].iconImage,
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0)),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            DecoratedBox(
                                              decoration: const BoxDecoration(
                                                // color: Color(0xAA000000),
                                                color: Colors.black87,
                                                borderRadius: BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(10.0),
                                                    bottomRight:
                                                        Radius.circular(10.0)),
                                              ),
                                              child: SizedBox(
                                                width: double.infinity,
                                                // height: 101,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.04,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    FittedBox(
                                                      fit: BoxFit.fitWidth,
                                                      child: Text(
                                                        lmeal[index].title,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: 8,
                        left: 30,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "DINNER",
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 15),
                            child: IconButton(
                              icon: Icon(Icons.more_horiz_rounded),
                              iconSize: 30,
                              onPressed: () {
                                // Navigator.of(context).push(
                                //   MaterialPageRoute(
                                //     builder: (context) => PartyPageDesign(pMeal),
                                //     settings:
                                //         RouteSettings(arguments: 'PARTY ORDERS'),
                                //   ),
                                // );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.185,
                      width: double.infinity,
                      margin: EdgeInsets.only(left: 20, right: 20),
                      child: dmeal.isEmpty
                          ? Card(
                              color: Colors.purple,
                              elevation: 5,
                              child: Center(
                                child: Text(
                                  'No meals added to Dinner yet',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )
                          : GridView.count(
                              crossAxisCount: 1,
                              scrollDirection: Axis.horizontal,
                              children: List.generate(
                                dmeal.length,
                                (index) => Card(
                                  elevation: 3,
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: () {
                                      // Navigator.of(context).push(
                                      //   MaterialPageRoute(
                                      //     builder: (context) =>
                                      //         MealDes(pMeal[index].id),
                                      //   ),
                                      // );
                                    },
                                    child: GestureDetector(
                                      onTap: () =>
                                          Navigator.of(context).pushNamed(
                                        MealDes.routename,
                                        arguments: ({
                                          'mealDataId': dmeal[index].id,
                                        }),
                                      ),
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.1,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.25,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: FileImage(
                                              dmeal[index].iconImage,
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0)),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            DecoratedBox(
                                              decoration: const BoxDecoration(
                                                // color: Color(0xAA000000),
                                                color: Colors.black87,
                                                borderRadius: BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(10.0),
                                                    bottomRight:
                                                        Radius.circular(10.0)),
                                              ),
                                              child: SizedBox(
                                                width: double.infinity,
                                                // height: 101,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.04,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    FittedBox(
                                                      fit: BoxFit.fitWidth,
                                                      child: Text(
                                                        dmeal[index].title,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: 8,
                        left: 30,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "OTHERS",
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 15),
                            child: IconButton(
                              icon: Icon(Icons.more_horiz_rounded),
                              iconSize: 30,
                              onPressed: () {
                                // Navigator.of(context).push(
                                //   MaterialPageRoute(
                                //     builder: (context) => PartyPageDesign(pMeal),
                                //     settings:
                                //         RouteSettings(arguments: 'PARTY ORDERS'),
                                //   ),
                                // );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.185,
                      width: double.infinity,
                      margin: EdgeInsets.only(left: 20, right: 20),
                      child: omeal.isEmpty
                          ? Card(
                              color: Colors.purple,
                              elevation: 5,
                              child: Center(
                                child: Text(
                                  'No meals added to  Others yet',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )
                          : GridView.count(
                              crossAxisCount: 1,
                              scrollDirection: Axis.horizontal,
                              children: List.generate(
                                omeal.length,
                                (index) => Card(
                                  elevation: 3,
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: () {
                                      // Navigator.of(context).push(
                                      //   MaterialPageRoute(
                                      //     builder: (context) =>
                                      //         MealDes(pMeal[index].id),
                                      //   ),
                                      // );
                                    },
                                    child: GestureDetector(
                                      onTap: () =>
                                          Navigator.of(context).pushNamed(
                                        MealDes.routename,
                                        arguments: ({
                                          'mealDataId': omeal[index].id,
                                        }),
                                      ),
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.1,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.25,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: FileImage(
                                              omeal[index].iconImage,
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0)),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            DecoratedBox(
                                              decoration: const BoxDecoration(
                                                // color: Color(0xAA000000),
                                                color: Colors.black87,
                                                borderRadius: BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(10.0),
                                                    bottomRight:
                                                        Radius.circular(10.0)),
                                              ),
                                              child: SizedBox(
                                                width: double.infinity,
                                                // height: 101,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.04,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    FittedBox(
                                                      fit: BoxFit.fitWidth,
                                                      child: Text(
                                                        omeal[index].title,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                    ),
                  ])),
            ),
      drawer: StudentDrawer(
        currentUserId: currentUserId,
      ),
    );
  }
}
