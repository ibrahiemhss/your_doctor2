import 'dart:async';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:async/async.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart';

import 'package:your_doctor/data/chat/base/event_chat_object.dart';
import 'package:your_doctor/data/chat/base/message_body_data.dart';
import 'package:your_doctor/data/chat/internet/api_message_request.dart';
import 'package:your_doctor/data/chat/internet/api_message_response.dart';
import 'package:your_doctor/data/chat/message_data.dart';
import 'package:your_doctor/util/constant.dart';

class MockSendMessageRepository implements SendingMessageRepository {





  @override
  Future<EventMessageObject> sendMessage(String sender_id, String receiver_id,
      String sender_name, String reciver_name,String msg_content,File msg_pic_file,  String isImage,String msg_created_at)
  async {
    if (msg_pic_file == null) {
      var queryParameters = {
        APIOperations.SENDER_ID: sender_id,
        APIOperations.RECEVER_ID: receiver_id.toString(),
        APIOperations.MSG_SENDER_NAME: sender_name,
        APIOperations.MSG_CONTENT: msg_content,
        APIOperations.MSG_PIC: msg_pic_file != null ? 'data:image/png;base64,' +
            base64Encode(await msg_pic_file.readAsBytesSync()) : '',
        APIOperations.MSG_IS_IMAGE: isImage,
        APIOperations.CREATED_AT: "",

      };

      //id: id,
      //  text: text);


      try {
        final encoding = APIConstants.OCTET_STREAM_ENCODING;
        final response = await http.post(APIConstants.Api_SEND_MESSAGE_URL,
            body: queryParameters, encoding: Encoding.getByName(encoding));
        print("send response json is ================> ${response.toString()}");
        if (response != null) {
          if (response.statusCode == APIResponseCode.SC_OK &&
              response.body != null) {
            final responseJson = json.decode(response.body);
            ApiMessageResponse apiResponse =
            ApiMessageResponse.fromJson(responseJson);
            if (apiResponse.messageBody.messageStatus == 1) {
              return new EventMessageObject(
                  id: EventMessageConstants.SEND_SUCCESSFUL,
                  object: apiResponse.messageBody);
            }else {
              return new EventMessageObject(
                  id: EventMessageConstants.SEND_UN_SUCCESSFUL);
            }
          } else {
            return new EventMessageObject(
                id: EventMessageConstants.SEND_UN_SUCCESSFUL);
          }
        } else {
          return new EventMessageObject();
        }
      } catch (Exception) {
        print(
            "errorIn SendMessage =========>============>=========>is => ${Exception
                .toString()}");

        return EventMessageObject();
      }


//=============================================================================
    } else {
      var uri = Uri.parse(APIConstants.Api_SEND_MESSAGE_URL);

      // to byte stream
      var stream = new http.ByteStream(
          DelegatingStream.typed(msg_pic_file.openRead()));

      // get length for http post
      var length = await msg_pic_file.length();

      // string to uri

      // new multipart request
      var request = new http.MultipartRequest("POST", uri);
      var result;


      request.fields[APIOperations.SENDER_ID] = sender_id.toString();
      request.fields[APIOperations.RECEVER_ID] = receiver_id;
      request.fields[APIOperations.MSG_SENDER_NAME] = sender_name;
      request.fields[APIOperations.MSG_CONTENT] = msg_content;
      request.fields[APIOperations.MSG_IS_IMAGE] = isImage;
      request.fields[APIOperations.CREATED_AT] = isImage;

      var multipartFile = new http.MultipartFile('pic', stream, length,
          filename: basename(msg_pic_file.path),
          contentType: new MediaType('image', 'png'));

      // add multipart form to request
      request.files.add(multipartFile);

      // send request
      var response = await request.send();

      await response.stream.transform(utf8.decoder).listen((value) {
        print("send response json with image is ================> ${value}");
        result = value;
      });
      try {
        if (response != null) {
          if (response.statusCode == APIResponseCode.SC_OK &&
              response.stream != null) {
            final responseJson = json.decode(result);
            ApiMessageResponse apiResponse =
            ApiMessageResponse.fromJson(responseJson);
            if (apiResponse.messageBody.messageStatus == 1) {
              return new EventMessageObject(
                  id: EventMessageConstants.SEND_SUCCESSFUL,
                  object: apiResponse.messageBody);
            } else {
              return new EventMessageObject(
                  id: EventMessageConstants.SEND_UN_SUCCESSFUL);
            }
          } else {
            return new EventMessageObject(
                id: EventMessageConstants.SEND_UN_SUCCESSFUL);
          }
        } else {
          return new EventMessageObject();
        }
      } //catch (Exception) {
      catch (Exception) {
        print(
            "errorIn SendMessage =========>============>=========>is => ${Exception
                .toString()}");

        return EventMessageObject();
      }
    }
    // TODO: implement sendMessage


// TODO: implement fetchteColors

  }
}
