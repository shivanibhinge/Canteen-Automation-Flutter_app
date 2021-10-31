import 'package:flutter/material.dart';
import 'package:flutter_smart_home_ui/admin/screens/add_page.dart';
import '../../Models/meals_defination.dart';
import 'package:provider/provider.dart';
import '../../provider/meal_data.dart';

class SubPage extends StatefulWidget {
  static const routeName = "/subPage";
  final String category;

  SubPage(this.category);

  @override
  _SubPageState createState() => _SubPageState();
}

class _SubPageState extends State<SubPage> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    // final routeAurgs =
    //     ModalRoute.of(context).settings.arguments as Map<String, Object>;
    // final category = routeAurgs['category'];
    final mealProvider = Provider.of<MealDesData>(context);
    final givenCatMealData =
        mealProvider.getCategoryMeal(widget.category.toString().toLowerCase());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.category,
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.add_circle_outline_rounded,
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => AddScreen(widget.category),
              ));
            },
          )
        ],
      ),
      body: givenCatMealData.isEmpty
          ? Center(
              child: Text(
                'No Items found. Please add some!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          : Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.all(20),
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
                      hintText: 'Search previous orders...',
                      prefixIcon: Icon(
                        Icons.search_rounded,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                _isLoading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Expanded(
                        child: ListView.builder(
                          itemCount: givenCatMealData.length,
                          itemBuilder: (context, index) {
                            
                              return Container(
                                child: Card(
                                  color: givenCatMealData[index].isSelected
                                      ? Colors.green
                                      : Colors.white,
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Container(
                                    // margin:
                                    //     EdgeInsets.only(top: 20, right: 20, bottom: 20),
                                    // margin: EdgeInsets.all(20),
                                    child: Row(
                                      children: [
                                        Container(
                                          child: Checkbox(
                                            value: givenCatMealData[index]
                                                .isSelected,
                                            onChanged: (value) {
                                              setState(() {
                                                _isLoading = true;
                                              });
                                              mealProvider
                                                  .changeSelected(
                                                      givenCatMealData[index].id)
                                                  .then((value) {
                                                setState(() {
                                                  _isLoading = false;
                                                });
                                              });
                                            },
                                          ),
                                        ),
                                        Container(
                                          height:
                                              MediaQuery.of(context).size.height *
                                                  0.15,
                                          width:
                                              MediaQuery.of(context).size.width *
                                                  0.35,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: Colors.grey,
                                            image: DecorationImage(
                                                image: FileImage(
                                                  givenCatMealData[index]
                                                      .iconImage,
                                                ),
                                                fit: BoxFit.cover),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.all(20),
                                          //width: MediaQuery.of(context).size.width*0.8,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: MediaQuery.of(context).size.width*0.25,
                                                child: Text(
                                                  givenCatMealData[index].title,
                                                  style: TextStyle(
                                                    fontSize: 25,
                                                    
                                                  ),
                                                ),
                                              ),
                                              
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Text(
                                                'Rs. ${givenCatMealData[index].price.toString()}',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Spacer(),
                                        Container(
                                          child: IconButton(
                                            icon: Icon(Icons.edit_outlined),
                                            onPressed: () {
                                               Navigator.of(context).push(MaterialPageRoute(
                                                  builder: (context) => AddScreen(widget.category),
                                                    ));
                                            },
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              

                              
                                                         
                          
                        );
                          }
                      ),
                    )
              ],
            ),
    );
  }
}
