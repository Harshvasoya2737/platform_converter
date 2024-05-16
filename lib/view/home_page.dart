import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_converter/view/android&ios/setting_page.dart';
import 'package:provider/provider.dart';
import 'package:platform_converter/controller/platform_change_provider.dart';
import 'package:platform_converter/view/android&ios/calls_page.dart';
import 'package:platform_converter/view/android&ios/chats_page.dart';
import 'package:platform_converter/view/android&ios/add_contact_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

List<Widget> tabList = [
  ContactPage(),
  ChatPage(),
  CallPage(),
  SettingPage(),
];

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var isAndroid =
        Provider.of<platformProvider>(context, listen: false).isAndroid;

    if (isAndroid) {
      return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Platform Converter"),
            actions: [
              Consumer<platformProvider>(
                builder: (BuildContext context,
                    platformProvider platformProvider, Widget? child) {
                  return Switch(
                    value: platformProvider.isAndroid,
                    onChanged: (value) {
                      platformProvider.changePlatform(value);
                    },
                  );
                },
              ),
            ],
            bottom: TabBar(
                labelStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                tabs: [
                  Tab(
                    icon: Icon(Icons.person_add_alt_outlined),
                  ),
                  Tab(
                    text: 'CHATS',
                  ),
                  Tab(
                    text: 'CALLS',
                  ),
                  Tab(
                    text: 'SETTINGS',
                  )
                ]),
          ),
          body: TabBarView(children: [
            ContactPage(),
            ChatPage(),
            CallPage(),
            SettingPage(),
          ]),
        ),
      );
    } else {
      return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('Platform Converter'),
          trailing: Consumer<platformProvider>(
            builder: (BuildContext context, platformProvider platformProvider,
                Widget? child) {
              return CupertinoSwitch(
                value: platformProvider.isAndroid,
                onChanged: (value) {
                  platformProvider.changePlatform(value);
                },
              );
            },
          ),
        ),
        child: CupertinoTabScaffold(
          tabBar: CupertinoTabBar(items: const [
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.person_add_solid)),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.chat_bubble_2), label: 'CHATS'),
            BottomNavigationBarItem(icon: Icon(Icons.call), label: 'CALLS'),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.settings), label: 'SETTINGS'),
          ]),
          tabBuilder: (context, index) {
            return CupertinoTabView(
              builder: (BuildContext context) {
                return Center(child: tabList[index]);
              },
            );
          },
        ),
      );
    }
  }
}
