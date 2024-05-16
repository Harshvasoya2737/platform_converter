import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:platform_converter/controller/platform_change_provider.dart';
import 'package:platform_converter/model/modelclass.dart';

class ContactPage extends StatefulWidget {
  String? name;
  String? number;
  String? chat;
  File? image;
  int? index;
  var date;
  var time;

  ContactPage(
      {super.key,
      this.name,
      this.number,
      this.chat,
      this.image,
      this.time,
      this.date,
      this.index});

  @override
  State<ContactPage> createState() => _ContactPageState();
}
var formatedDate;
var datepicker;
var formateTime;
var date;
var time;

class _ContactPageState extends State<ContactPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController chatController = TextEditingController();
  TextEditingController nameIosController = TextEditingController();
  TextEditingController numberIosController = TextEditingController();
  TextEditingController chatIosController = TextEditingController();

  var iosDate;
  var iosTime;

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var isAndroid =
        Provider.of<platformProvider>(context, listen: false).isAndroid;
    final providerVar = Provider.of<platformProvider>(context, listen: true);
    var width = MediaQuery.of(context).size.width;

    if (isAndroid) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(children: [
                (providerVar.addImage != null)
                    ? CircleAvatar(
                        radius: 70,
                        backgroundImage: FileImage(providerVar.addImage!),
                      )
                    : Container(
                        height: 145,
                        width: 145,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Color(0xffEADBFC)),
                        child: IconButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    content: Container(
                                      width: 220,
                                      height: 105,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Icon(Icons.photo_library_outlined),
                                                SizedBox(width: 10,),
                                                ElevatedButton(onPressed: () {
                                                  providerVar
                                                      .getAlbumsImage();
                                                  Navigator.of(context)
                                                      .pop();
                                                }, child: Text("Choose from Gallery")),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Icon(Icons.camera),
                                                SizedBox(width: 10,),
                                                ElevatedButton(onPressed: () {
                                                  providerVar
                                                      .getCameraImage();
                                                  Navigator.of(context)
                                                      .pop();
                                                }, child: Text("Choose from Camera")),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                });
                          },
                          icon: Icon(
                            Icons.add_a_photo_outlined,
                            size: 30,
                          ),
                        ),
                      ),
                SizedBox(
                  height: 35,
                ),
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    labelText: 'Enter Full Name',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            style: BorderStyle.solid,
                            color: Colors.black,
                            width: 4)),
                  ),
                  keyboardType: TextInputType.text,
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: numberController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.call),
                      labelText: 'Enter Phone Number',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              style: BorderStyle.solid,
                              color: Colors.black,
                              width: 4))),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: chatController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.chat_outlined),
                      labelText: 'Enter Chat Conversation',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              style: BorderStyle.solid,
                              color: Colors.black,
                              width: 4))),
                  keyboardType: TextInputType.text,
                ),
                SizedBox(
                  height: 12,
                ),
                InkWell(
                  onTap: () async {
                    date = await showDatePicker(
                        context: context,
                        firstDate: DateTime(1990),
                        lastDate: DateTime(3000),
                        initialDate: DateTime.now());
                    if (date != null) {
                      setState(() {
                        formatedDate = DateFormat('dd/MM/yyyy').format(date);
                      });
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 11.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.date_range_outlined,
                          size: 26,
                        ),
                        SizedBox(
                          width: 14,
                        ),
                        (formatedDate == null)
                            ? Text(
                                'Pick Date',
                                style: TextStyle(fontSize: 16),
                              )
                            : Text(
                                formatedDate,
                                style: TextStyle(fontSize: 16),
                              ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                InkWell(
                  onTap: () async {
                    time = await showTimePicker(
                        context: context, initialTime: TimeOfDay.now());
                    print(time.format(context));
                    if (time != null) {
                      datepicker = DateTime(
                          DateTime.now().year,
                          DateTime.now().month,
                          DateTime.now().day,
                          time.hour,
                          time.minute);
                      setState(() {
                        formateTime = DateFormat('HH:mm').format(datepicker);
                      });

                      print(formateTime);
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 11.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          size: 26,
                        ),
                        SizedBox(
                          width: 14,
                        ),
                        (formateTime == null)
                            ? Text('Pick Time', style: TextStyle(fontSize: 16))
                            : Text(formateTime, style: TextStyle(fontSize: 16)),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (providerVar.addImage != null) {
                        if (formkey.currentState!.validate()) {
                          var snackbar = SnackBar(
                            content: Center(child: Text('Submit Successful')),
                            duration: Duration(seconds: 1),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackbar);
                          ModelClass Data = ModelClass(
                              name: nameController.text,
                              number: numberController.text,
                              chat: chatController.text,
                              Image: providerVar.addImage,
                              Date: formatedDate,
                              Time: formateTime);
                          providerVar.addContactData(Data);
                          nameController.clear();
                          numberController.clear();
                          chatController.clear();
                          providerVar.addImage = null;
                          formatedDate = null;
                          formateTime = null;
                        }
                      } else {
                        var snackbar = SnackBar(
                            content: Center(child: Text('PLEASE ADD DETAIL.')),
                            duration: Duration(seconds: 1));
                        ScaffoldMessenger.of(context).showSnackBar(snackbar);
                      }
                    },
                    child: Text(
                      'SAVE',
                      style: TextStyle(fontSize: 17),
                    )),
              ]),
            ),
          ),
        ),
      );
    } else {
      return Form(
        key: formkey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 200),
            child: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: (providerVar.addImage != null)
                        ? CircleAvatar(
                            radius: 50,
                            backgroundImage: FileImage(providerVar.addImage!),
                          )
                        : Container(
                            height: 140,
                            width: 140,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.blue),
                            child: CupertinoButton(
                                child: Icon(
                                  CupertinoIcons.camera,
                                  size: 36,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  showCupertinoModalPopup(
                                      context: context,
                                      builder: (context) {
                                        return CupertinoAlertDialog(
                                          content: Container(
                                            width: 220,
                                            height: 105,
                                            child: Padding(
                                              padding:
                                              const EdgeInsets.only(top: 8.0),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Icon(Icons.photo_library_outlined),
                                                      SizedBox(width: 10,),
                                                      ElevatedButton(onPressed: () {
                                                        providerVar
                                                            .getAlbumsImage();
                                                        Navigator.of(context)
                                                            .pop();
                                                      }, child: Text("Choose from Gallery")),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Icon(Icons.camera),
                                                      SizedBox(width: 10,),
                                                      ElevatedButton(onPressed: () {
                                                        providerVar
                                                            .getCameraImage();
                                                        Navigator.of(context)
                                                            .pop();
                                                      }, child: Text("Choose from Camera")),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      });
                                }))),
                SizedBox(
                  height: 15,
                ),
                CupertinoTextFormFieldRow(
                  controller: nameIosController,
                  padding: EdgeInsets.zero,
                  prefix: Icon(
                    Icons.person_outline_outlined,
                    size: 30,
                  ),
                  placeholder: 'Enter Full Name ',
                  keyboardType: TextInputType.text,
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 1,
                          color: (providerVar.isTheme == false)
                              ? Colors.black38
                              : Colors.white38),
                      borderRadius: BorderRadiusDirectional.circular(6)),
                ),
                SizedBox(
                  height: 15,
                ),
                CupertinoTextFormFieldRow(
                  controller: numberIosController,
                  padding: EdgeInsets.zero,
                  prefix: Icon(
                    CupertinoIcons.phone,
                    size: 30,
                  ),
                  placeholder: 'Enter Phone Number',
                  keyboardType: TextInputType.number,
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 1,
                          color: (providerVar.isTheme == false)
                              ? Colors.black38
                              : Colors.white38),
                      borderRadius: BorderRadiusDirectional.circular(6)),
                ),
                SizedBox(
                  height: 15,
                ),
                CupertinoTextFormFieldRow(
                  controller: chatIosController,
                  padding: EdgeInsets.zero,
                  prefix: Icon(
                    CupertinoIcons.chat_bubble_text,
                    size: 30,
                  ),
                  placeholder: 'Enter Chat Conversation',
                  keyboardType: TextInputType.text,
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 1,
                          color: (providerVar.isTheme == false)
                              ? Colors.black38
                              : Colors.white38),
                      borderRadius: BorderRadiusDirectional.circular(6)),
                ),
                SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () {
                    showCupertinoModalPopup(
                      context: context,
                      builder: (context) {
                        return Container(
                            height: 300,
                            color: Colors.white,
                            child: CupertinoDatePicker(
                              onDateTimeChanged: (DateTime value) {
                                setState(() {
                                  iosDate =
                                      DateFormat('dd/MM/yyyy').format(value);
                                });
                              },
                              mode: CupertinoDatePickerMode.date,
                              use24hFormat: false,
                              initialDateTime: DateTime.now(),
                            ));
                      },
                    );
                    print(iosDate);
                  },
                  child: Container(
                    child: Row(
                      children: [
                        Icon(
                          CupertinoIcons.calendar,
                          size: 30,
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        (iosDate != null)
                            ? Text(iosDate.toString())
                            : Text('PickDate')
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () {
                    showCupertinoModalPopup(
                      context: context,
                      builder: (context) {
                        return Container(
                            height: 300,
                            color: Colors.white,
                            child: CupertinoDatePicker(
                              onDateTimeChanged: (DateTime value) {
                                setState(() {
                                  iosTime = DateFormat('HH:mm').format(value);
                                });
                              },
                              mode: CupertinoDatePickerMode.time,
                              use24hFormat: false,
                              initialDateTime: DateTime.now(),
                            ));
                      },
                    );
                    print(iosTime);
                  },
                  child: Row(
                    children: [
                      Icon(
                        CupertinoIcons.time,
                        size: 30,
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      (iosTime != null)
                          ? Text(iosTime.toString())
                          : Text('PickTime')
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                CupertinoButton(
                  onPressed: () {
                    if (providerVar.addImage != null) {
                      if (formkey.currentState!.validate()) {
                        ModelClass Data = ModelClass(
                            name: nameIosController.text,
                            number: numberIosController.text,
                            chat: chatIosController.text,
                            Image: providerVar.addImage,
                            Date: iosDate,
                            Time: iosTime);
                        providerVar.addContactData(Data);
                        nameIosController.clear();
                        numberIosController.clear();
                        chatIosController.clear();
                        providerVar.addImage = null;
                        iosDate = null;
                        iosTime = null;
                      }
                    }
                  },
                  color: Colors.blue,
                  child: Text('SAVE'),
                )
              ],
            ),
          ),
        ),
      );
    }
  }
}
