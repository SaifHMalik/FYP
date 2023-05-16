import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'printing.dart' as pr;

// class CreateNotifications {
//   CreateNotifications(
//       String email, String data, String userType, String messageType) {
//     createNotification(email, data, userType, messageType);
//   }

// }

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

Future<void> createNotificationExtra(
    String buyerEmail,
    String data,
    String userType,
    String messageType,
    String serviceId,
    String title,
    String category,
    final time,
    String sellerEmail,
    double totalBill,
    String sellerName,
    String buyerName) async {
  pr.print("Started");
  // final _auth = FirebaseAuth.instance;
  // User? user = _auth.currentUser;

  Timestamp now = Timestamp.now();
  DateTime dateTime = now.toDate();
  CollectionReference mainCollectionRef =
      FirebaseFirestore.instance.collection('users');

  QuerySnapshot snapshot =
      await mainCollectionRef.where('email', isEqualTo: buyerEmail).get();

  String docID = snapshot.docs.first.id;
  DocumentReference docRef = mainCollectionRef.doc(docID);
  pr.print(docID);
  docRef.collection("notification").add({
    'data': data,
    'sender': buyerEmail,
    'time': dateTime.toString(),
    'user': userType,
    'messageType': messageType,
    'id': serviceId,
    'title': title,
    'category': category,
    'time': time,
    'sellerEmail': sellerEmail,
    'totalBill': totalBill,
    'sellerName': sellerName,
    'buyerName': buyerName,
  });
}

class CreateNotificationsExtra {
  CreateNotificationsExtra(
      String senderEmail,
      String data,
      String userType,
      String messageType,
      String serviceId,
      String title,
      String category,
      final time,
      String sellerEmail,
      double totalBill,
      String sellerName,
      String buyerName) {
    pr.print("Started Notifications Extra");
    createNotificationExtra(senderEmail, data, userType, messageType, serviceId,
        title, category, time, sellerEmail, totalBill, sellerName, buyerName);
  }
}

// Future<void> createNotificationExtra(
//     String buyerEmail,
//     String data,
//     String userType,
//     String messageType,
//     String serviceId,
//     String title,
//     String category,
//     final time,
//     String sellerEmail,
//     double totalBill,
//     String sellerName,
//     String buyerName) async {
//   pr.print("Started");
//   final _auth = FirebaseAuth.instance;
//   User? user = _auth.currentUser;

//   Timestamp now = Timestamp.now();
//   DateTime dateTime = now.toDate();
//   CollectionReference mainCollectionRef =
//       FirebaseFirestore.instance.collection('users');

//   QuerySnapshot snapshot =
//       await mainCollectionRef.where('email', isEqualTo: buyerEmail).get();

//   String docID = snapshot.docs.first.id;
//   DocumentReference docRef = mainCollectionRef.doc(docID);
//   pr.print(docID);
//   docRef.collection("notification").add({
//     'data': data,
//     'sender': buyerEmail,
//     'time': dateTime.toString(),
//     'user': userType,
//     'messageType': messageType,
//     'id': serviceId,
//     'title': title,
//     'category': category,
//     'time': time,
//     'sellerEmail': sellerEmail,
//     'totalBill': totalBill,
//     'sellerName': sellerName,
//     'buyerName': buyerName,
//   });
// }
