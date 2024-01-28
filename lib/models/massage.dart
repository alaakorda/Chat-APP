import 'package:chat/constants.dart';

class Massage {
  final String message;
  final String id;
  Massage(this.message, this.id);
  factory Massage.formJson(jsonData) {
    return Massage(jsonData[KMessage], jsonData['id']);
  }
}
