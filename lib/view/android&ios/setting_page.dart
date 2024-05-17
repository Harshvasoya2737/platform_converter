import 'package:flutter/cupertino.dart';
import 'package:platform_converter/controller/platform_change_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    var isAndroid =
        Provider.of<platformProvider>(context, listen: false).isAndroid;
    final providerVar = Provider.of<platformProvider>(context, listen: true);

    var width = MediaQuery.of(context).size.width;
    if (isAndroid) {
      return SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Profile"),
              subtitle: Text("Upadate Profile Data"),
              trailing: Switch(
                  onChanged: (value) {
                    providerVar.setProfile = value;
                  },
                  value: providerVar.getProfile),
            ),
            Visibility(
              child: Column(
                children: [
                  (providerVar.proImage != null)
                      ? CircleAvatar(
                          radius: 80,
                          backgroundImage: FileImage(providerVar.proImage!),
                        )
                      : Container(
                          height: 145,
                          width: 145,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.black12),
                          child: IconButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      content: Container(
                                        width: width - 220,
                                        height: 105,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Icon(Icons
                                                          .photo_library_outlined),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      ElevatedButton(
                                                          onPressed: () {
                                                            providerVar
                                                                .profileAlbums();
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          child: Text(
                                                              "Choose from Gallery")),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Icon(Icons.camera),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      ElevatedButton(
                                                          onPressed: () {
                                                            providerVar
                                                                .profileCamera();
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          child: Text(
                                                              "Choose from Camera")),
                                                    ],
                                                  ),
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
                              size: 50,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                  TextFormField(
                    textAlign: TextAlign.center,
                    controller: providerVar.NameController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter your name...'),
                  ),
                  TextFormField(
                    textAlign: TextAlign.center,
                    controller: providerVar.BioController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter your Bio...'),
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                            onPressed: () {
                              var snackbar =
                                  SnackBar(content: Text('SAVE PROFILE DATA'));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackbar);
                            },
                            child: Text('SAVE')),
                        TextButton(
                            onPressed: () async {
                              providerVar.BioController.clear();

                              providerVar.NameController.clear();
                              setState(() {
                                providerVar.proImage = null;
                              });
                            },
                            child: Text('CLEAR')),
                      ],
                    ),
                  )
                ],
              ),
              visible: providerVar.proData,
            ),
            Divider(height: 20, endIndent: 20, indent: 20),
            ListTile(
                leading: Icon(CupertinoIcons.sun_max),
                title: Text('Theme'),
                subtitle: Text('Change Theme'),
                trailing: Switch(
                    value: providerVar.getTheme,
                    onChanged: (value) {
                      providerVar.setTheme = value;
                    })),
          ],
        ),
      );
    } else {
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 550),
          child: Column(
            children: [
              CupertinoListTile(
                leading: Icon(CupertinoIcons.person),
                leadingToTitle: 20,
                leadingSize: 40,
                title: Text('Profile'),
                subtitle: Text('Upadate Profile Data'),
                trailing: CupertinoSwitch(
                    value: providerVar.getProfile,
                    onChanged: (value) {
                      providerVar.setProfile = value;
                    }),
              ),
              Visibility(
                  visible: providerVar.getProfile,
                  child: Column(
                    children: [
                      (providerVar.proImage != null)
                          ? CircleAvatar(
                              radius: 70,
                              backgroundImage: FileImage(providerVar.proImage!),
                            )
                          : Container(
                              height: 145,
                              width: 145,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.blue),
                              child: CupertinoButton(
                                  onPressed: () {
                                    showCupertinoModalPopup(
                                        context: context,
                                        builder: (context) {
                                          return CupertinoAlertDialog(
                                            content: Container(
                                              width: 220,
                                              height: 105,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 8.0),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Icon(Icons
                                                            .photo_library_outlined),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        ElevatedButton(
                                                            onPressed: () {
                                                              providerVar
                                                                  .profileAlbums();
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                            child: Text(
                                                                "Choose from Gallery")),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Icon(Icons.camera),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        ElevatedButton(
                                                            onPressed: () {
                                                              providerVar
                                                                  .profileCamera();
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                            child: Text(
                                                                "Choose from Camera")),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        });
                                  },
                                  child: Icon(
                                    CupertinoIcons.camera,
                                    size: 34,
                                    color: Colors.white,
                                  )),
                            ),
                      CupertinoTextFormFieldRow(
                        placeholder: 'Enter your name...',
                        textAlign: TextAlign.center,
                        controller: providerVar.NameController,
                      ),
                      CupertinoTextFormFieldRow(
                        placeholder: 'Enter your Bio...',
                        textAlign: TextAlign.center,
                        controller: providerVar.BioController,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CupertinoButton(
                              child: Text('SAVE'),
                              onPressed: () {
                                var snackbar = SnackBar(
                                    content: Text('SAVE PROFILE DATA'));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackbar);
                              }),
                          CupertinoButton(
                              child: Text('CLEAR'),
                              onPressed: () async {
                                providerVar.BioController.clear();
                                providerVar.NameController.clear();
                                setState(() {
                                  providerVar.proImage = null;
                                });
                              }),
                        ],
                      ),
                    ],
                  )),
              Divider(height: 20, endIndent: 20, indent: 20),
              CupertinoListTile.notched(
                leading: Icon(CupertinoIcons.sun_max),
                leadingToTitle: 20,
                leadingSize: 40,
                title: Text('Theme'),
                subtitle: Text('Change Theme'),
                trailing: CupertinoSwitch(
                    value: providerVar.getTheme,
                    onChanged: (value) {
                      providerVar.setTheme = value;
                    }),
              ),
            ],
          ),
        ),
      );
    }
  }
}
