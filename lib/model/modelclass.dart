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
}
