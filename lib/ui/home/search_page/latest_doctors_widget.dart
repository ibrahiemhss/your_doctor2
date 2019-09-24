import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:your_doctor/data/doctors/doctors_data.dart';
import 'package:your_doctor/module/doctors_presenter.dart';
import 'package:your_doctor/ui/home/search_page/doctor_details.dart';
import 'package:your_doctor/util/constant.dart';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'dart:ui' as ui;

class DoctorsWidget extends StatefulWidget {
  _DoctorsWidgetState createState() => new _DoctorsWidgetState();
}

class _DoctorsWidgetState extends State<DoctorsWidget>
    implements DoctorsContract {
  List<String> selectedItems = [];
  List<Doctors> _listDoctors;
  DoctorsPresenter _doctorsPresenter;

  FirebaseMessaging firebaseMessaging = new FirebaseMessaging();

  // FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  //new FlutterLocalNotificationsPlugin();

  bool _isLoading;
  int quantity = 1;

  // final List<MaterialColor> _colors = [Colors.blue, Colors.indigo, Colors.red];

  _DoctorsWidgetState() {
    _doctorsPresenter = new DoctorsPresenter(this);
  }

  @override
  void initState() {
    super.initState();
    _isLoading = true;
    _doctorsPresenter.loadAllDoctors();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Container(
      child: _isLoading
          ? new Center(
              child: new CircularProgressIndicator(
                valueColor: new AlwaysStoppedAnimation<Color>(Colors.indigo),
              ),
            )
          : _hometWidget(),
    ));
  }

  Widget _hometWidget() {
    double _width = MediaQuery.of(context).size.width;

    print(_width.toString());
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.center,

      children: <Widget>[
//------------------------------------------------------------------------------
        _doctorsCardListItem(context)
//------------------------------------------------------------------------------
      ],
    );
  }

//------------------------------------------------------------------------------
  //===========================================================
  Widget _doctorsCardListItem(BuildContext context) {
    double _containe_width;
    double _container_lis_height;
    double _container_item_height;

    final mediaQueryData = MediaQuery.of(context);
    if (mediaQueryData.orientation == Orientation.landscape) {
      _container_lis_height = MediaQuery.of(context).size.width / 4;
      _container_item_height = MediaQuery.of(context).size.width / 8;
    } else {
      _container_lis_height = MediaQuery.of(context).size.height / 4;
      _container_item_height = MediaQuery.of(context).size.height / 8;
    }
    // if(_sections !=null){

    return new Flexible(
      child: Container(
        height: _container_lis_height,
        color: Colors.transparent,
        child: SizedBox.expand(
          child: ListView.builder(
            itemCount: _listDoctors.length,
            itemBuilder: (BuildContext context, int index) {
              final Doctors lastDoctors = _listDoctors[index];
              // final MaterialColor color = _colors[i % _colors.length];
              return InkWell(
                  onTap: () {
                    _goToDetailsDoctorsWidget(lastDoctors.id,lastDoctors.name,lastDoctors.img);
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 4.0, right: 4.0, left: 4.0),
                    child: Container(
                      child: Column(

                          //  mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 4.0, right: 4.0),
                              child: Container(
                                height: _container_item_height,
                                width: _container_item_height,
                                color: Colors.transparent,
                                child: CircleAvatar(
                                  backgroundImage: new NetworkImage(
                                      //      lastDoctors.doctor_img)
                                      "http://res.cloudinary.com/kennyy/image/upload/v1531317427/avatar_z1rc6f.png"),
                                ),
                              ),
                            ),
                            Text(
                              lastDoctors.name,
                              style: TextStyle(color: Colors.indigo[900]),
                            ),
                          ]),
                    ),
                  ));
            },
            scrollDirection: Axis.horizontal,
          ),
        ),
      ),
    );
  }

//------------------------------------------------------------------------------
  void _goToDetailsDoctorsWidget(String id,String name,String image) {
    Navigator.push(
      context,
      new MaterialPageRoute(
          builder: (context) => new DoctorDetailWidget(
                dr_id: id, dr_name: name, dr_image: image,
              )),
    );
  }

//------------------------------------------------------------------------------

  Widget appBar(String title) {
    IconData _backIcon() {
      switch (Theme.of(context).platform) {
        case TargetPlatform.android:
        case TargetPlatform.fuchsia:
          return Icons.arrow_back;
        case TargetPlatform.iOS:
          return Icons.arrow_back_ios;
      }
      assert(false);
      return null;
    }

    return AppBar(
      elevation: 0,
      leading: IconButton(
        icon: Icon(_backIcon()),
        color: Colors.white,
        alignment: Alignment.centerLeft,
        tooltip: 'Back',
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Text(title),
      backgroundColor: ThemeColors.CanvasColor,
    );
  }

//==============================================================================

  @override
  void onLoadDoctorsCompleted(List<Doctors> items) {
    // TODO: implement onLoadDoctorsCompleted
    setState(() {
      _listDoctors = items;
      _isLoading = false;
    });
  }

  @override
  void onLoadDoctorsError() {
    // TODO: implement onLoadDoctorsError
  }

  @override
  void onLoadDoctorDetialsCompleted(Doctors item) {
    // TODO: implement onLoadDoctorDetialsCompleted
  }
}
