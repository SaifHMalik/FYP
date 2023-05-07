import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:mazdoor_pk/homeProducts.dart';
import 'package:mazdoor_pk/homeServices.dart';
import 'package:mazdoor_pk/login.dart';

class Select extends StatefulWidget {
  //final String email, pass;
  // const Select({Key? key, required this.email, required this.pass})
  //     : super(key: key);

  const Select({Key? key}) : super(key: key);

  @override
  State<Select> createState() => _SelectState();
}

class _SelectState extends State<Select> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    final note = [
      "Electrician is on his way",
      "sent you an Offer on I want a plumber to repair my basin",
      "Electrician is on his way",
      "sent you an Offer on I want a plumber to repair my basin",
      "Electrician is on his way",
      "sent you an Offer on I want a plumber to repair my basin",
      "Electrician is on his way",
      "sent you an Offer on I want a plumber to repair my basin",
      "Electrician is on his way",
      "sent you an Offer on I want a plumber to repair my basin",
      "Electrician is on his way",
      "sent you an Offer on I want a plumber to repair my basin",
      "Electrician is on his way",
      "sent you an Offer on I want a plumber to repair my basin",
      "Electrician is on his way",
      "sent you an Offer on I want a plumber to repair my basin",
    ];
    var noteWriter = [
      "Ahmad Nazeer",
      "Muhammad Yasir",
      "Ahmad Nazeer",
      "Muhammad Yasir",
      "Ahmad Nazeer",
      "Muhammad Yasir",
      "Ahmad Nazeer",
      "Muhammad Yasir",
      "Ahmad Nazeer",
      "Muhammad Yasir",
      "Ahmad Nazeer",
      "Muhammad Yasir",
      "Ahmad Nazeer",
      "Muhammad Yasir",
      "Ahmad Nazeer",
      "Muhammad Yasir"
    ];
    var timings = [
      "21 minutes ago",
      "1 hour ago",
      "21 minutes ago",
      "1 hour ago",
      "21 minutes ago",
      "1 hour ago",
      "21 minutes ago",
      "1 hour ago",
      "21 minutes ago",
      "1 hour ago",
      "21 minutes ago",
      "1 hour ago",
      "21 minutes ago",
      "1 hour ago",
      "21 minutes ago",
      "1 hour ago"
    ];
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeProducts()));
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.03),
                    padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.15,
                    ),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 240, 240, 240),
                          )
                        ]),
                    child: const Text(
                      'Products',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 23,
                          fontWeight: FontWeight.w500,
                          height: 1.8),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeServices()));
                    },
                    child: Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height * 0.03),
                      padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.15,
                      ),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 240, 240, 240),
                            )
                          ]),
                      child: const Text(
                        'Services',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Nunito',
                            fontSize: 23,
                            fontWeight: FontWeight.w500,
                            height: 1.8),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    )));
  }
}
