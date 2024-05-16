import 'dart:async';

import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState()
  {
    super.initState();
    Timer(Duration(seconds: 5),() {
      Navigator.pushReplacementNamed(context, 'home');
    },);
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Colors.white54,
                    Colors.black54,
                  ])),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/images/logo1.png',width: 250,height: 250,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Platform Converter App",style: TextStyle(fontWeight: FontWeight.w700,
                          fontSize: 25,
                          color: Colors.white),),
                    ),
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.only(left: 100,right: 100),
                      child: LinearProgressIndicator(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
