import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:your_doctor/util/constant.dart';

class SearchByWidget extends StatefulWidget {
  final String searchVal;

  SearchByWidget({@required this.searchVal});

  @override
  _SearchByState createState() => new _SearchByState(searchVal: searchVal);
}

class _SearchByState extends State<SearchByWidget>
    with TickerProviderStateMixin {
  final String searchVal;

  _SearchByState({@required this.searchVal});

  bool _isDataLoaded = false;
  bool _loadRecenlty = false;

  Color _recentlyColor = Colors.blueGrey;
  Color _clearColor = Colors.blueGrey;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: new Theme(
          data: new ThemeData(primarySwatch: ThemeColors.Material_Accent_Color),
          child: new Column(
            children: <Widget>[
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
            ],
          )),
    );
  }

///////////////////////////////////////////////////////////////////////////////
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
                    _loadRecenlty = true;
                    _isDataLoaded = false;
                  });
                },
                child: new Text(
                  Texts.RECENTLY,
                ),
              ),
              margin: EdgeInsets.only(bottom: 8.0)),
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
              margin: EdgeInsets.only(bottom: 8.0)),
        ],
      ),
    );
  }
}
