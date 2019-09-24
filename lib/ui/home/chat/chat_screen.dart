import 'dart:async';
import 'dart:io';
//import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:your_doctor/data/chat/base/event_chat_object.dart';
import 'package:your_doctor/data/chat/message_data.dart';
import 'package:your_doctor/data/user/user_data.dart';
import 'package:your_doctor/module/messages_presenter.dart';
import 'package:your_doctor/ui/home/chat/chatmessage.dart';
import 'package:your_doctor/util/app_shared_preferences.dart';
import 'package:your_doctor/util/constant.dart';
import 'package:image_picker/image_picker.dart';

class ChatScreenTest extends StatefulWidget {
  final String myId;
  final String dr_Id;
  final String myName;
  final String myImage;

  ChatScreenTest(
      {@required this.myId,
      @required this.dr_Id,
      @required this.myName,
      @required this.myImage});

  @override
  State createState() => new ChatScreenState(
      myId: myId, dr_Id: dr_Id, myName: myName, myImage: myImage);
}

class ChatScreenState extends State<ChatScreenTest>
    with TickerProviderStateMixin
    implements MessageContract {
  ChatScreenState(
      {@required this.myId,
      @required this.dr_Id,
      @required this.myName,
      @required this.myImage}) {
    _messagePresenter = new MessagePresenter(this);
  }

  final globalKey = new GlobalKey<ScaffoldState>();

  final String myId;
  final String dr_Id;
  final String myName;
  final String myImage;
  File imageFile;
  bool isImageFile;

  String isImage = 'n';
  bool isLoading = true;
  bool isLoadingSendMessage = false;

  bool isShowSticker;
  final FocusNode focusNode = new FocusNode();
  final TextEditingController _chatController = new TextEditingController();
  final List<ChatMessage> _messagesWidgets = <ChatMessage>[];
  StreamController _messagesStreamController;
  List<Messages> listMessage = [];
  MessagePresenter _messagePresenter;
  bool isMyMessage;
  FirebaseMessaging firebaseMessaging = new FirebaseMessaging();

  @override
  void initState() {
    super.initState();

    getMessage();

    //  AppSharedPreferences.setChatOpen(true);

    focusNode.addListener(onFocusChange);
    isLoading = true;
    isImageFile = false;
    print(
        "test sending IDs 1.=.=.=.=.=..=.=.==.=.=..=.=.=.=..= sender id ism $myId And reciever Id is $dr_Id");

    _messagePresenter.loadGetMessage(myId, dr_Id);
    _messagesStreamController = new StreamController();
  }

//==============================================================================
  void getMessage() {
    firebaseMessaging.configure(
      onLaunch: (Map<String, dynamic> msg) {
        print(" onLaunch called ${(msg.containsKey("title"))}");
      },
      onResume: (Map<String, dynamic> msg) {
        print(" onResume called ${(msg)}");
      },
      onMessage: (Map<String, dynamic> msg) {
        // [String msg_from, String user_name , String msg_content, String isImage, String msg_created_at]) {
        print(" onLaunch called ${msg['data']['msg_from']}");

        _handleSubmit(
            msg['data']['sender_id'],
            msg['data']['sender_name'],
            msg['data']['msg_content'],
            msg['data']['is_image'],
            msg['data']['created_at']);
      },
    );
  }

//==============================================================================

  void onFocusChange() {
    if (focusNode.hasFocus) {
      // Hide sticker when keyboard appear
      setState(() {
        isShowSticker = false;
      });
    }
  }

  @override
  void dispose() {
    print("dispose was called");
    // AppSharedPreferences.setChatOpen(false);
    _chatController.dispose();
    super.dispose();
  }

//==============================================================================
  void _handleSubmit(
      [String sender_id,
      String sender_name,
      String msg_content,
      String isImage,
      String msg_created_at]) {

    print(
        "test get sent data\n"
            "sender_id is    ============================> ${sender_id} \n"
            "myId is         ============================> $myId\n"
            "sender name is  ============================> $sender_name \n"
            "msg content is  ============================>$msg_content");
    _chatController.clear();
    ChatMessage message = new ChatMessage(
        my_id: myId,
        sender_id: sender_id,
        msg_content: msg_content,
        date: msg_created_at,
        name: sender_name,
        isImage: isImage);
    setState(() {
      isLoading = false;
      isLoadingSendMessage = false;
      _messagesWidgets.insert(0, message);
      isImageFile = false;
    });
  }

//==============================================================================
  Future getImage() async {
    imageFile = await ImagePicker.pickImage(
        source: ImageSource.gallery,
      maxHeight: 240.0,
      maxWidth: 240.0,);

    if (imageFile != null) {
      setState(() {
        isImageFile = true;

          isImage = 'y';
          isImageFile = true;
      });
    }
  }

  Future uploadFile() async {
    var image = await ImagePicker.pickImage(
      source: ImageSource.camera,
      maxHeight: 240.0,
      maxWidth: 240.0,
    );

  }

  void _onSendMessage(String msg_content, isImage, String msg_created_at) {
    // type: 0 = text, 1 = image, 2 = sticker
    if (msg_content.trim() != '') {
      _chatController.clear();

      setState(() {
        _messagePresenter.loadSendMessage(myId, dr_Id, myName, "", msg_content,
            imageFile, isImage, msg_created_at);
        isLoadingSendMessage = true;
      });
    } else {
      Fluttertoast.showToast(msg: 'Nothing to send');
    }
  }

  String getTimeNow() {
    DateTime now = DateTime.now();
    String formattedDate;
    setState(() {
      formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);
    });
    return formattedDate;
  }

//==============================================================================
  // _handleSubmit(_chatController.text, myId, "",isImage, "ibrahim", "this/// is/// date");
  Widget buildInput() {
    return Container(
      child:isImageFile
          ? new Row(children: <Widget>[
        Container(
            width: 300,
            padding: const EdgeInsets.only(top: 8.0),
            child: ClipRRect(
              borderRadius: new BorderRadius.circular(100),
              child: Image.file(imageFile),
            )),


        Material(
          child: new Container(
            margin: new EdgeInsets.symmetric(horizontal: 8.0),
            child: new IconButton(
              icon: new Icon(Icons.send),
              onPressed: () =>
                  _onSendMessage("with image", isImage, getTimeNow()),
              color: Colors.deepOrange,
            ),
          ),
          color: Colors.white,
        ),
      ],)
          : Row(
        children: <Widget>[
          // Button send image

           Material(
                  child: new Container(
                    margin: new EdgeInsets.symmetric(horizontal: 1.0),
                    child: new IconButton(
                      icon: new Icon(Icons.image),
                      onPressed: getImage,
                      color: Colors.yellow,
                    ),
                  ),
                  color: Colors.white,
                ),
          Material(
            child: new Container(
              margin: new EdgeInsets.symmetric(horizontal: 1.0),
              child: new IconButton(
                icon: new Icon(Icons.face),
                //onPressed: getSticker,
                //color: primaryColor,
              ),
            ),
            color: Colors.white,
          ),
           Flexible(
                  child: Container(
                    child: TextField(
                      style: TextStyle(color: Colors.grey, fontSize: 15.0),
                      controller: _chatController,
                      decoration: InputDecoration.collapsed(
                        hintText: 'Type your message...',
                        hintStyle: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      focusNode: focusNode,
                    ),
                  ),
                ),

          // Button send message
          Material(
            child: new Container(
              margin: new EdgeInsets.symmetric(horizontal: 8.0),
              child: new IconButton(
                icon: new Icon(Icons.send),
                onPressed: () =>
                    _onSendMessage(_chatController.text, isImage, getTimeNow()),
                color: Colors.deepOrange,
              ),
            ),
            color: Colors.white,
          ),

          isLoadingSendMessage
              ? new Center(
                  child: new CircularProgressIndicator(
                    valueColor:
                        new AlwaysStoppedAnimation<Color>(Colors.deepOrange),
                  ),
                )
              : Container()
        ],
      ),
      width: double.infinity,
      height: 50.0,
      decoration: new BoxDecoration(
          border:
              new Border(top: new BorderSide(color: Colors.grey, width: 0.5)),
          color: Colors.white),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(),
        body: isLoading
            ? new Center(
                child: new CircularProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.indigo),
                ),
              )
            : Container(
                decoration: ThemeColors.Canvas,
                child: new Column(
                  children: <Widget>[
                    new Flexible(
                      child: ListView.builder(
                        padding: new EdgeInsets.all(8.0),
                        reverse: true,
                        itemBuilder: (_, int index) => _messagesWidgets[index],
                        itemCount: _messagesWidgets.length,
                      ),
                    ),
                    new Divider(
                      height: 1.0,
                    ),
                    new Container(
                      decoration: new BoxDecoration(
                        color: Theme.of(context).cardColor,
                      ),
                      child:
//------------------------------------------------------------------------------
                          buildInput(),
//------------------------------------------------------------------------------
                    )
                  ],
                ),
              ));
  }

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

  @override
  void onLoadMessagesError() {
    // TODO: implement onLoadMessagesError
  }

  @override
  void onLoadSendingMessageCompleted(
      EventMessageObject data) {
    setState(() {
      print(
          "test get sent data .=.=.=.=.=..=.=.==.=.=..=.=.=.=..= sender_id id ism ${data
              .object.senderId} \n"
              " And sender name Id is=========================== ${data.object
              .senderName}  and myId is $myId\n"
              "msg content is ================================${data.object
              .msgContent}");

      _handleSubmit(
          data.object.senderId.toString(),
          myName,
          data.object.msgContent,
          data.object.isImage,
          data.object.createdAt);

    });

      /* switch (data.id) {
        case EventMessageConstants.SEND_SUCCESSFUL:
          {
            setState(() {
              AppSharedPreferences.setUserLoggedIn(true);

              // _callback.onLogIn(true);
              AppSharedPreferences.setUserProfile(data.object);
              var sendFCM;
              if(data.messageResponse==1){
                sendFCM=EventFCM.SEND_SUCCESSFUL;
              }else{
                sendFCM=EventFCM.SEND_FAILED;

              }
              globalKey.currentState.showSnackBar(new SnackBar(
                content: new Text(sendFCM),
              ));

            });
          }
          break;
        case EventMessageConstants.SEND_UN_SUCCESSFUL:
          {
            setState(() {
              globalKey.currentState.showSnackBar(new SnackBar(
                content: new Text(EventFCM.SEND_FAILED),
              ));
            });
          }
          break;
        case EventMessageConstants.NO_INTERNET_CONNECTION:
          {
            setState(() {
              globalKey.currentState.showSnackBar(new SnackBar(
                content: new Text(SnackBarText.NO_INTERNET_CONNECTION),
              ));

            });
          }
          break;
      }*/

  }

  @override
  void onLoadMessagesCompleted(List<Messages> items) {
    setState(() {

      if (items.length >= 0) {
        for (var i = 0; i < items.length; i++) {
          print(
              "value=================================msg_from is ${items[i].sender_id}");
          print(
              "value=================================user_name is ${items[i].sender_name}");
          print(
              "value=================================msg_content is ${items[i].msg_content}");
          print(
              "value=================================isImage is ${items[i].isImage}");
          print(
              "value=================================msg_created_at is ${items[i].created_at}");

          /*   String user_id;
          if(items[i].sender_id==myId){
            user_id=items[i].sender_id;
          }else{
            user_id=items[i].receiver_id;

          }*/
          _handleSubmit(items[i].sender_id.toString(), items[i].sender_name,
              items[i].msg_content, items[i].isImage, items[i].created_at);
        }
      }else{
        isLoading = false;

      }

      print(
          "done================================list message size is ${items.length}");
    });
  }
}
