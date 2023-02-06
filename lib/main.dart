import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mazdoor_pk/welcome.dart';
import 'package:mazdoor_pk/select.dart';
import 'package:mazdoor_pk/addService.dart';
import 'package:mazdoor_pk/homeServices.dart';
import 'package:mazdoor_pk/homeProducts.dart';
import 'package:mazdoor_pk/chat.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Welcome(),
      debugShowCheckedModeBanner: false,
    );
  }
}
