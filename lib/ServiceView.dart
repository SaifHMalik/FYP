import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'homeServices.dart';
import 'serviceList.dart';
import 'printing.dart' as pr;

// ignore: camel_case_types
class ServiceView extends StatefulWidget {
  final String title;
  final String email;
  final String time;
  final String category;
  final double price;
  final String id;

  ServiceView(
      {Key? key,
      required this.title,
      required this.time,
      required this.email,
      required this.price,
      required this.category,
      required this.id})
      : super(key: key);

  @override
  State<ServiceView> createState() => ServiceViewState();
}

String name = "AAAA";

// ignore: camel_case_types
class ServiceViewState extends State<ServiceView> {
  TextEditingController amount = TextEditingController();

  Future<void> updateBid(double amount, String _id) async {
    pr.print("aaaaaa");
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Service')
        .where('id', isEqualTo: _id)
        .limit(1)
        .get();

    String userEmail = querySnapshot.docs.first.get("userEmail");

    var vari = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: userEmail)
        .get();

    name = vari.docs.first.data()["name"];
    pr.print(name);

    final currentUser = FirebaseAuth.instance.currentUser;

    final subcollectionRef = FirebaseFirestore.instance
        .collection('Service')
        .doc(_id)
        .collection('ServiceOrders');

    var nameOfBidder = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: currentUser?.email)
        .get();

    String currentName = nameOfBidder.docs.first.data()["name"];

    final DocumentReference documentRef = await subcollectionRef.add({
      'title': widget.title,
      'userEmail': currentUser?.email,
      'price': amount,
      'id': widget.id,
      'status': "Not Accepted",
      'name': currentName,
    });

    final String documentId = documentRef.id;

    await documentRef.update({'id': documentId});
  }

  Future<void> getName(String _id) async {
    pr.print("aaaaaa");
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Product')
        .where('id', isEqualTo: _id)
        .limit(1)
        .get();

    String userEmail = querySnapshot.docs.first.get("userEmail");

    var vari = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: userEmail)
        .get();

    name = vari.docs.first.data()["name"];
  }

  Future<Null> getRegresh() async {
    await Future.delayed(Duration(seconds: 3));
    setState(() {
      getName(widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 300,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/84/UK_BS1363_double_wall_socket.jpg/800px-UK_BS1363_double_wall_socket.jpg'),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  child: null,
                ),
                SafeArea(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      Center(
                          child: Card(
                              margin: const EdgeInsets.all(11),
                              child: Padding(
                                  padding: const EdgeInsets.all(18),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(widget.title,
                                          style: const TextStyle(
                                              fontSize: 23,
                                              fontFamily: 'Nunito',
                                              fontWeight: FontWeight.w600)),
                                      const SizedBox(height: 15),
                                      Row(
                                        children: const [
                                          CircleAvatar(
                                            backgroundImage:
                                                AssetImage('profile.jpg'),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text('Vinesh Juriasinghani',
                                              style: TextStyle(
                                                  fontFamily: 'Nunito')),
                                        ],
                                      ),
                                      const SizedBox(height: 20),
                                      const Text(
                                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.',
                                          style:
                                              TextStyle(fontFamily: 'Nunito')),
                                      const SizedBox(height: 20),
                                      Row(
                                        children: [
                                          const Text(
                                            "End Time:",
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    40, 175, 125, 1),
                                                fontWeight: FontWeight.w900,
                                                fontSize: 17,
                                                fontFamily: 'Nunito'),
                                          ),
                                          Text(
                                            widget.time,
                                            style: const TextStyle(
                                                color: Color.fromRGBO(
                                                    40, 175, 125, 1),
                                                fontWeight: FontWeight.w700,
                                                fontSize: 17,
                                                fontFamily: 'Nunito'),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          const Text(
                                            'Current Bid: ',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Nunito'),
                                          ),
                                          Text(
                                            'PKR ${widget.price.toString()}/-',
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 20,
                                                fontFamily: 'Nunito'),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: const [
                                          Text(
                                            'Base Price: ',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Nunito'),
                                          ),
                                          Text(
                                            'PKR 6000/-',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: 'Nunito'),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 130,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 10),
                                              child: TextFormField(
                                                  controller: amount,
                                                  decoration: const InputDecoration(
                                                      border:
                                                          UnderlineInputBorder(),
                                                      labelText: 'Bid Amount',
                                                      labelStyle: TextStyle(
                                                          fontFamily:
                                                              'Nunito'))),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 25,
                                          ),
                                          const Text('Total Bids: ',
                                              style: TextStyle(
                                                  color: Colors.black87,
                                                  fontFamily: 'Nunito')),
                                          const Text('10',
                                              style: TextStyle(
                                                  color: Colors.black87,
                                                  fontFamily: 'Nunito'))
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 25,
                                      ),
                                      Center(
                                        child: Container(
                                          child: SizedBox(
                                            width: double.infinity,
                                            height: 52,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              child: TextButton(
                                                style: TextButton.styleFrom(
                                                    backgroundColor:
                                                        const Color.fromARGB(
                                                            255, 80, 232, 176)),
                                                onPressed: ((() {
                                                  if (double.parse(
                                                          amount.text) >
                                                      widget.price) {
                                                    updateBid(
                                                        double.parse(
                                                            amount.text),
                                                        widget.id);

                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            ServiceView(
                                                          title: widget.title,
                                                          category:
                                                              widget.category,
                                                          time: widget.time,
                                                          email: widget.email,
                                                          price: widget.price,
                                                          id: widget.id,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                })),
                                                child: const Text('PLACE BID',
                                                    style: TextStyle(
                                                        fontFamily: 'Nunito',
                                                        color: Colors.black87,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w700)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )))),
                    ])),
              ],
            ),
          ),
          Positioned(
            top: 20,
            left: 20,
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white70,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ]),
      ),
    );
  }
}
