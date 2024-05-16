import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

import '../model/modalclass.dart';

class platformProvider with ChangeNotifier {
  bool isAndroid = Platform.isAndroid;

  void changePlatform(bool isAndroid) {
    this.isAndroid = isAndroid;
    notifyListeners();
  }

  TextEditingController editName = TextEditingController();
  TextEditingController editNumber = TextEditingController();
  TextEditingController editChat = TextEditingController();
  File? editImage;
  var editDate;
  var editTime;
  int? editIndex;

  bool isTheme = false;
  bool proData = false;

  File? addImage;
  File? proImage;

  TextEditingController proNameController = TextEditingController();
  TextEditingController proBioController = TextEditingController();

  getAlbumsImage() async {
    var pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      addImage = File(pickedFile.path);
    }
    notifyListeners();
  }

  getCameraImage() async {
    var pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      addImage = File(pickedFile.path);
    }
    notifyListeners();
  }

  profileAlbumsImage() async {
    var proFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (proFile != null) {
      proImage = File(proFile.path);
    }
    notifyListeners();
  }

  profileCameraImage() async {
    var proFile = await ImagePicker().pickImage(source: ImageSource.camera);
    if (proFile != null) {
      proImage = File(proFile.path);
    }
    notifyListeners();
  }

  editAlbumImage() async {
    var pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      editImage = File(pickedFile.path);
    }
    notifyListeners();
  }

  editCamera() async {
    var pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      editImage = File(pickedFile.path);
    }
    notifyListeners();
  }

  List<ModelClass> contactData = [];

  //for theme-----------------------------------------------------------
  set setTheme(value) {
    isTheme = value;
    notifyListeners();
  }

  get getTheme {
    return isTheme;
  }

  //for profile Data
  set setProfile(value) {
    proData = value;
    notifyListeners();
  }

  get getProfile {
    return proData;
  }

  addContactData(ModelClass Data) {
    contactData.add(Data);
    notifyListeners();
  }

  editContactData(ModelClass Data, index) {
    contactData[index] = (Data);
    notifyListeners();
  }

  deleteContactData(index) {
    contactData.removeAt(index);
    notifyListeners();
  }
}