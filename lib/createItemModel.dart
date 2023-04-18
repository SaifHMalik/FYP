import 'dart:ffi';
import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:developer' as logDev;

class CreateItem {
  String? id;
  String title;
  String? description;
  DateTime? date;
  Duration? time;
  String basePrice;
  String actualPrice;
  // String cnic;
  //String phone;

  CreateItem(
      {this.id,
      required this.title,
      this.description,
      required this.date,
      required this.time,
      required this.basePrice,
      required this.actualPrice});

  setUser(String title, String? description, String basePrice,
      String actualPrice, DateTime? date, Duration? time) {
    this.title = title;
    this.description = description;
    this.date = date;
    this.time = time;
    this.basePrice = basePrice;
    this.actualPrice = actualPrice;
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'date': date,
        'time': time,
        'basePrice': basePrice,
        'actualPrice': actualPrice,
      };

  static CreateItem fromJson(Map<String, dynamic> json) => CreateItem(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      date: json['date'],
      time: json['time'],
      basePrice: json['basePrice'],
      actualPrice: json['actualPrice']);

  factory CreateItem.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;

    return CreateItem(
        id: document.id,
        title: data['title'],
        description: data['description'],
        date: data['date'],
        time: data['time'],
        basePrice: data['basePrice'],
        actualPrice: data['actualPrice']);
  }

  String? getItemID() {
    return id;
  }

  String? getItemTitle() {
    return title;
  }

  String? getItemDescription() {
    return description;
  }

  DateTime? getItemDate() {
    return date;
  }

  Duration? getItemDuration() {
    return time;
  }

  String? getItemBasePrice() {
    return basePrice;
  }

  String? getItemActualPrice() {
    return actualPrice;
  }
}

print(final msg) {
  logDev.log(msg);
}

getItemData() async {
  try {
    final snapshot = await FirebaseFirestore.instance.collection("item").get();

    final List<QueryDocumentSnapshot<Map<String, dynamic>>> documents =
        snapshot.docs;

    return documents;
  } on FirebaseException catch (e) {
    print("Item data retieval ERROR!!");
  }
}



// Future<String?> getUserData(String email, String password) async {
//   String? returnEmail = null;

//   try {
//     final snapshot = await FirebaseFirestore.instance
//         .collection("users")
//         .where("email", isEqualTo: email)
//         .where("password", isEqualTo: password)
//         .get();

//     final List<QueryDocumentSnapshot<Map<String, dynamic>>> documents =
//         snapshot.docs;
//     for (var document in documents) {
//       print(document.data()["email"]);
//       print(document.data()["name"]);
//       returnEmail = document.data()["email"];
//     }
//   } on FirebaseException catch (e) {
//     print(e.toString());
//     print("Username or Password is Incorrect");
//   }
//   return returnEmail;
// }
