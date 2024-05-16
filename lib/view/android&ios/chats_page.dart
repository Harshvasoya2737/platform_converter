import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:platform_converter/controller/platform_change_provider.dart';
import 'package:platform_converter/model/modelclass.dart';
import 'package:platform_converter/view/android&ios/add_contact_page.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  var iosTime;
  var iosDate;

  @override
  Widget build(BuildContext context) {
    var isAndroid =
        Provider.of<platformProvider>(context, listen: false).isAndroid;
    final providerVar = Provider.of<platformProvider>(context, listen: true);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    if (isAndroid) {
      return SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: height,
              width: width,
              child: (providerVar.contactData.isEmpty)
                  ? Center(child: Text('No any chats yet...'))
                  : ListView.builder(
                      itemCount: providerVar.contactData.length,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 300,
                          height: 85,
                          child: ListTile(
                            onTap: () {
                              showModalBottomSheet(
                                shape: OutlineInputBorder(),
                                context: context,
                                builder: (context) {
                                  return Container(
                                    width: width,
                                    height: 320,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: CircleAvatar(
                                            radius: 60,
                                            backgroundImage: FileImage(
                                                providerVar
                                                    .contactData[index].Image!),
                                          ),
                                        ),
                                        Text(
                                          providerVar.contactData[index].name!,
                                          style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          providerVar.contactData[index].chat!,
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Center(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              IconButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                    providerVar.editName.text =
                                                        providerVar
                                                            .contactData[index]
                                                            .name!;
                                                    providerVar
                                                            .editNumber.text =
                                                        providerVar
                                                            .contactData[index]
                                                            .number!;
                                                    providerVar.editChat.text =
                                                        providerVar
                                                            .contactData[index]
                                                            .chat!;
                                                    providerVar.editImage =
                                                        providerVar
                                                            .contactData[index]
                                                            .Image!;
                                                    providerVar.editDate =
                                                        providerVar
                                                            .contactData[index]
                                                            .Date!;
                                                    providerVar.editTime =
                                                        providerVar
                                                            .contactData[index]
                                                            .Time!;
                                                    providerVar.editIndex =
                                                        index;

                                                    showDialog(
                                                      context: context,
                                                      builder: (context) {
                                                        return SingleChildScrollView(
                                                          child: AlertDialog(
                                                            content: SizedBox(
                                                              height: 550,
                                                              width: width,
                                                              child: Column(
                                                                  children: [
                                                                    (providerVar.editImage !=
                                                                            null)
                                                                        ? InkWell(
                                                                            onTap:
                                                                                () {
                                                                              showDialog(
                                                                                  context: context,
                                                                                  builder: (context) {
                                                                                    return AlertDialog(
                                                                                      content: Container(
                                                                                        width: 220,
                                                                                        height: 104,
                                                                                        child: Padding(
                                                                                          padding: const EdgeInsets.only(top: 8.0),
                                                                                          child: Column(
                                                                                            children: [
                                                                                              Row(
                                                                                                children: [
                                                                                                  Icon(Icons.photo_library_outlined),
                                                                                                  SizedBox(width: 10,),
                                                                                                  ElevatedButton(
                                                                                                      onPressed: () {
                                                                                                        providerVar.getAlbumsImage();
                                                                                                        Navigator.of(context).pop();
                                                                                                      },
                                                                                                      child: Text("Choose from Gallery")),
                                                                                                ],
                                                                                              ),
                                                                                              Row(
                                                                                                children: [
                                                                                                  Icon(Icons.camera),
                                                                                                  SizedBox(width: 10,),
                                                                                                  ElevatedButton(
                                                                                                      onPressed: () {
                                                                                                        providerVar.getCameraImage();
                                                                                                        Navigator.of(context).pop();
                                                                                                      },
                                                                                                      child: Text("Choose from Camera")),
                                                                                                ],
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  });
                                                                            },
                                                                            child:
                                                                                CircleAvatar(
                                                                              radius:
                                                                                  60,
                                                                              backgroundImage:
                                                                                  FileImage(providerVar.editImage!),
                                                                            ),
                                                                          )
                                                                        : Container(
                                                                            height:
                                                                                115,
                                                                            width:
                                                                                115,
                                                                            decoration: BoxDecoration(
                                                                                shape: BoxShape.circle,
                                                                                color: Colors.black12),
                                                                            child:
                                                                                IconButton(
                                                                              onPressed:
                                                                                  () {},
                                                                              icon:
                                                                                  Icon(
                                                                                CupertinoIcons.add,
                                                                                size: 60,
                                                                                color: Colors.blue,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                    SizedBox(
                                                                      height: 10,
                                                                    ),
                                                                    TextFormField(
                                                                      controller:
                                                                          providerVar
                                                                              .editName,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        prefixIcon:
                                                                            Icon(Icons
                                                                                .person_outline_rounded),
                                                                        labelText:
                                                                            ' Enter Full Name',
                                                                        border: OutlineInputBorder(
                                                                            borderSide: BorderSide(
                                                                                style: BorderStyle.solid,
                                                                                color: Colors.black,
                                                                                width: 4)),
                                                                      ),
                                                                      keyboardType:
                                                                          TextInputType
                                                                              .text,
                                                                    ),
                                                                    SizedBox(
                                                                      height: 15,
                                                                    ),
                                                                    TextFormField(
                                                                      controller:
                                                                          providerVar
                                                                              .editNumber,
                                                                      decoration: InputDecoration(
                                                                          prefixIcon:
                                                                              Icon(Icons
                                                                                  .call),
                                                                          labelText:
                                                                              'Enter Phone Number',
                                                                          border: OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                  style: BorderStyle.solid,
                                                                                  color: Colors.black,
                                                                                  width: 4))),
                                                                      keyboardType:
                                                                          TextInputType
                                                                              .number,
                                                                    ),
                                                                    SizedBox(
                                                                      height: 15,
                                                                    ),
                                                                    TextFormField(
                                                                      controller:
                                                                          providerVar
                                                                              .editChat,
                                                                      decoration: InputDecoration(
                                                                          prefixIcon:
                                                                              Icon(Icons
                                                                                  .chat_outlined),
                                                                          labelText:
                                                                              'Enter Chat Conversation',
                                                                          border: OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                  style: BorderStyle.solid,
                                                                                  color: Colors.black,
                                                                                  width: 4))),
                                                                      keyboardType:
                                                                          TextInputType
                                                                              .text,
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsets
                                                                          .only(
                                                                          right:
                                                                              158),
                                                                      child: Text(
                                                                          "Choose Date"),
                                                                    ),
                                                                    InkWell(
                                                                      onTap:
                                                                          () async {
                                                                        date = await showDatePicker(
                                                                            context:
                                                                                context,
                                                                            firstDate: DateTime(
                                                                                1990),
                                                                            lastDate: DateTime(
                                                                                3000),
                                                                            initialDate:
                                                                                DateTime.now());
                                                                        print(
                                                                            date);
                                                                        if (date !=
                                                                            null) {
                                                                          setState(
                                                                              () {
                                                                            formatedDate = (date != null)
                                                                                ? DateFormat('dd/MM/yyyy').format(date)
                                                                                : providerVar.editDate;
                                                                          });
                                                                        }
                                                                      },
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsets
                                                                            .all(
                                                                            8.0),
                                                                        child:
                                                                            Row(
                                                                          children: [
                                                                            Icon(Icons
                                                                                .date_range_outlined),
                                                                            (formatedDate == null)
                                                                                ? Text(
                                                                                    providerVar.editDate,
                                                                                    style: TextStyle(fontSize: 14),
                                                                                  )
                                                                                : Text(
                                                                                    formatedDate,
                                                                                    style: TextStyle(fontSize: 14),
                                                                                  ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsets
                                                                          .only(
                                                                          right:
                                                                              158),
                                                                      child: Text(
                                                                          "Choose Time"),
                                                                    ),
                                                                    InkWell(
                                                                      onTap:
                                                                          () async {
                                                                        time = await showTimePicker(
                                                                            context:
                                                                                context,
                                                                            initialTime:
                                                                                TimeOfDay.now());
                                                                        print(time
                                                                            .format(
                                                                                context));
                                                                        if (time !=
                                                                            null) {
                                                                          datepicker = DateTime(
                                                                              DateTime.now().year,
                                                                              DateTime.now().month,
                                                                              DateTime.now().day,
                                                                              time.hour,
                                                                              time.minute);
                                                                          setState(
                                                                              () {
                                                                            formateTime = (datepicker != null)
                                                                                ? DateFormat('HH:mm').format(datepicker)
                                                                                : providerVar.editTime;
                                                                          });

                                                                          print(
                                                                              formateTime);
                                                                        }
                                                                      },
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsets
                                                                            .all(
                                                                            8.0),
                                                                        child:
                                                                            Row(
                                                                          children: [
                                                                            Icon(Icons
                                                                                .access_time),
                                                                            (formateTime == null)
                                                                                ? Text(
                                                                                    providerVar.editTime,
                                                                                    style: TextStyle(fontSize: 14),
                                                                                  )
                                                                                : Text(
                                                                                    formateTime,
                                                                                    style: TextStyle(fontSize: 14),
                                                                                  ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceAround,
                                                                      children: [
                                                                        OutlinedButton(
                                                                            onPressed:
                                                                                () {
                                                                              ModelClass
                                                                                  edit =
                                                                                  ModelClass(
                                                                                name: providerVar.editName.text,
                                                                                number: providerVar.editNumber.text,
                                                                                chat: providerVar.editChat.text,
                                                                                Image: providerVar.editImage,
                                                                                Date: (formatedDate == null) ? providerVar.editDate : formatedDate,
                                                                                Time: (formateTime == null) ? providerVar.editTime : formateTime,
                                                                              );
                                                                              providerVar.editContactData(edit,
                                                                                  index);

                                                                              Navigator.of(context).pop();
                                                                              providerVar.editImage =
                                                                                  null;
                                                                              providerVar.editTime =
                                                                                  null;
                                                                              providerVar.editDate =
                                                                                  null;
                                                                            },
                                                                            child:
                                                                                Text('EDIT')),
                                                                        OutlinedButton(
                                                                            onPressed:
                                                                                () {
                                                                              Navigator.of(context).pop();
                                                                            },
                                                                            child:
                                                                                Text('CANCEL'))
                                                                      ],
                                                                    ),
                                                                  ]),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                  icon: Icon(
                                                    Icons.edit,
                                                    size: 34,
                                                  )),
                                              IconButton(
                                                  onPressed: () {
                                                    providerVar
                                                        .deleteContactData(
                                                            index);
                                                    //setState(() {
                                                    Navigator.of(context).pop();
                                                    //});
                                                  },
                                                  icon: Icon(
                                                    Icons.delete,
                                                    size: 34,
                                                  )),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        OutlinedButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text(
                                              'Cancel',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ))
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            leading: CircleAvatar(
                              radius: 35,
                              backgroundImage: FileImage(
                                  providerVar.contactData[index].Image!),
                            ),
                            title: Text(
                              providerVar.contactData[index].name!,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            subtitle: Text(
                              providerVar.contactData[index].chat!,
                              style: TextStyle(fontWeight: FontWeight.w400),
                            ),
                            trailing: Container(
                              width: 120,
                              child: Row(
                                children: [
                                  Text(
                                    providerVar.contactData[index].Date
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(', '),
                                  Text(
                                    providerVar.contactData[index].Time
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            )
          ],
        ),
      );
    } else {
      return SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: height,
              width: width,
              child: (providerVar.contactData.isEmpty)
                  ? Center(child: Text('No any chats yet...'))
                  : ListView.builder(
                      itemCount: providerVar.contactData.length,
                      itemBuilder: (context, index) {
                        return CupertinoListTile(
                          onTap: () {
                            showCupertinoModalPopup(
                              context: context,
                              builder: (context) {
                                return Container(
                                  height: 340,
                                  width: width,
                                  color: (providerVar.isTheme == false)
                                      ? Colors.white
                                      : Colors.black,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: CircleAvatar(
                                          radius: 65,
                                          backgroundImage: FileImage(providerVar
                                              .contactData[index].Image!),
                                        ),
                                      ),
                                      Text(
                                        providerVar.contactData[index].name!,
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      Text(
                                        providerVar.contactData[index].chat!,
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          CupertinoButton(
                                              child: Icon(
                                                Icons.edit,
                                                size: 30,
                                              ),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                                providerVar.editName.text =
                                                    providerVar
                                                        .contactData[index]
                                                        .name!;
                                                providerVar.editNumber.text =
                                                    providerVar
                                                        .contactData[index]
                                                        .number!;
                                                providerVar.editChat.text =
                                                    providerVar
                                                        .contactData[index]
                                                        .chat!;
                                                providerVar.editImage =
                                                    providerVar
                                                        .contactData[index]
                                                        .Image!;
                                                providerVar.editDate =
                                                    providerVar
                                                        .contactData[index]
                                                        .Date!;
                                                providerVar.editTime =
                                                    providerVar
                                                        .contactData[index]
                                                        .Time!;
                                                providerVar.editIndex = index;

                                                showCupertinoDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return CupertinoAlertDialog(
                                                      content: Container(
                                                        height: 420,
                                                        width: width,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Column(
                                                              children: [
                                                                (providerVar.editImage !=
                                                                        null)
                                                                    ? GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          showCupertinoDialog(
                                                                              context: context,
                                                                              builder: (context) {
                                                                                return CupertinoAlertDialog(
                                                                                  content: Container(
                                                                                    width: 220,
                                                                                    height: 105,
                                                                                    child: Padding(
                                                                                      padding: const EdgeInsets.only(top: 8.0),
                                                                                      child: Column(
                                                                                        children: [
                                                                                          Row(
                                                                                            children: [
                                                                                              Icon(Icons.photo_library_outlined),
                                                                                              SizedBox(width: 10,),
                                                                                              ElevatedButton(
                                                                                                  onPressed: () {
                                                                                                    providerVar.getAlbumsImage();
                                                                                                    Navigator.of(context).pop();
                                                                                                  },
                                                                                                  child: Text("Choose from Gallery")),
                                                                                            ],
                                                                                          ),
                                                                                          Row(
                                                                                            children: [
                                                                                              Icon(Icons.camera),
                                                                                              SizedBox(width: 10,),
                                                                                              ElevatedButton(
                                                                                                  onPressed: () {
                                                                                                    providerVar.getCameraImage();
                                                                                                    Navigator.of(context).pop();
                                                                                                  },
                                                                                                  child: Text("Choose from Camera")),
                                                                                            ],
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              });
                                                                        },
                                                                        child:
                                                                            CircleAvatar(
                                                                          radius:
                                                                              60,
                                                                          backgroundImage:
                                                                              FileImage(providerVar.editImage!),
                                                                        ),
                                                                      )
                                                                    : Container(
                                                                        height:
                                                                            115,
                                                                        width:
                                                                            115,
                                                                        decoration: BoxDecoration(
                                                                            shape:
                                                                                BoxShape.circle,
                                                                            color: Colors.black12),
                                                                        child:
                                                                            CupertinoButton(
                                                                          onPressed:
                                                                              () {
                                                                            providerVar.getAlbumsImage();
                                                                          },
                                                                          child:
                                                                              Icon(
                                                                            CupertinoIcons.add,
                                                                            size:
                                                                                60,
                                                                            color:
                                                                                Colors.blue,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                SizedBox(
                                                                  height: 5,
                                                                ),
                                                                CupertinoTextFormFieldRow(
                                                                  controller:
                                                                      providerVar
                                                                          .editName,
                                                                  prefix: Icon(
                                                                    Icons
                                                                        .person_outline_outlined,
                                                                    size: 30,
                                                                  ),
                                                                  placeholder:
                                                                      'Enter Full Name',
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .text,
                                                                  decoration: BoxDecoration(
                                                                      border: Border.all(
                                                                          width:
                                                                              1,
                                                                          color: (providerVar.isTheme == false)
                                                                              ? Colors
                                                                                  .black38
                                                                              : Colors
                                                                                  .white38),
                                                                      borderRadius:
                                                                          BorderRadiusDirectional.circular(
                                                                              6)),
                                                                ),
                                                                CupertinoTextFormFieldRow(
                                                                  controller:
                                                                      providerVar
                                                                          .editNumber,
                                                                  prefix: Icon(
                                                                    CupertinoIcons
                                                                        .phone,
                                                                    size: 30,
                                                                  ),
                                                                  placeholder:
                                                                      'Enter Phone Number',
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .number,
                                                                  decoration: BoxDecoration(
                                                                      border: Border.all(
                                                                          width:
                                                                              1,
                                                                          color: (providerVar.isTheme == false)
                                                                              ? Colors
                                                                                  .black38
                                                                              : Colors
                                                                                  .white38),
                                                                      borderRadius:
                                                                          BorderRadiusDirectional.circular(
                                                                              6)),
                                                                ),
                                                                CupertinoTextFormFieldRow(
                                                                  controller:
                                                                      providerVar
                                                                          .editChat,
                                                                  prefix: Icon(
                                                                    CupertinoIcons
                                                                        .chat_bubble_text,
                                                                    size: 30,
                                                                  ),
                                                                  placeholder:
                                                                      'Enter Chat Conversation',
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .text,
                                                                  decoration: BoxDecoration(
                                                                      border: Border.all(
                                                                          width:
                                                                              1,
                                                                          color: (providerVar.isTheme == false)
                                                                              ? Colors
                                                                                  .black38
                                                                              : Colors
                                                                                  .white38),
                                                                      borderRadius:
                                                                          BorderRadiusDirectional.circular(
                                                                              6)),
                                                                ),
                                                                SizedBox(
                                                                  height: 6,
                                                                ),
                                                                GestureDetector(
                                                                  onTap: () {
                                                                    showCupertinoModalPopup(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (context) {
                                                                        return Container(
                                                                            height:
                                                                                300,
                                                                            color:
                                                                                Colors.white,
                                                                            child: CupertinoDatePicker(
                                                                              onDateTimeChanged: (DateTime value) {
                                                                                setState(() {
                                                                                  iosDate = DateFormat('dd/MM/yyyy').format(value);
                                                                                });
                                                                              },
                                                                              mode: CupertinoDatePickerMode.date,
                                                                              use24hFormat: false,
                                                                              initialDateTime: DateTime.now(),
                                                                            ));
                                                                      },
                                                                    );
                                                                    print(
                                                                        iosDate);
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsets
                                                                          .only(
                                                                          left:
                                                                              19.0),
                                                                      child:
                                                                          Row(
                                                                        children: [
                                                                          Icon(
                                                                            CupertinoIcons.calendar,
                                                                            size:
                                                                                30,
                                                                          ),
                                                                          SizedBox(
                                                                            width:
                                                                                10,
                                                                          ),
                                                                          (iosDate != null)
                                                                              ? Text(
                                                                                  iosDate.toString(),
                                                                                  style: TextStyle(fontSize: 17),
                                                                                )
                                                                              : Text(providerVar.editDate, style: TextStyle(fontSize: 17))
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 10,
                                                                ),
                                                                GestureDetector(
                                                                  onTap: () {
                                                                    showCupertinoModalPopup(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (context) {
                                                                        return Container(
                                                                            height:
                                                                                300,
                                                                            color:
                                                                                Colors.white,
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
                                                                    print(
                                                                        iosTime);
                                                                  },
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsets
                                                                        .only(
                                                                        left:
                                                                            19.0),
                                                                    child: Row(
                                                                      children: [
                                                                        Icon(
                                                                          CupertinoIcons
                                                                              .time,
                                                                          size:
                                                                              30,
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                              13,
                                                                        ),
                                                                        (iosTime !=
                                                                                null)
                                                                            ? Text(
                                                                                iosTime.toString(),
                                                                                style: TextStyle(fontSize: 17),
                                                                              )
                                                                            : Text(
                                                                                providerVar.editTime,
                                                                                style: TextStyle(fontSize: 17),
                                                                              )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 7,
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceEvenly,
                                                                  children: [
                                                                    OutlinedButton(
                                                                        onPressed:
                                                                            () {
                                                                          ModelClass
                                                                              edit =
                                                                              ModelClass(
                                                                            name:
                                                                                providerVar.editName.text,
                                                                            number:
                                                                                providerVar.editNumber.text,
                                                                            chat:
                                                                                providerVar.editChat.text,
                                                                            Image:
                                                                                providerVar.editImage,
                                                                            Date: (iosDate == null)
                                                                                ? providerVar.editDate
                                                                                : iosDate,
                                                                            Time: (iosTime == null)
                                                                                ? providerVar.editTime
                                                                                : iosTime,
                                                                          );
                                                                          providerVar.editContactData(
                                                                              edit,
                                                                              index);

                                                                          Navigator.of(context)
                                                                              .pop();
                                                                          providerVar.editImage =
                                                                              null;
                                                                          providerVar.editTime =
                                                                              null;
                                                                          providerVar.editDate =
                                                                              null;
                                                                        },
                                                                        child: Text(
                                                                            'EDIT')),
                                                                    OutlinedButton(
                                                                        child: Text(
                                                                            'CANCEL'),
                                                                        onPressed:
                                                                            () {
                                                                          Navigator.of(context)
                                                                              .pop();
                                                                        })
                                                                  ],
                                                                ),
                                                              ]),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              }),
                                          CupertinoButton(
                                              child: Icon(
                                                Icons.delete,
                                                size: 30,
                                              ),
                                              onPressed: () {
                                                providerVar
                                                    .deleteContactData(index);
                                                Navigator.of(context).pop();
                                              }),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      CupertinoButton(
                                          color: (providerVar.isTheme == false)
                                              ? Colors.black38
                                              : Colors.white38,
                                          child: Text('Cancel'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          })
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          leadingSize: 60,
                          leadingToTitle: 20,
                          padding: EdgeInsets.all(5),
                          title: Text(
                            providerVar.contactData[index].name!,
                            style: TextStyle(fontSize: 18),
                          ),
                          subtitle: Text(
                            providerVar.contactData[index].chat!,
                            style: TextStyle(fontSize: 16),
                          ),
                          leading: CircleAvatar(
                            radius: 30,
                            backgroundImage: FileImage(
                                providerVar.contactData[index].Image!),
                          ),
                          trailing: Container(
                            width: 140,
                            child: Row(
                              children: [
                                Text(providerVar.contactData[index].Date
                                    .toString()),
                                Text(', '),
                                Text(providerVar.contactData[index].Time
                                    .toString()),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            )
          ],
        ),
      );
    }
  }
}
