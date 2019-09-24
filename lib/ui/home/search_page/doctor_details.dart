import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:your_doctor/data/doctors/doctors_data.dart';
import 'package:your_doctor/data/user/user_data.dart';
import 'package:your_doctor/module/doctors_presenter.dart';
import 'package:your_doctor/ui/home/chat/chat_screen.dart';
import 'package:your_doctor/util/app_shared_preferences.dart';
import 'package:your_doctor/util/constant.dart';

class DoctorDetailWidget extends StatefulWidget {
  final String dr_id;
  final String dr_name;
  final String dr_image;
  DoctorDetailWidget({@required this.dr_id,@required this.dr_name,@required this.dr_image});

  @override
  _DoctorDetailWidgetState createState() =>
      new _DoctorDetailWidgetState(dr_id: dr_id, dr_name: dr_name, dr_image: dr_image);
}

class _DoctorDetailWidgetState extends State<DoctorDetailWidget>
    with TickerProviderStateMixin {
  TextEditingController searchController = new TextEditingController(text: "");

  final String dr_id;
  final String dr_name;
  final String dr_image;
  String myId;
  String myName;
  String myImage;

  _DoctorDetailWidgetState({@required this.dr_id,@required this.dr_name,@required this.dr_image});

  @override
  void initState() {
    super.initState();
    _getUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        appBar: appBar(),
        body: new Container(
            decoration: ThemeColors.Canvas,
            child: new ListView(
              children: <Widget>[
                new Center(
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
//------------------------------------------------------------------------------

                      _doctorDetailsContainer(),
//------------------------------------------------------------------------------
                      _itemsDivider(context),
//------------------------------------------------------------------------------
                      _chatContainer(),
//------------------------------------------------------------------------------
                    ],
                  ),
                ),
              ],
            )));
    //new Text("name : $name\nemail : $email\nphone : $phone"));
  }


  //==============================================================================

  Future<Null> _getUserInfo() async {
    User sharedUserValue = await AppSharedPreferences.getUserProfile();
    if (sharedUserValue != null) {
      setState(() {
        myId = sharedUserValue.id.toString();


      });

    } //your home page is loaded

  }
////////////////////////////////////////////////////////////////////////////////
  _itemsDivider(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      color: Colors.grey[200],
      height: 1.0,
    );
  }

////////////////////////////////////////////////////////////////////////////////
  Widget _doctorDetailsContainer() {
    return new Container(
      child: Row(
              children: <Widget>[
                Text(dr_name),
                CircleAvatar(
                    backgroundImage: new NetworkImage(
          "http://res.cloudinary.com/kennyy/image/upload/v1531317427/avatar_z1rc6f.png")),
              ],
            ),

   /*   margin: EdgeInsets.only(
        top: 16.0,
        left: 16.0,
        right: 16.0,),*/

      //  margin: EdgeInsets.only(bottom: 2.0)
    );
  }

////////////////////////////////////////////////////////////////////////////////
  Widget _chatContainer() {
    return new Container(
        child: new FlatButton(
      splashColor: Color(0xffaaaaaa),
      color: ThemeColors.AccentColor,
      shape: StadiumBorder(),
      onPressed: () => _goToChat(),
      child: Text(
        Texts.CHAT_DOCTOR,
        style: new TextStyle(
            color: ThemeColors.white100,
            fontWeight: FontWeight.bold,
            fontSize: 16.0),
      ),
    )

        //  margin: EdgeInsets.only(bottom: 2.0)
        );
  }

////////////////////////////////////////////////////////////////////////////////
  void _goToChat() {
     Navigator.push(
      context,
     new MaterialPageRoute(builder: (context) => new ChatScreenTest(myId:myId,dr_Id: dr_id, myName: myName,myImage:myImage,)),
     );
  }

////////////////////////////////////////////////////////////////////////////////
  Widget appBar() {
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
      title: Text("your dotor"),
      backgroundColor: ThemeColors.CanvasColor,
    );
  }


}
