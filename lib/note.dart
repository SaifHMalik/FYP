import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'printing.dart' as pr;

class CreateNotifications {
  CreateNotifications(
      String email, String data, String userType, String messageType) {
    createNotification(email, data, userType, messageType);
  }

  // Future<void> createNotification(
  //     String email, String data, String userType, String messageType) async {
  //   pr.print("Started");
  //   final _auth = FirebaseAuth.instance;
  //   User? user = _auth.currentUser;

  //   Timestamp now = Timestamp.now();
  //   DateTime dateTime = now.toDate();
  //   CollectionReference mainCollectionRef =
  //       FirebaseFirestore.instance.collection('users');

  //   QuerySnapshot snapshot =
  //       await mainCollectionRef.where('email', isEqualTo: user?.email).get();

  //   String docID = snapshot.docs.first.id;
  //   DocumentReference docRef = mainCollectionRef.doc(docID);
  //   pr.print(docID);
  //   docRef.collection("notification").add({
  //     'data': data,
  //     'sender': email,
  //     'time': dateTime.toString(),
  //     'user': userType,
  //     'messageType': messageType,
  //   });
  // }
}

Future<void> createNotification(
    String email, String data, String userType, String messageType) async {
  pr.print("Started");
  final _auth = FirebaseAuth.instance;
  User? user = _auth.currentUser;

  Timestamp now = Timestamp.now();
  DateTime dateTime = now.toDate();
  CollectionReference mainCollectionRef =
      FirebaseFirestore.instance.collection('users');

  QuerySnapshot snapshot =
      await mainCollectionRef.where('email', isEqualTo: user?.email).get();

  String docID = snapshot.docs.first.id;
  DocumentReference docRef = mainCollectionRef.doc(docID);
  pr.print(docID);
  docRef.collection("notification").add({
    'data': data,
    'sender': email,
    'time': dateTime.toString(),
    'user': userType,
    'messageType': messageType,
  });
}
