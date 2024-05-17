import 'dart:io';

class ModelClass {
  String? name;
  String? chat;
  File? Image;
  String? number;
  var Date;
  var Time;

  ModelClass(
      {required this.name,
      required this.chat,
      required this.Image,
      required this.number,
      this.Date,
      this.Time});

  factory ModelClass.fromJson(Map<String, dynamic> map) {
    return ModelClass(
      name: map["name"],
      chat: map["chat"],
      Image: map["Image"],
      number: map["number"],
      Date: map["Date"],
      Time: map["Time"],
    );
  }
}
