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

  void set_user_name(String name) {
    this.name = name;
  }

  void set_user_password(String password) {
    this.password = password;
  }

  String? get_user_id() {
    return this.id;
  }

  String? get_user_name() {
    return this.name;
  }

  String? get_user_email() {
    return this.email;
  }

  String? get_user_password() {
    return this.password;
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

//     UserCredential userCredential = await FirebaseAuth.instance
//         .signInWithEmailAndPassword(email: email, password: password);
//     User userData = userCredential.user!;
//   } on FirebaseException catch (e) {
//     print(e.toString());
//     print("Username or Password is Incorrect");
//   }
//   // final snapshot = FirebaseFirestore.instance
//   //     .collection("users")
//   //     .where("email", isEqualTo: email)
//   //     .get();

//   // print(snapshot);
//   return returnEmail;
// }

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

    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    User userData = userCredential.user!;
  } on FirebaseException catch (e) {
    print(e.toString());
    print("Username or Password is Incorrect");
    // handle the Firebase authentication exception here
    if (e.code == "user-not-found" || e.code == "wrong-password") {
      // handle the case where the email and password do not match
    } else {
      // handle other Firebase authentication exceptions here
    }
  } catch (e) {
    print(e.toString());
    // handle other exceptions here
  }

  return returnEmail;
}

Future create_user(CreateUser user) async {
  final auth = FirebaseAuth.instance;
  // bool checkingRegisteration = false;

  // try {
  //   print("0");
  //   List<String> registerAlready =
  //       await auth.fetchSignInMethodsForEmail(user.email);

  //   //print(registerAlready); causing error
  //   print("1");
  //   for (String method in registerAlready) {
  //     if (method == "password") {
  //       print("user with this email aready exists");
  //       checkingRegisteration = true;
  //     }
  //   }

  //   print("2");
  //   if (checkingRegisteration = false) {
  //     print("user with this email aready exists");
  //   } else {
  //     final docUser =
  //         FirebaseFirestore.instance.collection("users").doc("user1");
  //     final json = user.toJson();
  //     await docUser.set(json);

  //     try {
  //       final register = await auth.createUserWithEmailAndPassword(
  //           email: user.email, password: user.password);
  //     } on FirebaseAuthException catch (e) {
  //       print(e.toString());
  //       print("Error registering");
  //     }
  //   }
  // } on FirebaseAuthException catch (e) {
  //   print("data provided is not valid");
  //   print(e.toString());
  // }

  // final docUser = FirebaseFirestore.instance.collection("users").doc("user1");
  // final json = user.toJson();
  // await docUser.set(json);

  try {
    final register = await auth.createUserWithEmailAndPassword(
        email: user.email, password: user.password);
    //final docUser = FirebaseFirestore.instance.collection("users").doc("user1");
    final docUser = FirebaseFirestore.instance.collection("users").doc();
    user.id = docUser.id;
    final json = user.toJson();
    await docUser.set(json);
  } on FirebaseAuthException catch (e) {
    print(e.toString());
    print("Error registering");
  }
}

print(final msg) {
  logDev.log(msg);
}

Future<String?> getUserName() async {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // await FirebaseAuth.instance.authStateChanges().first;

  String? userID = _auth.currentUser!.uid;

  final userDoc =
      await _firestore.collection('users').where('id', isEqualTo: userID).get();
  print("0");

  try {
    //final userName = userDoc.docs[0].data()['name'];
    final userName = "Saif";
    print(userName);
    print("1234567890");
    return userName;
  } on FirebaseException catch (e) {
    print(e.toString());
    print("Error");
  }

  return "Malik";
}
