import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:your_doctor/util/constant.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  get emailController => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: ThemeColors.Canvas,
          // alignment: Alignment.center,

          height: MediaQuery.of(context).size.height,
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  backgroundColor: Colors.transparent,
                  expandedHeight: 150.0,
                  floating: true,
                  pinned: false,
                  flexibleSpace: FlexibleSpaceBar(
                      background: Image.asset(
                    "images/urdr.png",
                    fit: BoxFit.fitHeight,
                    alignment: Alignment.center,
                  )),
                ),
              ];
            },
            body: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(20, 50, 20, 0),
              child: Column(
                children: <Widget>[
                  ///============================== ,

                  Divider(height: 50),

                  Text(
                    Texts.ForgotPasswordMsg,
                    style: TextStyle(color: ThemeColors.white100),
                    textAlign: TextAlign.center,
                  ),

                  ///==============================
                  Divider(height: 40, color: Colors.transparent),

                  ///==========================
                  ///  text field
                  ///
                  ///
                  TextFormField(
                      controller: emailController,
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: "Cairo",
                      ),
                      decoration: InputDecoration(
                          hintText: Texts.EMAIL,
                          hintStyle: TextStyle(
                            color: ThemeColors.white80,
                          ),
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 8.0, 20.0, 8.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)),
                          fillColor: ThemeColors.white40,
                          filled: true),
                      keyboardType: TextInputType.emailAddress),

                  ///======================================
                  Divider(
                    height: 30,
                  ),

                  ///====================Button====================
                  Container(
                    width: 125,
                    child: new FlatButton(
                      splashColor: Color(0xffaaaaaa),
                      color: ThemeColors.AccentColor,
                      shape: StadiumBorder(),
                      onPressed: () {},
                      child: Text(
                        "ارسـال",
                        style: new TextStyle(
                            color: ThemeColors.white100,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0),
                      ),
                    ),
                  ),

                  ///=======================================================
                ],
              ),
            ),
          )),
    );
  }
}
