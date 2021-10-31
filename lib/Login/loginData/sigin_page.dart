import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_smart_home_ui/admin/screens/admin_home.dart';
import 'package:provider/provider.dart';
import '../../provider/user_data.dart';
import './register_page.dart';

class SignInPage extends StatefulWidget {
  static const routeName = '/SignInPage';
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignInPage> {
  bool _obscureText = true;

    final inputtedUserName = TextEditingController();
    final inputtedPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var deviceHeight = MediaQuery.of(context).size.height;
    // var deviceWidth = MediaQuery.of(context).size.width;
    
    final userDataProvider = Provider.of<UserDataAdmin>(context);
    final userData = userDataProvider.items;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                  "https://scontent.fbom3-1.fna.fbcdn.net/v/t31.18172-8/23847482_1895154920512202_7241017864964618277_o.jpg?_nc_cat=101&ccb=1-3&_nc_sid=e3f864&_nc_ohc=AsqyJ-wlSXwAX_30HEz&_nc_ht=scontent.fbom3-1.fna&oh=2419fd33dab23317b819bc41b7a75703&oe=60D7D1F7",
                ),
                fit: BoxFit.cover),
          ),

          //color: Theme.of(context).backgroundColor,
          height: deviceHeight,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  // margin: EdgeInsets.only(bottom: 80),
                  height: MediaQuery.of(context).size.height * 0.25,
                  // decoration:
                  //     BoxDecoration(border: Border.all(color: Colors.black)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'WELCOME',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              // fontWeight: FontWeight.bold,
                              // decoration: TextDecoration.underline,
                              // fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Container(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'to ',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'I2IT ',
                            style: TextStyle(
                                color: Colors.lightBlue[700],
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Canteen ',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      )),
                    ],
                  ),
                ),
                SizedBox(
                  child: Container(
                    margin: EdgeInsets.only(top: 60),
                    height: MediaQuery.of(context).size.height * 0.44,
                    child: Card(
                      shadowColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      color: Colors.white.withOpacity(0.7),
                      elevation: 20,
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                top: 30, left: 10, right: 10, bottom: 10),
                            child: TextField(
                              style: TextStyle(color: Colors.black),
                              controller: inputtedUserName,
                              decoration: InputDecoration(
                                hintText: 'EmailId / PhoneNumber',
                                hintStyle: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                ),
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: Colors.black,
                                ),
                                labelStyle: TextStyle(color: Colors.black),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10),
                            margin: EdgeInsets.all(10),
                            child: TextField(
                              obscureText: _obscureText,
                              style: TextStyle(
                                color: Colors.black,
                              ),
                              controller: inputtedPassword,
                              decoration: InputDecoration(
                                hintText: 'Password',
                                hintStyle: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                ),
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Colors.black,
                                ),
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _obscureText = !_obscureText;
                                    });
                                  },
                                  child: Icon(
                                    _obscureText
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    semanticLabel: _obscureText
                                        ? 'show password'
                                        : 'hide password',
                                    color: Colors.black,
                                  ),
                                ),
                                labelStyle: TextStyle(color: Colors.black),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Card(
                                  color: Colors.black.withOpacity(0.8),
                                  elevation: 5,
                                  child: FlatButton(
                                    height: 50,
                                    color: Colors.black.withOpacity(0.6),
                                    child: Text(
                                      'Forgot Password',
                                      style: TextStyle(
                                        color: Colors.lightBlueAccent[700],
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                                Container(
                                  height: 50,
                                  width: 110,
                                  child: Card(
                                    color: Colors.black.withOpacity(0.8),
                                    // color: Theme.of(context).backgroundColor,
                                    // margin: EdgeInsets.fromLTRB(220, 0, 0, 0),
                                    child: RaisedButton(
                                      //shape: RoundedRectangleBorder(
                                      //borderRadius:
                                      // BorderRadius.circular(9.0),
                                      // side: BorderSide(color: Colors.black)),
                                      color: Colors.black.withOpacity(0.6),
                                      // color: Theme.of(context).backgroundColor,
                                      elevation: 10,

                                      child: Text(
                                        'LogIn',
                                        style: TextStyle(
                                          color: Colors.lightBlueAccent[700],
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      onPressed: () {
                                        // ignore: unused_local_variable
                                        var flag = -1;
                                        if (inputtedUserName.text ==
                                                userData[0].emailId ||
                                            inputtedUserName.text ==
                                                userData[0]
                                                    .phoneNo
                                                    .toString()) {
                                          if (inputtedPassword.text ==
                                              userData[0].password) {
                                            Navigator.of(context)
                                                .popAndPushNamed(
                                              Admin.routeName,
                                            );
                                          }
                                        } else {
                                          for (var i = 1;
                                              i < userData.length;
                                              i++) {
                                            if ((inputtedUserName.text ==
                                                    userData[i].emailId ||
                                                inputtedUserName.text ==
                                                    userData[i]
                                                        .phoneNo
                                                        .toString())) {
                                              if (inputtedPassword.text ==
                                                  userData[i].password) {
                                                flag = i;

                                                Navigator.of(context)
                                                    .popAndPushNamed(
                                                        '/StudentHome',
                                                        arguments: ({
                                                          'id': userData[i].id,
                                                        }));
                                              }
                                            }
                                          }

                                          // if (flag == -1) {
                                          //   showAlertDialog(context);
                                          // }
                                        }
                                        setState(() {
                                          inputtedPassword.clear();
                                          inputtedUserName.clear();
                                        });
                                      },
                                      // color: Colors.lightBlueAccent[700],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      FlatButton(
                          textColor: Colors.lightBlueAccent[700],
                          child: Text('Sign Up'),
                          onPressed: () {
                            Navigator.of(context)
                                .popAndPushNamed(RegisterPage.routeName);
                          })
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
