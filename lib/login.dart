// import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mazdoor_pk/register.dart';
import 'package:mazdoor_pk/select.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:developer' as logDev;
import 'package:firebase_auth/firebase_auth.dart';
import 'createUserModel.dart' as cuModel;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _MyLoginState createState() => _MyLoginState();
}

String checkEmail = "";
String checkName = "";

// class CreateUser {
//   String? id;
//   String name;
//   String email;
//   String password;
//   // String cnic;
//   //String phone;

//   CreateUser({
//     this.id,
//     required this.name,
//     required this.email,
//     //required this.cnic,
//     required this.password,
//     //required this.phone
//   });

//   setUser(String name, String email, String password) {
//     this.name = name;
//     this.email = email;
//     this.password = password;
//     //this.phone = phone;
//   }

//   Map<String, dynamic> toJson() => {
//         'id': id,
//         'name': name,
//         'email': email,
//         'password': password,
//         //'phone': phone,
//       };

//   static CreateUser fromJson(Map<String, dynamic> json) => CreateUser(
//       id: json['id'],
//       name: json['name'],
//       email: json['email'],
//       password: json['password']);

//   factory CreateUser.fromSnapshot(
//       DocumentSnapshot<Map<String, dynamic>> document) {
//     final data = document.data()!;

//     return CreateUser(
//       id: document.id,
//       email: data["email"],
//       password: data["password"],
//       name: data["name"],
//     );
//   }
// }

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
//   // final snapshot = FirebaseFirestore.instance
//   //     .collection("users")
//   //     .where("email", isEqualTo: email)
//   //     .get();

//   // print(snapshot);
//   return returnEmail;
// }

print(final msg) {
  logDev.log(msg);
}

class _MyLoginState extends State<Login> {
  final controlEmail = TextEditingController();
  final controlPassword = TextEditingController();
  // String? checkEmail;
  // String? checkName;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('../assets/login.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 35, top: 110),
              child: const Text(
                'Sign In\nto Proceed',
                style: TextStyle(color: Colors.white, fontSize: 33),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 35, right: 35),
                      child: Column(
                        children: [
                          TextField(
                            controller: controlEmail,
                            style: const TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: "Email",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          TextField(
                            controller: controlPassword,
                            style: const TextStyle(),
                            obscureText: true,
                            decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: "Password",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: const Color(0xff394d45),
                                child: IconButton(
                                    color: Colors.white,
                                    onPressed: () async {
                                      String? checkEmail =
                                          await cuModel.getUserData(
                                              controlEmail.text,
                                              controlPassword.text);
                                      if (checkEmail != null) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Select()));
                                      }
                                      // Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (context) => Select()));
                                    },
                                    icon: const Icon(
                                      Icons.arrow_forward,
                                    )),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () async {
                                  // String? checkEmail = await getUserData(
                                  //     controlEmail.text, controlPassword.text);
                                  // if (checkEmail != null) {
                                  //   Navigator.push(
                                  //       context,
                                  //       MaterialPageRoute(
                                  //           builder: (context) => Select()));
                                  // }
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) => Select()));
                                },
                                style: const ButtonStyle(),
                                child: TextButton(
                                  onPressed: (() {
                                    // String? checkEmail = await getUserData(
                                    //     controlEmail.text,
                                    //     controlPassword.text);

                                    //print(checkEmail);

                                    // if (checkEmail != null) {
                                    //   Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //       builder: (context) => Register(),
                                    //     ),
                                    //   );
                                    // }

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Register(),
                                      ),
                                    );
                                  }),
                                  child: const Text(
                                    'Sign Up',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: Color(0xff4c505b),
                                        fontSize: 21),
                                  ),
                                ),
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    'Forgot Password',
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Color(0xff4c505b),
                                      fontSize: 18,
                                    ),
                                  )),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
