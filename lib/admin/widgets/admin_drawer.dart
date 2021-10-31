import 'package:flutter/material.dart';
import 'package:flutter_smart_home_ui/Login/loginData/sigin_page.dart';
import 'package:flutter_smart_home_ui/Models/meals_defination.dart';
import 'package:flutter_smart_home_ui/admin/screens/admin_faq.dart';
import 'package:flutter_smart_home_ui/admin/screens/ongoing_page.dart';
import 'package:flutter_smart_home_ui/admin/screens/total_earnings.dart';
import 'package:provider/provider.dart';
import '../screens/admin_home.dart';
import '../../provider/meal_data.dart';
import '../screens/oreder_received.dart';

// ignore: must_be_immutable
class AdminDrawer extends StatelessWidget {
  
  const AdminDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("I2IT admin"),
            accountEmail: Text("i2it@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Center(
                child: Text(
                  "I",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
            otherAccountsPictures: [
              CircleAvatar(
                backgroundColor: Colors.white,
                child: Center(
                  child: Text(
                    "A",
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              ),
            ],
          ),
          ListTile(
            leading: Icon(
              Icons.home_filled,
              color: Colors.deepPurple,
            ),
            title: Text('Home'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).popAndPushNamed(Admin.routeName);
            },
          ),
          Divider(
            color: Colors.black,
            indent: 10,
            endIndent: 10,
            thickness: 1,
          ),
          ListTile(
            leading: Icon(
              Icons.analytics_rounded,
              color: Colors.deepPurple,
            ),
            title: Text('Monthly track'),
            onTap: () {
              
              Navigator.of(context).popAndPushNamed(Balance.routeName);
            },
          ),
          Divider(
            color: Colors.black,
            indent: 10,
            endIndent: 10,
            thickness: 1,
          ),
          
          ListTile(
            leading: Icon(
              Icons.assignment,
              color: Colors.deepPurple,
            ),
            title: Text('Ongoing Order'),
            onTap: () {
              Navigator.of(context).popAndPushNamed(OngoingScreen.routeName);
            },
          ),
          Divider(
            color: Colors.black,
            indent: 10,
            endIndent: 10,
            thickness: 1,
          ),
          ListTile(
            leading: Icon(
              Icons.assignment,
              color: Colors.deepPurple,
            ),
            title: Text('Order Received'),
            onTap: () {
              Navigator.of(context).popAndPushNamed(OrderReceived.routeName, );
            },
          ),
          Divider(
            color: Colors.black,
            indent: 10,
            endIndent: 10,
            thickness: 1,
          ),
          ListTile(
            leading: Icon(
              Icons.question_answer_rounded,
              color: Colors.deepPurple,
            ),
            title: Text('Faq'),
            onTap: () {
              Navigator.of(context).popAndPushNamed(AdminFAQ.routeName);
            },
          ),
          Divider(
            color: Colors.black,
            indent: 10,
            endIndent: 10,
            thickness: 1,
          ),
          
          ListTile(
            leading: Icon(
              Icons.logout,
              color: Colors.deepPurple,
            ),
            title: Text('Logout'),
            onTap: () {
              //Navigator.of(context).pop();
              Provider.of<MealDesData>(context, listen: false).clearData();
              Navigator.of(context).popAndPushNamed(SignInPage.routeName);
            },
          ),
        ],
      ),
    );
  }
}
