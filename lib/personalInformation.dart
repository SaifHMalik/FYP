import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mazdoor_pk/homeProducts.dart';
import 'profile.dart';

class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({Key? key}) : super(key: key);

  @override
  State<PersonalInfoScreen> createState() => PersonalInfoState();
}

Future<void> updateUser(String _name, String _bio, String _job) async {
  FirebaseAuth auth = FirebaseAuth.instance;
  User? user = auth.currentUser;
  try {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: user?.email)
        .limit(1)
        .get();
    DocumentReference userDocRef = querySnapshot.docs[0].reference;
    userDocRef.update({
      'name': _name,
      'bio': _bio,
      'job': _job,
    });
  } catch (error) {
    print('Error updating user data: $error');
  }
}

class PersonalInfoState extends State<PersonalInfoScreen> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _bio = TextEditingController();
  final TextEditingController _job = TextEditingController();

  String? name;
  String? bio;
  String? job;

  Future<void> getData() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;

    final querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: user?.email)
        .get();

    name = querySnapshot.docs.first.data()["name"];
    bio = querySnapshot.docs.first.data()["bio"];
    name = querySnapshot.docs.first.data()["job"];
  }

  @override
  Widget build(BuildContext) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: FutureBuilder(
                future: getData(),
                builder: (context, snapshot) {
                  return Padding(
                    padding: EdgeInsets.only(top: 20, left: 10, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Name: ${name}"),
                        SizedBox(height: 20),
                        TextField(
                          controller: _name,
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            hintText: "Name",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        //Text(data),
                        TextField(
                          controller: _bio,
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            hintText: "Bio",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextField(
                          controller: _job,
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            hintText: "Job",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        SizedBox(height: 40),
                        Row(
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomeProducts(),
                                  ),
                                );
                              },
                              child: Text(
                                "Go Back",
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Color(0xff4c505b),
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            SizedBox(width: 180),
                            TextButton(
                              onPressed: () {
                                updateUser(_name.text, _bio.text, _job.text);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomeProducts(),
                                  ),
                                );
                              },
                              child: Text(
                                "Confirm Edit",
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Color(0xff4c505b),
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }),

            // Padding(
            //   padding: EdgeInsets.only(top: 20, left: 10, right: 10),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       SizedBox(height: 20),
            //       TextField(
            //         controller: _name,
            //         style: const TextStyle(color: Colors.black),
            //         decoration: InputDecoration(
            //           fillColor: Colors.grey.shade100,
            //           filled: true,
            //           hintText: "Name",
            //           border: OutlineInputBorder(
            //             borderRadius: BorderRadius.circular(10),
            //           ),
            //         ),
            //       ),
            //       SizedBox(height: 20),
            //       TextField(
            //         controller: _bio,
            //         style: const TextStyle(color: Colors.black),
            //         decoration: InputDecoration(
            //           fillColor: Colors.grey.shade100,
            //           filled: true,
            //           hintText: "Bio",
            //           border: OutlineInputBorder(
            //             borderRadius: BorderRadius.circular(10),
            //           ),
            //         ),
            //       ),
            //       SizedBox(height: 20),
            //       TextField(
            //         controller: _job,
            //         style: const TextStyle(color: Colors.black),
            //         decoration: InputDecoration(
            //           fillColor: Colors.grey.shade100,
            //           filled: true,
            //           hintText: "Job",
            //           border: OutlineInputBorder(
            //             borderRadius: BorderRadius.circular(10),
            //           ),
            //         ),
            //       ),
            //       SizedBox(height: 40),
            //       Row(
            //         children: [
            //           TextButton(
            //             onPressed: () {
            //               Navigator.push(
            //                 context,
            //                 MaterialPageRoute(
            //                   builder: (context) => HomeProducts(),
            //                 ),
            //               );
            //             },
            //             child: Text(
            //               "Go Back",
            //               style: TextStyle(
            //                 decoration: TextDecoration.underline,
            //                 color: Color(0xff4c505b),
            //                 fontSize: 18,
            //               ),
            //             ),
            //           ),
            //           SizedBox(width: 180),
            //           TextButton(
            //             onPressed: () {
            //               updateUser(_name.text, _bio.text, _job.text);
            //               Navigator.push(
            //                 context,
            //                 MaterialPageRoute(
            //                   builder: (context) => HomeProducts(),
            //                 ),
            //               );
            //             },
            //             child: Text(
            //               "Confirm Edit",
            //               style: TextStyle(
            //                 decoration: TextDecoration.underline,
            //                 color: Color(0xff4c505b),
            //                 fontSize: 18,
            //               ),
            //             ),
            //           ),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
          ),
        ),
      ),
    );
  }
}
