import 'package:flutter/material.dart';
import 'package:your_doctor/data/user/base/event_user_object.dart';
import 'package:your_doctor/data/user/user_data.dart';
import 'package:your_doctor/module/login_user_presenter.dart';
import 'package:your_doctor/ui/customviews/progress_dialog.dart';
import 'package:your_doctor/ui/home/profile/log_in/register_page.dart';
import 'package:your_doctor/ui/main_page.dart';
import 'package:your_doctor/util/app_shared_preferences.dart';
import 'package:your_doctor/util/constant.dart';
import 'forgottenPassword.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LoginPage extends StatefulWidget {
  @override
  createState() => new LoginPageState();
}

class LoginPageState extends State<LoginPage> implements LogInContract {
  final globalKey = new GlobalKey<ScaffoldState>();

  FirebaseMessaging firebaseMessaging = new FirebaseMessaging();
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      new FlutterLocalNotificationsPlugin();

  ProgressDialog progressDialog =
      ProgressDialog.getProgressDialog(ProgressDialogTitles.USER_LOG_IN);

  TextEditingController emailController = new TextEditingController(text: "");

  TextEditingController passwordController = new TextEditingController(text: "");
  String tokenValue;

  User user;
  LogInPresenter _presenter;

  LoginPageState() {
    _presenter = new LogInPresenter(this);
  }

  @override
  void initState() {
    super.initState();

    var android = new AndroidInitializationSettings('mipmap/ic_launcher');
    var ios = new IOSInitializationSettings();
    var platform = new InitializationSettings(android, ios);
    flutterLocalNotificationsPlugin.initialize(platform);

    firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(sound: true, alert: true, badge: true));
    firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings setting) {
      print('IOS Setting Registed');
    });
    firebaseMessaging.getToken().then((token) {
      tokenValue = token;
      print('token = $token');
    });
    print('token3 = $tokenValue');
  }

//------------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        key: globalKey,
        body: new Stack(
          children: <Widget>[_loginContainer(), progressDialog],
        ));
  }

//------------------------------------------------------------------------------
  Widget _loginContainer() {
    return new Container(
        padding: EdgeInsets.only(right: 24, left: 24, top: 40),
        height: double.maxFinite,
        width: double.maxFinite,
        //MediaQuery.of(context).size.height,
        decoration: ThemeColors.Canvas,
        child: SingleChildScrollView(
          child: new Column(
            children: <Widget>[
//------------------------------------------------------------------------------
              SizedBox(
                width: 200,
                height: 200,
                child: Image.asset("images/urdr.png"),
              ),
//------------------------------------------------------------------------------
              _formContainer(),
//------------------------------------------------------------------------------
            ],
          ),
        ));
  }

//------------------------------------------------------------------------------
  Widget _formContainer() {
    return new Container(
      child: new Form(
        child: new Theme(
          data: new ThemeData(primarySwatch: ThemeColors.Material_Accent_Color),
          child: new Column(
            children: <Widget>[
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------

              _emailContainer(),

              Divider(),
//------------------------------------------------------------------------------
              _passwordContainer(),
              Divider(
                height: 20,
                color: Colors.transparent,
              ),
              _forgetPasswordLabel(),

//=======================================================

              _loginButtonContainer(),
//------------------------------------------------------------------------------
              _registerNowLabel(),
//------------------------------------------------------------------------------
            ],
          ),
        ),
      ),
    );
  }

//------------------------------------------------------------------------------
  Widget _emailContainer() {
    return new Container(
      child: new TextFormField(
          style: TextStyle(
            fontSize: 14,
            fontFamily: "Cairo",
          ),
          controller: emailController,
          decoration: InputDecoration(
              hintText: Texts.EMAIL,
              hintStyle: TextStyle(
                color: ThemeColors.white80,
              ),
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              fillColor: ThemeColors.white40,
              filled: true),
          keyboardType: TextInputType.emailAddress),
      //  margin: EdgeInsets.only(bottom: 2.0)
    );
  }

//------------------------------------------------------------------------------
  Widget _passwordContainer() {
    return new Container(
      child: new TextFormField(
        controller: passwordController,
        style: TextStyle(
          fontSize: 14,
          fontFamily: "Cairo",
        ),
        decoration: InputDecoration(
            hintText: Texts.PASSWORD,
            hintStyle: TextStyle(
              color: ThemeColors.white100,
            ),
            contentPadding: EdgeInsets.fromLTRB(20.0, 8.0, 20.0, 8.0),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
            fillColor: ThemeColors.white40,
            filled: true),
        keyboardType: TextInputType.text,
        obscureText: true,
      ),
      //   margin: EdgeInsets.only(bottom: 30.0)
    );
  }

//------------------------------------------------------------------------------
  Widget _loginButtonContainer() {
    return new Container(
        width: 160,
        height: 43,
        decoration: new BoxDecoration(
            color: ThemeColors.AccentColor,
            borderRadius: BorderRadius.all(Radius.circular(22))),
        child: new MaterialButton(
          textColor: Colors.white,
          onPressed: _loginButtonAction,
          child: new Text(
            Texts.LOGIN,
            style: new TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
                fontFamily: "Cairo"),
          ),
        ),
        margin: EdgeInsets.only(bottom: 20.0, top: 10));
  }

//------------------------------------------------------------------------------
  Widget _registerNowLabel() {
    return new Container(
      height: 43,
      width: 160,
      child: OutlineButton(
          padding: EdgeInsets.only(top: 8, left: 28, right: 28, bottom: 8),
          child: Text(
            Texts.REGISTER,
            style: TextStyle(
                color: ThemeColors.white100,
                fontFamily: "Cairo",
                fontWeight: FontWeight.bold),
          ),
          shape: StadiumBorder(),
          color: ThemeColors.white100,
          onPressed: _goToRegisterScreen),
    );
  }

//------------------------------------------------------------------------------
  void _loginButtonAction() {
    if (emailController.text == "") {
      globalKey.currentState.showSnackBar(new SnackBar(
        content: new Text(SnackBarText.ENTER_EMAIL),
      ));
      return;
    }

    if (passwordController.text == "") {
      globalKey.currentState.showSnackBar(new SnackBar(
        content: new Text(SnackBarText.ENTER_PASS),
      ));
      return;
    }
    FocusScope.of(context).requestFocus(new FocusNode());
    progressDialog.showProgress();
    setState(() {
      _presenter.loadLogIn(
          emailController.text, passwordController.text);
    });

    //_loginUser(emailController.text, passwordController.text);
  }

//------------------------------------------------------------------------------
  void _loginUser(String id, String password) async {}

//------------------------------------------------------------------------------
  void _goToHomeScreen() {
    Navigator.push(
      context,
      new MaterialPageRoute(
          builder: (context) => new MainPage(
                fromBack: true,
                isLoggedIn: true,
                pagId: 2,
              )),
    );
  }

//------------------------------------------------------------------------------
  void _goToRegisterScreen() {
    Navigator.push(
      context,
      new MaterialPageRoute(builder: (context) => new RegisterPage()),
    );
  }

  @override
  void onLoadLogInCompleted(EventUserObject data) {
    // MainPageCallback _callback;

    setState(() {
      print("Data objet is : ${data.object.toString()}");
      progressDialog.hideProgress();

      switch (data.id)
      {
        case EventUserConstants.LOGIN_USER_SUCCESSFUL:
          {

            try{
              setState(() {
                AppSharedPreferences.setUserLoggedIn(true);

                // _callback.onLogIn(true);
                AppSharedPreferences.setUserProfile(data.object);
                globalKey.currentState.showSnackBar(new SnackBar(
                  content: new Text(data.messageResponse),
                ));
                progressDialog.hideProgress();
                _goToHomeScreen();
              });
            }catch(e){
              print(e.toString());//run now debging
            }

          }
          break;
        case EventUserConstants.LOGIN_USER_UN_SUCCESSFUL:
          {
            setState(() {
              globalKey.currentState.showSnackBar(new SnackBar(
                content: new Text(data.messageResponse),
              ));
              progressDialog.hideProgress();
            });
          }
          break;
        case EventUserConstants.NO_INTERNET_CONNECTION:
          {
            setState(() {
              globalKey.currentState.showSnackBar(new SnackBar(
                content: new Text(SnackBarText.NO_INTERNET_CONNECTION),
              ));
              progressDialog.hideProgress();
            });
          }
          break;

      }
    });

    // TODO: implement onLoadLogInComplete
  }

  @override
  void onLoadLogIngError() {
    // TODO: implement onLoadLogIngError
  }

//------------------------------------------------------------------------------
  _forgetPasswordLabel() {
    return Container(
      alignment: Alignment.bottomRight,
      padding: EdgeInsets.all(8),
      height: 40,
      color: Color(0x08ffffff),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ForgotPasswordPage()),
          );
        },
        child: Text(
          Texts.ForgotPassword,
          textAlign: TextAlign.right,
          style: TextStyle(color: ThemeColors.white100, fontSize: 12),
        ),
      ),
    );
  }
}
