// ignore_for_file: depend_on_referenced_packages

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mazdoor_pk/login.dart';
import 'package:mazdoor_pk/myWallet.dart';
import 'personalInformation.dart';
//import 'login.dart' as lg;
import 'createUserModel.dart' as cu;

// final userName = await cu.getUserName();
//String name = lg.checkName; // use this
FirebaseAuth auth = FirebaseAuth.instance;
User? user = auth.currentUser;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;

String? getUserEmail() {
  return user?.email;
}

String? getUserId() {
  return user?.uid;
}

void printingData(final msg) {
  cu.print(msg);
}
// Future<String?> getUSerBio() async {
//   if (user != null) {
//     final DocumentSnapshot userDoc =
//         await _firestore.collection("users").doc(user?.uid).get();

//     return userDoc['bio'];
//   }

//   return null;
// }

// ignore: camel_case_types
class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);
  // final String email, pass;
  // const Profile({Key? key, required this.email, required this.pass})
  //     : super(key: key);
  @override
  State<Profile> createState() => ProfileState();
}

// ignore: camel_case_types
class ProfileState extends State<Profile> {
  String name = "Name loading...";
  String bio = "Bio Loading...";
  // String money = "Money Loading...";
  double money = 0;

  void getData() async {
    printingData("0");
    var vari = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: user?.email)
        .get();
    printingData("1");
    setState(() {
      printingData("2");
      name = vari.docs.first.data()['name'];
      printingData("3");
      bio = vari.docs.first.data()['bio'];
      printingData("4");
      money = vari.docs.first.data()['money'];
      printingData("5");
    });
  }

  @override
  // Future<void> initState() async {
  //   super.initState();
  //   getUserEmail();
  //   getName();
  // }

  //String? uName = getUSerName();
  //final uBio = getUSerBio();

  // String? uName;
  // Future<void> loadUserName() async {
  //   uName = await getUserName();
  // }

  void initState() {
    cu.print(user?.uid);
    cu.print(user?.email);
    getData();
    super.initState();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
                child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundImage: const AssetImage('profile.jpg'),
                            radius: MediaQuery.of(context).size.width * 0.14,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.05,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                name,
                                style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                                0.04 +
                                            10,
                                    fontFamily: 'Nunito'),
                              ),
                              Text(
                                'Electrician',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                                0.02 +
                                            10,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Nunito'),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(bio,
                          style: TextStyle(
                              fontFamily: 'Nunito',
                              fontWeight: FontWeight.w500)),
                    ),
                    const SizedBox(
                      height: 30,
                      child: Divider(
                        color: Colors.grey,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text(money.toString(),
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.w800)),
                            Text(
                              'Current Balance',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontFamily: 'Nunito',
                                  fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                        Column(
                          children: const [
                            Text('PKR 84,720.00',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.w800)),
                            Text(
                              'Pending Clearance',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontFamily: 'Nunito',
                                  fontWeight: FontWeight.w700),
                            )
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                      child: Divider(
                        color: Colors.grey,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.07),
                      child: Container(
                        height: 300,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PersonalInfoScreen(),
                                  ),
                                );
                              },
                              child: Row(
                                children: const [
                                  Padding(
                                      padding: EdgeInsets.only(right: 20),
                                      child: Icon(
                                        Icons.person,
                                      )),
                                  Text(
                                    'Personal Information',
                                    style: TextStyle(
                                        fontFamily: 'Nunito',
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MyWalllet(),
                                  ),
                                );
                              },
                              child: Row(
                                children: const [
                                  Padding(
                                      padding: EdgeInsets.only(right: 20),
                                      child: Icon(
                                        Icons.account_balance_wallet,
                                      )),
                                  Text(
                                    'My Wallet',
                                    style: TextStyle(
                                        fontFamily: 'Nunito',
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Row(
                                children: const [
                                  Padding(
                                      padding: EdgeInsets.only(right: 20),
                                      child: Icon(
                                        Icons.history,
                                      )),
                                  Text(
                                    'Transaction History',
                                    style: TextStyle(
                                        fontFamily: 'Nunito',
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Row(
                                children: const [
                                  Padding(
                                      padding: EdgeInsets.only(right: 20),
                                      child: Icon(
                                        Icons.history_edu,
                                      )),
                                  Text(
                                    'Previous Orders',
                                    style: TextStyle(
                                        fontFamily: 'Nunito',
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Row(
                                children: const [
                                  Padding(
                                      padding: EdgeInsets.only(right: 20),
                                      child: Icon(
                                        Icons.groups,
                                      )),
                                  Text(
                                    'Tell your Friends',
                                    style: TextStyle(
                                        fontFamily: 'Nunito',
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Row(
                                children: const [
                                  Padding(
                                      padding: EdgeInsets.only(right: 20),
                                      child: Icon(
                                        Icons.settings,
                                      )),
                                  Text(
                                    'Settings',
                                    style: TextStyle(
                                        fontFamily: 'Nunito',
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () async {
                                await FirebaseAuth.instance.signOut();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Login()));
                              },
                              child: Row(
                                children: const [
                                  Padding(
                                      padding: EdgeInsets.only(right: 20),
                                      child: Icon(
                                        Icons.power_settings_new_sharp,
                                        color: Colors.red,
                                      )),
                                  Text(
                                    'Log out',
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontFamily: 'Nunito',
                                        fontWeight: FontWeight.w500),
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
            ))));
  }
}
