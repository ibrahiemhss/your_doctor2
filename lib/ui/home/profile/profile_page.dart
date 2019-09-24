import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:your_doctor/data/user/user_data.dart';
import 'package:your_doctor/ui/customviews/gradientContainer.dart';
import 'package:your_doctor/ui/home/profile/log_in/register_page.dart';
import 'package:your_doctor/ui/home/profile/more_options_widget.dart';
import 'package:your_doctor/util/app_shared_preferences.dart';
import 'package:your_doctor/util/constant.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => new _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with TickerProviderStateMixin {
  String email;
  int phone;
  int id;

  bool isLoaded = true;

  bool isLogedIn = false;

  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  Future<Null> _checkIsLogin() async {
    User sharedUserValue = await AppSharedPreferences.getUserProfile();
    if (sharedUserValue != null) {
      if (await AppSharedPreferences.isUserLoggedIn() == true) {
        setState(() {
          isLogedIn = true;
          email = sharedUserValue.email;
          phone = sharedUserValue.phone;
          id = sharedUserValue.id;
          isLoaded = true;
          //isLogedIn = true;
        });
      } else {
        setState(() {

          isLogedIn = false;
          isLoaded = true;
        });
      } //your home page is loaded
    }
  }

  @override
  void initState() {
    super.initState();
    _checkIsLogin();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        body: !isLoaded
            ? Center(
                child: new CircularProgressIndicator(
                valueColor: new AlwaysStoppedAnimation<Color>(Colors.indigo),
              ))
            : !isLogedIn
                ? WelcomeNewUser()
                : new Container(
                    child: new ListView(
                    children: <Widget>[
                      new Center(
                        child: new Column(
                          children: <Widget>[
//------------------------------------------------------------------------------
                           // _countInfo(name, email, imgUrl),//TODO remimber this
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
                            MoreOptionWidget()
//------------------------------------------------------------------------------
                          ],
                        ),
                      ),
                    ],
                  )));
    //new Text("name : $name\nemail : $email\nphone : $phone"));
  }

////////////////////////////////////////////////////////////////////////////////
  Widget WelcomeNewUser() {
    return Container(
      decoration: ThemeColors.Canvas,
      height: double.maxFinite,
      width: double.maxFinite,
      child: Column(
        textDirection: TextDirection.rtl,
        children: <Widget>[
          Divider(
            height: 100,
          ),
          Text(
            "اهلاً بكم",
            style: TextStyle(
              color: Colors.amber,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Divider(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "يرجى تسجيل الدخول لتتمكن من الاستفادة من خدماتنا..سائلين المولى دوام العافية على الجميع ",
              style: TextStyle(
                color: ThemeColors.white80,
              ),
            ),
          ),
          Divider(
            height: 30,
            color: Colors.transparent,
          ),
          new FlatButton(
            splashColor: Color(0xffaaaaaa),
            color: ThemeColors.AccentColor,
            shape: StadiumBorder(),
            onPressed: () => _goToCreateCount(),
            child: Text(
              Texts.REGISTER_NOW,
              style: new TextStyle(
                  color: ThemeColors.white100,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0),
            ),
          ),
        ],
      ),
    );
  }

////////////////////////////////////////////////////////////////////////////////
  void _goToCreateCount() {
    Navigator.push(
      context,
      new MaterialPageRoute(builder: (context) => new RegisterPage()),
    );
  }
}

////////////////////////////////////////////////////////////////////////////////
Widget _countInfo(String name, String email, String imageUrl) {
  return Padding(
    padding: const EdgeInsets.only(top: 8.0),
    child: Align(
      alignment: Alignment.centerLeft,
      child: new Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //--------------------------------------------------------------------
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                width: 96.0,
                height: 96.0,
                child:
                    CircleAvatar(backgroundImage: new NetworkImage(imageUrl))),
          ),
          //--------------------------------------------------------------------
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    name,
                    style: TextStyle(
                        fontSize: 32.0,
                        color: ThemeColors.PrimaryColor_Dark,
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w900),
                  ),
                ),
                Container(alignment: Alignment.centerLeft, child: Text(email)),
                Container(
                  height: 32,
                  margin: const EdgeInsets.only(top: 8.0),

                  decoration: new BoxDecoration(
                    border: new Border.all(color: Colors.grey[300]),
                    borderRadius: BorderRadius.all(Radius.circular(
                            16.0) //                 <--- border radius here
                        ),
                  ),
                  //------------------------------------------------------------

                  child: RawMaterialButton(
                    // fillColor: Colors.grey,
                    //splashColor: Colors.blueGrey,
                    highlightColor: Colors.grey,
                    elevation: 0.0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 6.0, horizontal: 30.0),
                      child: const Text(
                        'EDIT PROFILE',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w900),
                      ),
                    ),
                    shape: const StadiumBorder(),

                    //------------------------------------------------------------

                    onPressed: null,

                    //------------------------------------------------------------
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
}
