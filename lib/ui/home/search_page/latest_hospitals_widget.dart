import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:your_doctor/util/constant.dart';

class LatestHospitalsWidget extends StatefulWidget {
  @override
  _LatestHospitalsState createState() => new _LatestHospitalsState();
}

class _LatestHospitalsState extends State<LatestHospitalsWidget>
    with TickerProviderStateMixin {
  Color _recentlyColor = Colors.blueGrey;
  Color _clearColor = Colors.blueGrey;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: Container(
          child: new Theme(
              data: new ThemeData(
                  primarySwatch: ThemeColors.Material_Accent_Color),
              child: new Column(
                children: <Widget>[
//------------------------------------------------------------------------------
                  _recomeded(),
                ],
              ))),
    );
  }

  Widget _recomeded() {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, left: 8.0, right: 8.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
              decoration: new BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              child: new MaterialButton(
                textColor: _recentlyColor,
                padding: EdgeInsets.all(15.0),
                onPressed: () {
                  setState(() {
                    _clearColor = Colors.grey;
                    _recentlyColor = Colors.greenAccent;
                  });
                },
                child: new Text(
                  Texts.RECENTLY,
                ),
              ),
              margin: EdgeInsets.only(bottom: 30.0)),
          Container(
              decoration: new BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              child: new MaterialButton(
                textColor: _clearColor,
                padding: EdgeInsets.all(15.0),
                onPressed: () {
                  setState(() {
                    _clearColor = Colors.greenAccent;
                    _recentlyColor = Colors.grey;
                  });
                },
                child: new Text(
                  Texts.CLEAR,
                ),
              ),
              margin: EdgeInsets.only(bottom: 30.0)),
        ],
      ),
    );
  }
}
