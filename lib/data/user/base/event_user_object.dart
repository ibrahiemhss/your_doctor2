import 'package:your_doctor/util/constant.dart';

class EventUserObject {
  int id;//ok
  String messageResponse;

  Object object;

  EventUserObject(
      {this.id: EventUserConstants.NO_INTERNET_CONNECTION,
      this.messageResponse,
      this.object: null});
}
