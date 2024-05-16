import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:platform_converter/controller/platform_change_provider.dart';

class CallPage extends StatefulWidget {
  const CallPage({super.key});

  @override
  State<CallPage> createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
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
                  ? Center(child: Text('No any calls yet...'))
                  : ListView.builder(
                      itemCount: providerVar.contactData.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: CircleAvatar(
                            radius: 30,
                            backgroundImage: FileImage(
                                providerVar.contactData[index].Image!),
                          ),
                          title: Text(providerVar.contactData[index].name!,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500)),
                          subtitle: Text(
                            providerVar.contactData[index].chat!,
                            style: TextStyle(fontWeight: FontWeight.w400),
                          ),
                          trailing: IconButton(
                              onPressed: () async {
                                Uri uri = Uri(
                                    path: providerVar.contactData[index].number,
                                    scheme: "tel");
                                await launchUrl(uri);
                              },
                              icon: Icon(
                                Icons.call,
                                size: 29,
                              )),
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
                  ? Center(child: Text('No any calls yet...'))
                  : ListView.builder(
                      itemCount: providerVar.contactData.length,
                      itemBuilder: (context, index) {
                        return CupertinoListTile(
                          leadingSize: 60,
                          leadingToTitle: 20,
                          padding: EdgeInsets.all(5),
                          title: Text(providerVar.contactData[index].name!,
                              style: TextStyle(fontSize: 18)),
                          subtitle: Text(providerVar.contactData[index].chat!,
                              style: TextStyle(fontSize: 16)),
                          leading: CircleAvatar(
                            radius: 60,
                            backgroundImage: FileImage(
                                providerVar.contactData[index].Image!),
                          ),
                          trailing: CupertinoButton(
                              onPressed: () async {
                                final Uri url = Uri(
                                    path: providerVar.contactData[index].number,
                                    scheme: 'tel');
                                await launchUrl(url);
                              },
                              child: Icon(
                                CupertinoIcons.phone,
                                size: 28,
                              )),
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
