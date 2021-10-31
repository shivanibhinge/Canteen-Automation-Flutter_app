import 'package:flutter/material.dart';
import 'package:flutter_smart_home_ui/admin/widgets/admin_drawer.dart';
import 'package:flutter_smart_home_ui/students/widgets/meal_des_widget.dart';
import 'package:flutter_smart_home_ui/students/widgets/student_drawer.dart';
import '../../provider/meal_data.dart';
import 'package:provider/provider.dart';

class OngoingScreen extends StatefulWidget {
  static const routeName = '/ongoing-page';
  @override
  _OngoingScreenState createState() => _OngoingScreenState();
}

class _OngoingScreenState extends State<OngoingScreen> {
  
  @override
  Widget build(BuildContext context) {
    final mealProvider = Provider.of<MealDesData>(context);
    final ongoingMeals = mealProvider.getSelectedMeals();
    return Scaffold(
     drawer: AdminDrawer(),
     appBar: AppBar(title: Text(
       'Ongoing Orders',
       
     ),
     backgroundColor: Color(0xff00001a),
     ),
     body: Center(
       child: Container(
         height: MediaQuery.of(context).size.height,
         // width: MediaQuery.of(context).size.width * 0.5,
         child: ListView.builder(
           itemCount: ongoingMeals.length,
           itemBuilder: (context, index) => Card(
             elevation: 5,
             child: Container(
               margin: EdgeInsets.only(top: 10),
               child: Row(
                 children: [
                  
                   Container(
                     margin: EdgeInsets.only(
                         left: 12, right: 5, top: 8, bottom: 3),
                     width: MediaQuery.of(context).size.width * 0.3,
                     height: MediaQuery.of(context).size.height * 0.15,
                     decoration: BoxDecoration(
                       color: Colors.grey,
                         image: DecorationImage(
                             image: FileImage(ongoingMeals[index].iconImage),
                             fit: BoxFit.cover)),
                   ),
                   Container(
                     
                     width: MediaQuery.of(context).size.width * 0.42,
                     child: Column(
                       children: [
                         Text(ongoingMeals[index].title,
                         style: TextStyle(
                           fontSize: 18,
                           fontWeight: FontWeight.w700,
                         ),),
                         
                         Container
                         (
                           margin: EdgeInsets.only(top: 10),
                           alignment: Alignment.center,
                           width: MediaQuery.of(context).size.width*0.2,

                           child: Text('Rs.${ongoingMeals[index].price.toString()}',
                           style: TextStyle(fontSize: 15,
                           fontWeight: FontWeight.bold),
                           ))
                       ],
                     ),
                   ),

               
                 ]
               )
    ),
           ),
         )
       ),
     )
    );

                    
  }
}