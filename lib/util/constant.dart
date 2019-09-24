import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:path/path.dart';

class APIConstants {
  static const String OCTET_STREAM_ENCODING = "application/octet-stream";

  // static const String API_BASE_URL = "https://hafinse.000webhostapp.com";
  static const  API_BASE_URL = "http://urdocapi.com/api/v1/";
  static const  API_LOGIN_URL = "http://urdocapi.com/api/v1/login";
  static const  Api_REGISTER_URL = "http://urdocapi.com/api/v1/register";
  static const  Api_SEND_MESSAGE_URL = "${API_BASE_URL}/FCM/sendMessage.php";
  static const Api_GET_MESSAGES_URL = "${API_BASE_URL}/FCM/chat.php";
  static const  Api_GET_ALL_DOCTORS_URL = "${API_BASE_URL}/login/getAllUsers.php";

}

///////////////////////////////////////////////////////////////////////////////
class APIOperations {
  static const String LOGIN = "login";
  static const String REGISTER = "register";
  static const String CHANGE_PASSWORD = "chgPass";
  static const String SEND_MESSAGE = "send_message";

//------query parameters And Response JSON Messages----------------------------

  static const String ERROR = "error";
  static const String ERROR_MESSAGE = "error_msg";
  static const String MESSAGE_STATUS = "message_status";
  static const String FCM_FAILURE = "failure";


  static const String TRUE = "true";
  static const bool FALSE = false;
  static const String SUCCESS = "success";
  static const String MESSAGE_BODY = "message";

  static const String SUCCESS_MESSAGE = "success_msg";

  static const String FAILURE = "failure";

  static const String ID = "id";

  //for data in register and log in
  static const String EMAIL = "email";
  static const String First_name = "firstname";
  static const String LastName = "lastname";

  static const String PHONE = "phone";
  static const String PASSWORD = "password";

  static const String IMAGE_URL = "image_url";
  static const String TOKEN = "token";
  static const String LANG = "lang";
  static const String PLACE = "place";


  //for data in chat
  static const String USER_ID = "user_id";

 // if(isset($_POST['sender_id'])
  static const String SENDER_ID = "sender_id";

 // and isset($_POST['reciver_name'])
  static const String MSG_RECIEVER_NAME = "reciver_name";

 // and isset($_POST['receiver_id'])and
  static const String RECEVER_ID = "receiver_id";


  static const String MSG_SENDER_NAME = "sender_name";

 // isset($_POST['msg_content'])
  static const String MSG_CONTENT = "msg_content";

  // isset($_POST['is_image'])
  static const String MSG_IS_IMAGE = "is_image";

  //and isset($_POST['created_at']))
  static const String CREATED_AT = "created_at";
  static const String MSG_PIC = "pic";

  static const String USER = "user";
  static const String MSG = "msg";

}

///////////////////////////////////////////////////////////////////////////////
class APIResponse {
  static const String REGISTER = "register";
  static const String CHANGE_PASSWORD = "chgPass";
  static const String FALSE = "false";
  static const String TRUE = "true";
  static const String SUCCESS = "success";
  static const String FAILURE = "failure";
}

///////////////////////////////////////////////////////////////////////////////
class EventUserConstants {
  static const int NO_INTERNET_CONNECTION = 0;

///////////////////////////////////////////////////////////////////////////////
  static const int LOGIN_USER_SUCCESSFUL = 500;
  static const int LOGIN_USER_UN_SUCCESSFUL = 501;

///////////////////////////////////////////////////////////////////////////////
  static const int USER_REGISTRATION_SUCCESSFUL = 502;
  static const int USER_REGISTRATION_UN_SUCCESSFUL = 503;
  static const int USER_ALREADY_REGISTERED = 504;
  static const int ELSE_EVENT = 2 ;
///////////////////////////////////////////////////////////////////////////////
  static const int CHANGE_PASSWORD_SUCCESSFUL = 505;
  static const int CHANGE_PASSWORD_UN_SUCCESSFUL = 506;
  static const int INVALID_OLD_PASSWORD = 507;
///////////////////////////////////////////////////////////////////////////////
}

///////////////////////////////////////////////////////////////////////////////
class EventMessageConstants {
  static const int NO_INTERNET_CONNECTION = 3;

///////////////////////////////////////////////////////////////////////////////
  static const int SEND_SUCCESSFUL = 300;
  static const int SEND_UN_SUCCESSFUL = 301;
}

///////////////////////////////////////////////////////////////////////////////
class APIResponseCode {
  static const int SC_OK = 200;
}
///////////////////////////////////////////////////////////////////////////////

class SharedPreferenceKeys {
  static const String IS_USER_LOGGED_IN = "IS_USER_LOGGED_IN";
  static const String USER = "USER";
  static const String IS_CHAT_OPENED = "IS_OPENED";

}

///////////////////////////////////////////////////////////////////////////////

class EventFCM {
  static const String SEND_SUCCESSFUL = "SUCCESS NOTIFY";
  static const String SEND_FAILED = "FAILED TO SEND NOTIFY";
}
///////////////////////////////////////////////////////////////////////////////
class ProgressDialogTitles {
  static const String IN_PROGRESS = "جاري ...";
  static const String USER_LOG_IN = "جاري التسجيل...";
  static const String USER_CHANGE_PASSWORD = "جاري التغيير";
  static const String USER_REGISTER = "جاري التسجيل ...";
}

///////////////////////////////////////////////////////////////////////////////
class SnackBarText {
  static const String NO_INTERNET_CONNECTION = "لا يوجد اتصال !!";
  static const String LOGIN_SUCCESSFUL = "نجحت عملية تسجيل الدخول";
  static const String LOGIN_UN_SUCCESSFUL = "فشل تسجيل الدخول";
  static const String CHANGE_PASSWORD_SUCCESSFUL = "تم تغيير كبمة المرور بنجاح";
  static const String CHANGE_PASSWORD_UN_SUCCESSFUL =
      "فشل عملية تغيير كلمة المرور";
  static const String REGISTER_SUCCESSFUL = "تم التسجيل بنجاح";
  static const String REGISTER_UN_SUCCESSFUL = "فشل عملية التسجيل";
  static const String USER_ALREADY_REGISTERED =
      "الحساب موجود من قبل مستخدم آخر";
  static const String ENTER_PASS = "يرجى ادخال كلمة المرور";
  static const String ENTER_NEW_PASS = "ادخل كلمة المرور الجديدة";
  static const String ENTER_OLD_PASS = "ادخل كلمة المرور القديمة";
  static const String ENTER_EMAIL = "ادخل بريدك الالكتروني";
  static const String ENTER_VALID_MAIL = "ادخل بريدك الالكتروني بشكل صحيح";
  static const String ENTER_NAME = "يرجى ادخال الاسم";
  static const String INVALID_OLD_PASSWORD = "كلمة المرور القديمة خاطئة";
}

///////////////////////////////////////////////////////////////////////////////
class Texts {
  static const String REGISTER_NOW = "حساب جديد ؟";
  static const String LOGIN_NOW = " سجل دخول!";
  static const String LOGIN = "تسجيل دخول";
  static const String REGISTER = "حساب جديد";
  static const String PHONE = " الهاتف";

  static const String PASSWORD = "كلمة المرور";
  static const String OLD_PASSWORD = "كلمة المرور القديمة";
  static const String NEW_PASSWORD = "كلمة المرور الجديدة";
  static const String CHANGE_PASSWORD = "نغيير كلمة المرور";
  static const String LOGOUT = "تسجيل خروج";
  static const String EMAIL = "البريد الالكتروني";
  static const String NAME = "الاسم";
  static const String RECENTLY = "عُرِض مؤخراٌ";
  static const String CLEAR = "مسح";
  static const String ForgotPasswordMsg =
      " قم بادخال عنوان البريد الالكتروني \n سيتم ارسال رابط اعادة ضبط كلمة المرور الى بريدك الالكتروني";
  static const String ForgotPassword = "نسيت كلمة المرور ؟";

  static const String SEARCH = "بحث متقدم";
  static const String CHAT_DOCTOR = "مراسلة الطبيب";
}

////////////////////////////////////////////
final ThemeData kIOSTheme = new ThemeData(
  primarySwatch: Colors.orange,
  primaryColor: Colors.grey[100],
  primaryColorBrightness: Brightness.light,
);

final ThemeData kDefaultTheme = ThemeData.light();
final Color shimmerBaseColor = Colors.black; /*Colors.white;*/
final Color shimmerHighlightColor = Colors.grey[200]; /*Colors.grey[700];*/

bool isIOS(BuildContext context) {
  return Theme.of(context).platform == TargetPlatform.iOS;
}

class ThemeColors {
  static const Color PrimaryColor_Dark = Color(0xff003B55);
  static const Color PrimaryColor = Color(0xff005A82);
  static const Color PrimaryColor60 = Color(0xff007EB7);

  static const Color white100 = Color(0xffffffff);
  static const Color white80 = Color(0xbbffffff);
  static const Color white60 = Color(0x99ffffff);
  static const Color white40 = Color(0x44ffffff);
  static const Color white22 = Color(0x22ffffff);
  static const Color Material_Accent_Color = Colors.teal;
  static const Color AccentColor = Color(0xff00BABB);
  static const Color ShadowColor = Color(0x44000000);
  static const CanvasColor = Color(0xff005A82);

  ///gradient Canvas Color /////
  static BoxDecoration Canvas = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment(0, 1), //
      colors: [const Color(0xFF003B55), const Color(0xaa005B5B)],
      tileMode: TileMode.clamp,
    ),
  );

  /// ====================================

}
///////////////////////////////////////////////////
