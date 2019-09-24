import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:your_doctor/data/chat/base/event_chat_object.dart';
import 'dart:async';
import 'dart:convert';

import 'package:your_doctor/data/chat/message_data.dart';
import 'package:your_doctor/module/messages_presenter.dart';

class ChatScreen2 extends StatefulWidget {
  @override
  _ChatScreenState createState() => new _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen2> implements MessageContract {
  StreamController _messagesController;
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  MessagePresenter _messagePresenter;

  ChatScreenState() {
    _messagePresenter = new MessagePresenter(this);
  }

  int count = 1;
  List<Messages> listMessage = [];

  showSnack() {
    return scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text('New content loaded'),
      ),
    );
  }

  Future<Null> _handleRefresh() async {
    _messagePresenter.loadGetMessage("1","2");
  }

  @override
  void initState() {
    _messagesController = new StreamController();
    _messagePresenter.loadGetMessage("1","2");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: scaffoldKey,
      appBar: new AppBar(
        title: new Text('StreamBuilder'),
        actions: <Widget>[
          IconButton(
            tooltip: 'Refresh',
            icon: Icon(Icons.refresh),
            onPressed: _handleRefresh,
          )
        ],
      ),
      body: StreamBuilder(
        stream: _messagesController.stream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          print('Has error: ${snapshot.hasError}');
          print('Has data: ${snapshot.hasData}');
          print('Snapshot Data ${snapshot.data}');

          if (snapshot.hasError) {
            return Text(snapshot.error);
          }

          if (snapshot.hasData) {
            return Column(
              children: <Widget>[
                Expanded(
                  child: Scrollbar(
                    child: RefreshIndicator(
                      onRefresh: _handleRefresh,
                      child: ListView.builder(
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          var post = snapshot.data[index];
                          return ListTile(
                            title: Text(post['title']['rendered']),
                            subtitle: Text(post['date']),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            );
          }

          if (snapshot.connectionState != ConnectionState.done) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (!snapshot.hasData &&
              snapshot.connectionState == ConnectionState.done) {
            return Text('No Posts');
          }
        },
      ),
    );
  }

  @override
  void onLoadMessagesCompleted(List<Messages> items) {
    setState(() {
      listMessage = items;
      _messagesController.add(items);
    });
  }

  @override
  void onLoadMessagesError() {
    // TODO: implement onLoadMessagesError
  }
  @override
  void onLoadSendingMessageCompleted(EventMessageObject data) {



  }
}
