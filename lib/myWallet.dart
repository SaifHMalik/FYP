import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'profile.dart';

class MyWalllet extends StatefulWidget {
  const MyWalllet({Key? key}) : super(key: key);

  @override
  State<MyWalllet> createState() => MyWallletState();
}

class MyWallletState extends State<MyWalllet> {
  @override
  Widget build(BuildContext) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.only(top: 20),
                child: Column(
                  children: [],
                )),
          ),
        ),
      ),
    );
  }
}
