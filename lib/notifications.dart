import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Notifications extends StatefulWidget {
  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  Future<void> createNotification(String _id) async {
    final _auth = FirebaseAuth.instance;
    User? user = _auth.currentUser;

    CollectionReference mainCollectionRef =
        FirebaseFirestore.instance.collection('users');

    QuerySnapshot userQuerySnapshot =
        await mainCollectionRef.where('email', isEqualTo: user?.email).get();

    if (userQuerySnapshot.docs.isNotEmpty) {
      DocumentSnapshot userDocSnapshot = userQuerySnapshot.docs.first;
    } else {
      DocumentSnapshot userDocSnapshot = userQuerySnapshot.docs.first;
      DocumentReference userDocRef = userDocSnapshot.reference;
    }
  }

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
              Container(
                padding: const EdgeInsets.fromLTRB(30, 30, 30, 15),
                alignment: Alignment.topLeft,
                child: const Text(
                  "Notifications",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 30,
                      fontFamily: 'Nunito'),
                ),
              ),
              ListView.builder(
                itemCount: note.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(20),
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 240, 240, 240),
                                )
                              ]),
                          child: Text.rich(
                            style: TextStyle(
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.w500,
                                height: 1.8),
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: timings[index],
                                ),
                                TextSpan(
                                  text: "\n" + noteWriter[index],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                TextSpan(
                                  text: " - " + note[index],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
