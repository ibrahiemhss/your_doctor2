import 'dart:async';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:your_doctor/data/user/user_data.dart';
import 'package:your_doctor/util/constant.dart';

class AppSharedPreferences {
///////////////////////////////////////////////////////////////////////////////
  static Future<SharedPreferences> getInstance() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs;
  }

///////////////////////////////////////////////////////////////////////////////
  static Future<void> clear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

///////////////////////////////////////////////////////////////////////////////
  static Future<bool> isUserLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(SharedPreferenceKeys.IS_USER_LOGGED_IN);
  }

///////////////////////////////////////////////////////////////////////////////

  static Future<void> setUserLoggedIn(bool isLoggedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool(SharedPreferenceKeys.IS_USER_LOGGED_IN, isLoggedIn);
  }

///////////////////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////////////////////
  static Future<bool> isChatOpen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(SharedPreferenceKeys.IS_CHAT_OPENED);
  }

///////////////////////////////////////////////////////////////////////////////

  static Future<void> setChatOpen(bool isOpened) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool(SharedPreferenceKeys.IS_CHAT_OPENED, isOpened);
  }

///////////////////////////////////////////////////////////////////////////////


  static Future<User> getUserProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return User.fromJson(
        json.decode(prefs.getString(SharedPreferenceKeys.USER)));
  }

  static Future<void> setUserProfile(User user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userProfileJson = json.encode(user);
    return prefs.setString(SharedPreferenceKeys.USER, userProfileJson);
  }
}
