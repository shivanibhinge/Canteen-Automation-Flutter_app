import 'package:flutter/material.dart';
import 'package:flutter_smart_home_ui/Login/loginData/sigin_page.dart';
import 'package:flutter_smart_home_ui/students/screens/ongoing_coupons.dart';
import 'package:flutter_smart_home_ui/students/screens/settings.dart';
import '../../students/screens/homePage.dart';
import '../../students/screens/faq_screen.dart';
import '../../students/screens/settings.dart';
import '../../students/screens/cart.dart';
import 'package:provider/provider.dart';
import '../../provider/user_data.dart';
import '../../provider/meal_data.dart';


// ignore: must_be_immutable
class StudentDrawer extends StatelessWidget {
   String currentUserId;
  StudentDrawer({
    Key? key,
    required this.currentUserId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userData =
        Provider.of<UserDataAdmin>(context).getSingleUserData(currentUserId);
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(userData.firstName),
            accountEmail: Text(userData.emailId),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Center(
                child: Text(
                  userData.firstName[0],
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
            otherAccountsPictures: [
              CircleAvatar(
                backgroundColor: Colors.white,
                child: Center(
                  child: Text(
                    "P",
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
              // Navigator.of(context).pop();
              Navigator.of(context)
                  .popAndPushNamed(MyHomePage.routeName, arguments: {
                'id': currentUserId,
              });
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
              Icons.shopping_cart_rounded,
              color: Colors.deepPurple,
            ),
            title: Text('Cart'),
            onTap: () {
              Navigator.of(context).popAndPushNamed(MyCart.routeName);
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
              Navigator.of(context).popAndPushNamed(FAQs.routeName);
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
              Icons.settings_applications_rounded,
              color: Colors.deepPurple,
            ),
            title: Text('Settings'),
            onTap: () {
              Navigator.of(context)
                  .popAndPushNamed(Settings.routeName, arguments: {
                'id': currentUserId,
              });
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
              Icons.settings_applications_rounded,
              color: Colors.deepPurple,
            ),
            title: Text('Ongoing Coupons'),
            onTap: () {
              Navigator.of(context)
                  .popAndPushNamed(OngoingCoupons.routeName, arguments: {
                'id': currentUserId,
              });
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
              Navigator.of(context).pop();
              Provider.of<MealDesData>(context, listen: false).clearData();
              Navigator.of(context).popAndPushNamed(SignInPage.routeName);
            },
          ),
          
          Divider(
            color: Colors.black,
            indent: 10,
            endIndent: 10,
            thickness: 1,
          ),
        ],
      ),
    );
  }
}
