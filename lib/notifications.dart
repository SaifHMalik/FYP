import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'printing.dart' as pr;
import 'package:timeago/timeago.dart' as timeago;
import 'servicesPosted.dart';
import 'ServiceViewSeller.dart';

class Notifications extends StatefulWidget {
  @override
  State<Notifications> createState() => _NotificationsState();
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

class _NotificationsState extends State<Notifications> {
  // Future<void> createNotification() async {
  //   final _auth = FirebaseAuth.instance;
  //   User? user = _auth.currentUser;

  //   CollectionReference mainCollectionRef =
  //       FirebaseFirestore.instance.collection('users');

  //   QuerySnapshot snapshot =
  //       await mainCollectionRef.where('email', isEqualTo: user?.email).get();

  //   if (snapshot.docs.length > 0) {
  //     String docID = snapshot.docs.first.id;

  //     DocumentReference docRef = mainCollectionRef.doc(docID);
  //     docRef
  //         .collection("notification")
  //         .add({'data': 'N/A', 'sender': 'N/A', 'time': 'N/A', 'user': "N/A"});
  //   }
  // }

  static Future<void> createNotification(
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

  Future getData() async {
    final _auth = FirebaseAuth.instance;
    User? user = _auth.currentUser;

    CollectionReference mainCollectionRef =
        FirebaseFirestore.instance.collection('users');

    pr.print("email: ${user?.email}");

    QuerySnapshot snapshot =
        await mainCollectionRef.where('email', isEqualTo: user?.email).get();

    if (snapshot.docs.length > 0) {
      String docID = snapshot.docs.first.id;

      QuerySnapshot snap = await FirebaseFirestore.instance
          .collection("users")
          .doc(docID)
          .collection("notification")
          .get();

      return snap.docs;
    }
  }

  Future<Null> getRegresh() async {
    await Future.delayed(Duration(seconds: 3));
    setState(() {
      getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    // final docs = getData();
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

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

              FutureBuilder(
                  future: getData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return RefreshIndicator(
                        onRefresh: getData,
                        child: ListView.builder(
                          itemCount: snapshot.data.length,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            pr.print("00000");
                            String stringTime = snapshot.data[index]["time"];
                            pr.print("11111");
                            DateTime dateTime = DateTime.parse(stringTime);
                            pr.print("22222");

                            String timeAgo =
                                timeago.format(dateTime, locale: 'en_short');
                            pr.print(timeAgo);
                            pr.print("33333");

                            return GestureDetector(
                              onTap: () {
                                pr.print("Pressed OnTap");
                                if (snapshot.data[index]["user"] == "Buyer" &&
                                    snapshot.data[index]["messageType"] ==
                                        "Service Started") {
                                  pr.print("AAAAAA");
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ServiceViewSeller(
                                          id: snapshot.data[index]["id"],
                                          title: snapshot.data[index]["title"],
                                          price: snapshot.data[index]
                                              ["totalBill"],
                                          category: snapshot.data[index]
                                              ["category"],
                                          time: snapshot.data[index]["time"],
                                          email: snapshot.data[index]
                                              ["buyerEmail"]),
                                    ),
                                  );
                                } else if (snapshot.data[index]["user"] ==
                                        "Seller" &&
                                    snapshot.data[index]["messageType"] ==
                                        "Service Started") {
                                  pr.print(snapshot.data[index]["user"]);
                                  pr.print(snapshot.data[index]["messageType"]);
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) => ServiceViewSeller(
                                  //         id: snapshot.data[index].id,
                                  //         title: snapshot.data[index]["title"],
                                  //         price: snapshot.data[index]
                                  //             ["totalBill"],
                                  //         category: snapshot.data[index]
                                  //             ["category"],
                                  //         time: snapshot.data[index]["time"],
                                  //         email: snapshot.data[index]
                                  //             ["buyerEmail"]),
                                  //   ),
                                  // );
                                }

                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => ServicesPosted(),
                                //   ),
                                // );
                              },
                              child: Container(
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
                                              color: Color.fromARGB(
                                                  255, 240, 240, 240),
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
                                              text: "${timeAgo} ago",
                                            ),
                                            TextSpan(
                                              text: "\n" +
                                                  snapshot.data[index]
                                                      ["sender"],
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            TextSpan(
                                              text: " - " +
                                                  snapshot.data[index]["data"],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    }
                  })

              // ListView.builder(
              //   itemCount: ,
              //   shrinkWrap: true,
              //   itemBuilder: (BuildContext context, int index) {
              //     return GestureDetector(
              //       onTap: () {
              //         pr.print("AAAAAAAAAAAAAAAAAA");
              //         createNotification();
              //       },
              //       child: Container(
              //         margin: const EdgeInsets.symmetric(
              //             horizontal: 20, vertical: 10),
              //         child: Column(
              //           mainAxisAlignment: MainAxisAlignment.start,
              //           children: [
              //             Container(
              //               width: double.infinity,
              //               padding: const EdgeInsets.all(20),
              //               decoration: const BoxDecoration(
              //                   borderRadius: BorderRadius.all(
              //                     Radius.circular(15),
              //                   ),
              //                   boxShadow: [
              //                     BoxShadow(
              //                       color: Color.fromARGB(255, 240, 240, 240),
              //                     )
              //                   ]),
              //               child: Text.rich(
              //                 style: TextStyle(
              //                     fontFamily: 'Nunito',
              //                     fontWeight: FontWeight.w500,
              //                     height: 1.8),
              //                 TextSpan(
              //                   children: [
              //                     TextSpan(
              //                       text: timings[index],
              //                     ),
              //                     TextSpan(
              //                       text: "\n" + noteWriter[index],
              //                       style: const TextStyle(
              //                           fontWeight: FontWeight.bold),
              //                     ),
              //                     TextSpan(
              //                       text: " - " + note[index],
              //                     )
              //                   ],
              //                 ),
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //     );
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
