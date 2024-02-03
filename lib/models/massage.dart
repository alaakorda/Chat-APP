import 'package:chat/constants.dart';

class Massage {
  final String message;
  final String id;
  Massage(this.message, this.id);
  factory Massage.fromJson(jsonData) {
    return Massage(jsonData[KMessage], jsonData['id']);
  }
}
