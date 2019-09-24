import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:your_doctor/data/user/base/event_user_object.dart';
import 'package:your_doctor/module/register_user_presenter.dart';
import 'package:your_doctor/ui/customviews/progress_dialog.dart';
import 'package:your_doctor/ui/home/profile/log_in/login_page.dart';
import 'package:your_doctor/util/constant.dart';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class RegisterPage extends StatefulWidget {
  @override
  createState() => new _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>
    implements RegisterUserContract {
  FirebaseMessaging firebaseMessaging = new FirebaseMessaging();
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      new FlutterLocalNotificationsPlugin();

  final globalKey = new GlobalKey<ScaffoldState>();
  File _image;
  bool isGotFile = false;
  String tokenValue;

  ProgressDialog progressDialog =
      ProgressDialog.getProgressDialog(ProgressDialogTitles.USER_REGISTER);

  TextEditingController nameController = new TextEditingController(
    text: "",
  );
  TextEditingController tokenController = new TextEditingController(text: "");
  TextEditingController langController = new TextEditingController(text: "");

  TextEditingController emailController = new TextEditingController(text: "");

  TextEditingController passwordController =
      new TextEditingController(text: "");
  TextEditingController phoneController = new TextEditingController(text: "");

  TextEditingController placeController = new TextEditingController(text: "");
  TextEditingController areaController = new TextEditingController(text: "");
  TextEditingController buildingController =
      new TextEditingController(text: "");

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

  bool isValidEmail(String em) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = new RegExp(p);

//------------------------------------------------------------------------------
    return regExp.hasMatch(em);
  }

//------------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        key: globalKey,
        backgroundColor: ThemeColors.CanvasColor,
        body: new Stack(
          children: <Widget>[_loginContainer(), progressDialog],
        ));
  }

//------------------------------------------------------------------------------
  Widget _loginContainer() {
    return new Container(
        decoration: ThemeColors.Canvas,
        child: new ListView(
          children: <Widget>[
            new Center(
              child: new Column(
                children: <Widget>[
                  _imageUser(isGotFile),
//------------------------------------------------------------------------------
                  _formContainer(),
//------------------------------------------------------------------------------
                ],
              ),
            ),
          ],
        ));
  }

//------------------------------------------------------------------------------
  Widget _imageUser(bool isGotFile) {
    return !isGotFile
        ? SizedBox()
        : new Container(
            width: 300,
            padding: const EdgeInsets.only(top: 8.0),
            child: ClipRRect(
              borderRadius: new BorderRadius.circular(100),
              child: Image.file(_image),
            ));
  }

//------------------------------------------------------------------------------
  Widget _formContainer() {
    return new Container(
      child: new Form(
          child: new Theme(
              data: new ThemeData(
                  fontFamily: "Cairo",
                  primarySwatch: ThemeColors.Material_Accent_Color),
              child: SingleChildScrollView(
                child: new Column(
                  children: <Widget>[
//------------------------------------------------------------------------------
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 40.0, left: 16.0, bottom: 20.0),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            width: 150,
                            height: 150,
                            child: Image.asset("images/urdr.png"),
                          ),
                          _nameContainer(),
//------------------------------------------------------------------------------
                          _emailContainer(),
//------------------------------------------------------------------------------
                          _phoneContainer(),
//------------------------------------------------------------------------------
                          _passwordContainer(),
//------------------------------------------------------------------------------
                          //    _cameraButton(),
//------------------------------------------------------------------------------
                        ],
                      ),
                    ),
//------------------------------------------------------------------------------

                    _registerButtonContainer(),
                    _loginNowLabel(),

//------------------------------------------------------------------------------
                  ],
                ),
              ))),
      margin: EdgeInsets.only(
        top: 20.0,
        left: 25.0,
        right: 25.0,
      ),
    );
  }

//------------------------------------------------------------------------------
  Widget _nameContainer() {
    return new Container(
        child: new TextFormField(
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.right,
            style: TextStyle(fontFamily: "Cairo", fontSize: 14),
            controller: nameController,
            decoration: InputDecoration(
                hintText: "الاسم الاول",
                hintStyle: TextStyle(
                  color: ThemeColors.white80,
                ),
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                fillColor: ThemeColors.white40,
                filled: true),
            keyboardType: TextInputType.text),
        margin: EdgeInsets.only(bottom: 5.0));
  }

//------------------------------------------------------------------------------
  Widget _emailContainer() {
    return new Container(
        child: new TextFormField(
            controller: emailController,
            decoration: InputDecoration(
                icon: Icon(
                  LineAwesomeIcons.at,
                  color: ThemeColors.PrimaryColor_Dark,
                ),
                labelText: Texts.EMAIL,
                labelStyle: TextStyle(fontSize: 18.0)),
            keyboardType: TextInputType.emailAddress),
        margin: EdgeInsets.only(bottom: 20.0));
  }

//------------------------------------------------------------------------------
  Widget _phoneContainer() {
    return new Container(
        child: new TextFormField(
          controller: phoneController,
          decoration: InputDecoration(
              icon: Icon(
                Icons.phone,
                color: ThemeColors.PrimaryColor_Dark,
              ),
              labelText: Texts.PHONE,
              labelStyle: TextStyle(fontSize: 18.0)),
          keyboardType: TextInputType.text,
          obscureText: true,
        ),
        margin: EdgeInsets.only(bottom: 30.0));
  }

//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
  Widget _passwordContainer() {
    return new Container(
        child: new TextFormField(
          controller: passwordController,
          decoration: InputDecoration(
              icon: Icon(
                Icons.lock_outline,
                color: ThemeColors.PrimaryColor_Dark,
              ),
              labelText: Texts.PASSWORD,
              labelStyle: TextStyle(fontSize: 18.0)),
          keyboardType: TextInputType.text,
          obscureText: true,
        ),
        margin: EdgeInsets.only(bottom: 30.0));
  }

//------------------------------------------------------------------------------
  Future getImage() async {
    var image = await ImagePicker.pickImage(
      source: ImageSource.gallery,
    );

    setState(() {
      _image = image;
      isGotFile = true;
    });
  }

//------------------------------------------------------------------------------
  Widget _cameraButton() {
    return new RawMaterialButton(
      fillColor: Colors.white,
      splashColor: Colors.blueGrey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text(
              'ADD YOUR IMAGE',
              style: TextStyle(color: ThemeColors.PrimaryColor_Dark),
            ),
            const SizedBox(
              width: 8.0,
            ),
            const Icon(
              LineAwesomeIcons.camera,
              color: ThemeColors.PrimaryColor_Dark,
            ),
          ],
        ),
      ),
      onPressed: () {
        getImage();
      },
      shape: const StadiumBorder(),
    );
  }

//------------------------------------------------------------------------------
  Widget _registerButtonContainer() {
    return new Container(
        width: 125,
        decoration: new BoxDecoration(
          color: ThemeColors.PrimaryColor_Dark,
        ),
        child: new FlatButton(
          shape: StadiumBorder(),
          textColor: Colors.white,
          // padding: EdgeInsets.all(15.0),
          onPressed: () {
            setState(() {
              _registerButtonAction();
            });
          },
          child: new Text(
            Texts.REGISTER,
            style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
          ),
        ),
        margin: EdgeInsets.only(bottom: 30.0));
  }

//------------------------------------------------------------------------------
  Widget _loginNowLabel() {
    return new GestureDetector(
      onTap: _goToLoginScreen,
      child: new Container(
          child: Row(
            children: <Widget>[
              Text("You already have an account !!"),
              new Text(
                Texts.LOGIN_NOW,
                style: TextStyle(
                    fontSize: 16.0,
                    color: ThemeColors.AccentColor,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          margin: EdgeInsets.only(bottom: 30.0)),
    );
  }

  ///------------------------------------------------------------------------------
  void _registerButtonAction() {
    RegisterPresenter _presenter;

    setState(() {
      _presenter = new RegisterPresenter(this);
    });

    if (nameController.text == "") {
      globalKey.currentState.showSnackBar(new SnackBar(
        content: new Text(SnackBarText.ENTER_NAME),
      ));
      return;
    }

    if (emailController.text == "") {
      globalKey.currentState.showSnackBar(new SnackBar(
        content: new Text(SnackBarText.ENTER_EMAIL),
      ));
      return;
    }

    if (!isValidEmail(emailController.text)) {
      globalKey.currentState.showSnackBar(new SnackBar(
        content: new Text(SnackBarText.ENTER_VALID_MAIL),
      ));
      return;
    }

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

    FocusScope.of(context).requestFocus(new FocusNode());
    progressDialog.showProgress();

    setState(() {
      _presenter.loadRegister(
          nameController.text,
          nameController.text,
          emailController.text,
          phoneController.text,
        passwordController.text);
    });

  }

//------------------------------------------------------------------------------
  /* void _registerUser(String name, String emailId, String password) async {
    EventObject eventObject = await registerUser(name, emailId, password);
    switch (eventObject.id) {
      case EventConstants.USER_REGISTRATION_SUCCESSFUL:
        {
          setState(() {
            globalKey.currentState.showSnackBar(new SnackBar(
              content: new Text(SnackBarText.REGISTER_SUCCESSFUL),
            ));
            progressDialog.hideProgress();
            _goToLoginScreen();
          });
        }
        break;
      case EventConstants.USER_ALREADY_REGISTERED:
        {
          setState(() {
            globalKey.currentState.showSnackBar(new SnackBar(
              content: new Text(SnackBarText.USER_ALREADY_REGISTERED),
            ));
            progressDialog.hideProgress();
          });
        }
        break;
      case EventConstants.USER_REGISTRATION_UN_SUCCESSFUL:
        {
          setState(() {
            globalKey.currentState.showSnackBar(new SnackBar(
              content: new Text(SnackBarText.REGISTER_UN_SUCCESSFUL),
            ));
            progressDialog.hideProgress();
          });
        }
        break;
      case EventConstants.NO_INTERNET_CONNECTION:
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
  }
*/
//------------------------------------------------------------------------------

  void _goToLoginScreen() {
    Navigator.push(
      context,
      new MaterialPageRoute(builder: (context) => new LoginPage()),
    );
  }

  @override
  void onLoadRegisterCompleted(EventUserObject data) {
    switch (data.id) {
      case EventUserConstants.USER_REGISTRATION_SUCCESSFUL:
        {
          setState(() {
           globalKey.currentState.showSnackBar(new SnackBar(
              content: new Text(data.messageResponse.toString()),
            ));
            progressDialog.hideProgress();
            _goToLoginScreen();
           print("Data is : ${data.id}");
          });
        }
        break;
      case EventUserConstants.USER_ALREADY_REGISTERED:
        {
          setState(() {
            globalKey.currentState.showSnackBar(new SnackBar(
              content: new Text(data.messageResponse.toString()),
            ));
            progressDialog.hideProgress();
            print("Data is : ${data.id}");
          });
        }
        break;
      case EventUserConstants.USER_REGISTRATION_UN_SUCCESSFUL:
        {
          setState(() {
           globalKey.currentState.showSnackBar(new SnackBar(
              content: new Text(data.messageResponse.toString()),
            ));
            progressDialog.hideProgress();
           print("Data is : ${data.id}");
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
            print("Data is : ${data.id}");
          });
        }
        break;
    }
    // TODO: implement onLoadRegisterCompleted
  }

  @override
  void onLoadRegisterError() {
    // TODO: implement onLoadRegisterError
  }
//------------------------------------------------------------------------------
}
