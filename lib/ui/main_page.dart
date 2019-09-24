import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:your_doctor/data/user/user_data.dart';
import 'package:your_doctor/ui/customviews/gradientContainer.dart';
import 'package:your_doctor/ui/home/chat/chat_screen.dart';
import 'package:your_doctor/ui/home/chat_support/chat2.dart';
import 'package:your_doctor/ui/home/chat_support/test_caht.dart';
import 'package:your_doctor/ui/home/home_page/home_screen_page.dart';
import 'package:your_doctor/ui/home/meeting_page/meetings_page.dart';
import 'package:your_doctor/ui/home/profile/profile_page.dart';
import 'package:your_doctor/ui/home/search_page/search_page.dart';
import 'package:your_doctor/ui/main_app_bar.dart';
import 'package:your_doctor/util/app_shared_preferences.dart';
import 'package:your_doctor/util/constant.dart';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class MainPage extends StatefulWidget {
  int pagId = 0;
  bool fromBack = false;
  bool isLoggedIn;

  MainPage(
      {@required this.isLoggedIn,
      @required this.fromBack,
      @required this.pagId});

  @override
  _ScreenOneState createState() => new _ScreenOneState(
      isLoggedIn: isLoggedIn, fromBack: fromBack, pagId: pagId);
}

const List<String> tabNames = const <String>[
  'Home',
  'Search',
  'Cart',
  'Profile',
  'More'
];

abstract class MainScreenCallBack {
  void onLogInSuccessfully(bool loggedIn);

  void onError(String message);
}

//==============================================================================
const jsonCodec = const JsonCodec(
  reviver: _reviver, /*toEncodable:_toEncodable*/
);

_reviver(key, value) {
  if (key != null && value is Map && key.contains("")) {
    return new Todo.fromJson(value);
  }

  return value;
}

class Todo {
  String title;
  String message;
  List<String> data;

  Todo(this.title, this.message, this.data);

  Todo.fromJson(Map value) {
    title = value["title"];
    message = value["message"];
    data = value["data"];
  }

  Map toJson() {
    return {"title": title, "message": message};
  }
}

/*_toEncodable(Todo todo) {

    return {"title":todo.title,"message":todo.message};
}*/
//==============================================================================
class _ScreenOneState extends State<MainPage> implements MainScreenCallBack {
  int pagId;
  bool isChatOpened = false;
  bool isLoggedIn = false;
  bool fromBack = false;
  String name;
  String email;
  String phone;
  String message;
  String title;
  static String tokenValue;
  FirebaseMessaging firebaseMessaging = new FirebaseMessaging();
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      new FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();

    if (fromBack) {
      _currentIndex = pagId;
      userName = name;
      userEmail = email;
      userPhone = phone;
    }
    _getLogInStatus();
    var android = new AndroidInitializationSettings('mipmap/ic_launcher');
    var ios = new IOSInitializationSettings();
    var platform = new InitializationSettings(android, ios);
    flutterLocalNotificationsPlugin.initialize(platform);

    firebaseMessaging.configure(
      onLaunch: (Map<String, dynamic> msg) {
        print(" onLaunch called ${(msg.containsKey("title"))}");
      },
      onResume: (Map<String, dynamic> msg) {
        print(" onResume called ${(msg)}");
      },
      onMessage: (Map<String, dynamic> msg) {
        showNotification(msg);
        print(" onMessage called ${(msg['data']['title'])}");
      },
    );
    firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(sound: true, alert: true, badge: true));
    firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings setting) {
      print('IOS Setting Registed');
    });
    firebaseMessaging.getToken().then((token) {
      update(token);
      print('token = $token');
    });
  }

  showNotification(Map<String, dynamic> msg) async {
    var android = new AndroidNotificationDetails(
      'sdffds dsffds',
      "CHANNLE NAME",
      "channelDescription",
    );
    var iOS = new IOSNotificationDetails();
    var platform = new NotificationDetails(android, iOS);
    await flutterLocalNotificationsPlugin.show(
        0, "رساله من", msg['data']['msg_content'], platform);
  }

  update(String token) {
    print(token);
    //DatabaseReference databaseReference = new FirebaseDatabase().reference();
    //databaseReference.child('fcm-token/${token}').set({"token": token});
    tokenValue = token;
    setState(() {});
  }

  Future<User> user = AppSharedPreferences.getUserProfile();
  static String userName;
  static String userEmail;
  static String userPhone;

  _ScreenOneState(
      {@required this.isLoggedIn,
      @required this.pagId,
      @required this.fromBack});

// static bool isLogedIn=false;

  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeScreenPage(),
    SearchPage(),
    MeetingsPage(),
    ProfilePage(),
    Text("comming soon"),
    // Chat(peerId: "1", peerAvatar: "ibrahim",)
  ];

  Future<bool> _getChatOpened() async {}

  Future<bool> _getLogInStatus() async {
    if (await AppSharedPreferences.isUserLoggedIn() == true) {
      setState(() {
        isLoggedIn = true;
      });
    } else {
      setState(() {
        isLoggedIn = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        actions: <Widget>[
          Container(
              child: MainBarWidget(
            onPressedBell: () {},
            onPressedChat: () {},
            isCreatingAccount: isLoggedIn,
          ))
        ],
      ),

      // setting canvasColor to transparent
      backgroundColor: ThemeColors.PrimaryColor_Dark,

      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 24,
        type: BottomNavigationBarType.shifting,
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            activeIcon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            title: Text(
              'الرئيسية',
              style: TextStyle(color: Colors.white),
            ),
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            title: Text(
              'بحث',
              style: TextStyle(color: Colors.white),
            ),
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.event_note,
              color: Colors.white,
            ),
            icon: Icon(
              Icons.event_note,
              color: Colors.white,
            ),
            title: Text(
              'مواعيدي',
              style: TextStyle(color: Colors.white),
            ),
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            title: Text(
              'حسابي',
              style: TextStyle(color: Colors.white),
            ),
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.menu,
              color: Colors.white,
            ),
            icon: Icon(
              Icons.menu,
              color: Colors.white,
            ),
            title: Text(
              'المزيد',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;

      if (index == 4) {
        setState(() {
          // _showModalSheet();
        });
      }
    });
  }

  @override
  void onLogInSuccessfully(bool loggedIn) {
    // TODO: implement onLogInSuccessfully
    setState(() {
      isLoggedIn = loggedIn;
    });
  }

  @override
  void onError(String message) {
    // TODO: implement onError
    print(message);
  }
}
