import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:developer' as logDev;

class CreateUser {
  String? id;
  String name;
  String email;
  String password;
  // String cnic;
  //String phone;

  CreateUser({
    this.id,
    required this.name,
    required this.email,
    //required this.cnic,
    required this.password,
    //required this.phone
  });

  setUser(String name, String email, String password) {
    this.name = name;
    this.email = email;
    this.password = password;
    //this.phone = phone;
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'password': password,
        //'phone': phone,
      };

  static CreateUser fromJson(Map<String, dynamic> json) => CreateUser(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      password: json['password']);

  factory CreateUser.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;

    return CreateUser(
      id: document.id,
      email: data["email"],
      password: data["password"],
      name: data["name"],
    );
  }
}

Future<String?> getUserData(String email, String password) async {
  String? returnEmail = null;

  try {
    final snapshot = await FirebaseFirestore.instance
        .collection("users")
        .where("email", isEqualTo: email)
        .where("password", isEqualTo: password)
        .get();

    final List<QueryDocumentSnapshot<Map<String, dynamic>>> documents =
        snapshot.docs;
    for (var document in documents) {
      print(document.data()["email"]);
      print(document.data()["name"]);
      returnEmail = document.data()["email"];
    }
  } on FirebaseException catch (e) {
    print(e.toString());
    print("Username or Password is Incorrect");
  }
  // final snapshot = FirebaseFirestore.instance
  //     .collection("users")
  //     .where("email", isEqualTo: email)
  //     .get();

  // print(snapshot);
  return returnEmail;
}

print(final msg) {
  logDev.log(msg);
}
