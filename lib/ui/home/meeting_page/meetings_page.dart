import 'package:flutter/material.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:your_doctor/ui/customviews/gradientContainer.dart';
import 'package:your_doctor/util/constant.dart';

class MeetingsPage extends StatefulWidget {
  @override
  _MeetingsState createState() => new _MeetingsState();
}

class _MeetingsState extends State<MeetingsPage> with TickerProviderStateMixin {
  final List<Tab> tabs = <Tab>[
    new Tab(text: "حجوزات"),
    new Tab(text: "مراجعات")
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: tabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: ThemeColors.Canvas,
            // alignment: Alignment.center,

            height: MediaQuery.of(context).size.height,

            ///================================
            child: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  ///============================
                  SliverAppBar(
                    bottom: TabBar(
                      isScrollable: true,
                      unselectedLabelColor: ThemeColors.white40,
                      labelColor: ThemeColors.white100,
                      labelStyle: new TextStyle(
                          fontSize: 28.0,
                          color: ThemeColors.white100,
                          fontFamily: "Cairo",
                          fontWeight: FontWeight.w700),
                      indicatorSize: TabBarIndicatorSize.tab,
                      tabs: tabs,
                      controller: _tabController,
                    ),
                    backgroundColor: Colors.transparent,
                    expandedHeight: 20.0,
                    floating: true,
                    pinned: false,
                  )

                  ///==============================================
                ];
              },
              body: TabBarView(controller: _tabController, children: <Widget>[
                Grad(
                  child: Center(
                    child: Text(
                      "لا يوجد مواعيد محجوزة حاليا",
                      style: TextStyle(
                        color: ThemeColors.white100,
                      ),
                    ),
                  ),
                ),
                Grad(
                  child: Center(
                    child: Text(
                      "لا يوجد مراجعات  حاليا",
                      style: TextStyle(
                        color: ThemeColors.white100,
                      ),
                    ),
                  ),
                ),
              ]),
            )));
  }
} //
