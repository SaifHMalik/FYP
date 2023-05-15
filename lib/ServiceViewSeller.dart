import 'package:flutter/material.dart';
import 'package:mazdoor_pk/chat.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'printing.dart' as pr;

class ServiceViewSeller extends StatefulWidget {
  final id;
  final title;
  final price;
  final category;
  final time;
  final email;

  const ServiceViewSeller(
      {Key? key,
      required this.id,
      required this.title,
      required this.price,
      required this.category,
      required this.time,
      required this.email})
      : super(key: key);

  @override
  State<ServiceViewSeller> createState() => ServiceViewSellerState();
}

String name = "AAAA";

class ServiceViewSellerState extends State<ServiceViewSeller> {
  Future<void> accept() async {}

  Future<void> reject() async {}

  Future getData(String _id) async {
    var firestore = FirebaseFirestore.instance;
    QuerySnapshot snap = await firestore
        .collection("Service")
        .doc(_id)
        .collection("ServiceOrders")
        .get();
    return snap.docs;
  }

  Future<void> getName(String _id) async {
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
              child: FutureBuilder(
            future: getName(widget.id),
            builder: (context, snapshot) {
              return RefreshIndicator(
                onRefresh: getRegresh,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(widget.title,
                                        style: TextStyle(
                                            fontSize: 23,
                                            fontFamily: 'Nunito',
                                            fontWeight: FontWeight.w600)),
                                    const SizedBox(height: 15),
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundImage:
                                              AssetImage('profile.jpg'),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(name,
                                            style: TextStyle(
                                                fontFamily: 'Nunito')),
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                    const Text(
                                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.',
                                        style: TextStyle(fontFamily: 'Nunito')),
                                    const SizedBox(height: 20),
                                    Row(
                                      children: [
                                        Text(
                                          'Ends in: ',
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  40, 175, 125, 1),
                                              fontWeight: FontWeight.w900,
                                              fontSize: 17,
                                              fontFamily: 'Nunito'),
                                        ),
                                        Text(
                                          widget.time,
                                          style: TextStyle(
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
                                        Text(
                                          'Current Bid: ',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Nunito'),
                                        ),
                                        Text(
                                          'PKR ${widget.price}/-',
                                          style: TextStyle(
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
                                                decoration: const InputDecoration(
                                                    border:
                                                        UnderlineInputBorder(),
                                                    labelText: 'Bid Amount',
                                                    labelStyle: TextStyle(
                                                        fontFamily: 'Nunito'))),
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
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            ServiceViewSeller(
                                                              id: widget.id,
                                                              title:
                                                                  widget.title,
                                                              time: widget.time,
                                                              email:
                                                                  widget.email,
                                                              category: widget
                                                                  .category,
                                                              price:
                                                                  widget.price,
                                                            )));
                                              })),
                                              child: const Text('END OFFER',
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
                                ),
                              ),
                            ),
                          ),
                          StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection("Service")
                                .doc(widget.id)
                                .collection("ServiceOrders")
                                .snapshots(),
                            builder: ((context, index) {
                              if (snapshot.hasError) {
                                return const Text("Connection Error");
                              }

                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Text("Loading...");
                              }

                              return ListView.builder(
                                itemCount: 3,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Center(
                                        child: Card(
                                          margin: const EdgeInsets.all(11),
                                          child: Padding(
                                            padding: const EdgeInsets.all(15),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const SizedBox(height: 15),
                                                Row(
                                                  children: const [
                                                    CircleAvatar(
                                                      backgroundImage:
                                                          AssetImage(
                                                              'profile.jpg'),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      "James Wood",
                                                      style: TextStyle(
                                                          fontFamily: 'Nunito',
                                                          fontSize: 18),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 10),
                                                const Text(
                                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                                                  style: TextStyle(
                                                      fontFamily: 'Nunito',
                                                      fontSize: 15),
                                                ),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                Row(
                                                  children: const [
                                                    Text(
                                                      'Offered: ',
                                                      style: TextStyle(
                                                          color: Colors.grey,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily: 'Nunito',
                                                          fontSize: 15),
                                                    ),
                                                    Text(
                                                      "PKR " + "13,000" + "/-",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 20,
                                                          fontFamily: 'Nunito'),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 25,
                                                ),
                                                Container(
                                                  height: 52,
                                                  margin: const EdgeInsets
                                                      .symmetric(vertical: 5),
                                                  child: Row(
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () {
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          ChatMessaging()));
                                                        },
                                                        child: Container(
                                                          width: 52,
                                                          margin:
                                                              const EdgeInsets
                                                                      .only(
                                                                  right: 10),
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              color: const Color
                                                                      .fromARGB(
                                                                  255,
                                                                  11,
                                                                  119,
                                                                  207)),
                                                          child: const Center(
                                                            child: Icon(
                                                              Icons.message,
                                                              size: 33.0,
                                                              color: Color
                                                                  .fromRGBO(
                                                                      255,
                                                                      255,
                                                                      255,
                                                                      0.9),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child:
                                                            FloatingActionButton(
                                                          elevation: 0.0,
                                                          onPressed: () {},
                                                          child: const Text(
                                                            'Counter Offer',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black87,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontFamily:
                                                                    'Nunito',
                                                                fontSize: 17),
                                                          ),
                                                          backgroundColor:
                                                              const Color
                                                                      .fromARGB(
                                                                  255,
                                                                  233,
                                                                  233,
                                                                  233),
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  height: 52,
                                                  margin: const EdgeInsets
                                                      .symmetric(vertical: 5),
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                        // padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                                                        // width: MediaQuery.of(context).size.width / 2.25,
                                                        child:
                                                            FloatingActionButton(
                                                          elevation: 0.0,
                                                          onPressed: () {},
                                                          child: const Text(
                                                              'Reject',
                                                              style: TextStyle(
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          255,
                                                                          255,
                                                                          255,
                                                                          0.9),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontFamily:
                                                                      'Nunito',
                                                                  fontSize:
                                                                      17)),
                                                          backgroundColor:
                                                              Colors.red,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                      Expanded(
                                                        // padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                                                        // width: MediaQuery.of(context).size.width / 2.25,
                                                        child:
                                                            FloatingActionButton(
                                                          elevation: 0.0,
                                                          onPressed: () {},
                                                          child: const Text(
                                                              'Accept',
                                                              style: TextStyle(
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          255,
                                                                          255,
                                                                          255,
                                                                          0.9),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontFamily:
                                                                      'Nunito',
                                                                  fontSize:
                                                                      17)),
                                                          backgroundColor:
                                                              Colors.green,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }),
                          ),
                        ])),
                  ],
                ),
              );
            },
          )

              //   Column(
              //   children: [
              //     Container(
              //       width: double.infinity,
              //       height: 300,
              //       decoration: const BoxDecoration(
              //         image: DecorationImage(
              //           image: NetworkImage(
              //               'https://upload.wikimedia.org/wikipedia/commons/thumb/8/84/UK_BS1363_double_wall_socket.jpg/800px-UK_BS1363_double_wall_socket.jpg'),
              //           fit: BoxFit.fitWidth,
              //         ),
              //       ),
              //       child: null,
              //     ),
              //     SafeArea(
              //         child: Column(
              //             mainAxisAlignment: MainAxisAlignment.center,
              //             children: [
              //           Center(
              //               child: Card(
              //                   margin: const EdgeInsets.all(11),
              //                   child: Padding(
              //                       padding: const EdgeInsets.all(18),
              //                       child: Column(
              //                         crossAxisAlignment:
              //                             CrossAxisAlignment.start,
              //                         children: [
              //                           Text(widget.title,
              //                               style: TextStyle(
              //                                   fontSize: 23,
              //                                   fontFamily: 'Nunito',
              //                                   fontWeight: FontWeight.w600)),
              //                           const SizedBox(height: 15),
              //                           Row(
              //                             children: const [
              //                               CircleAvatar(
              //                                 backgroundImage:
              //                                     AssetImage('profile.jpg'),
              //                               ),
              //                               SizedBox(
              //                                 width: 10,
              //                               ),
              //                               Text('Vinesh Juriasinghani',
              //                                   style: TextStyle(
              //                                       fontFamily: 'Nunito')),
              //                             ],
              //                           ),
              //                           const SizedBox(height: 20),
              //                           const Text(
              //                               'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.',
              //                               style:
              //                                   TextStyle(fontFamily: 'Nunito')),
              //                           const SizedBox(height: 20),
              //                           Row(
              //                             children: [
              //                               Text(
              //                                 'Ends in: ',
              //                                 style: TextStyle(
              //                                     color: Color.fromRGBO(
              //                                         40, 175, 125, 1),
              //                                     fontWeight: FontWeight.w900,
              //                                     fontSize: 17,
              //                                     fontFamily: 'Nunito'),
              //                               ),
              //                               Text(
              //                                 widget.time,
              //                                 style: TextStyle(
              //                                     color: Color.fromRGBO(
              //                                         40, 175, 125, 1),
              //                                     fontWeight: FontWeight.w700,
              //                                     fontSize: 17,
              //                                     fontFamily: 'Nunito'),
              //                               ),
              //                             ],
              //                           ),
              //                           const SizedBox(
              //                             height: 20,
              //                           ),
              //                           Row(
              //                             children: [
              //                               Text(
              //                                 'Current Bid: ',
              //                                 style: TextStyle(
              //                                     color: Colors.grey,
              //                                     fontWeight: FontWeight.bold,
              //                                     fontFamily: 'Nunito'),
              //                               ),
              //                               Text(
              //                                 'PKR ${widget.price}/-',
              //                                 style: TextStyle(
              //                                     color: Colors.black,
              //                                     fontSize: 20,
              //                                     fontFamily: 'Nunito'),
              //                               ),
              //                             ],
              //                           ),
              //                           const SizedBox(
              //                             height: 5,
              //                           ),
              //                           Row(
              //                             children: const [
              //                               Text(
              //                                 'Base Price: ',
              //                                 style: TextStyle(
              //                                     color: Colors.black,
              //                                     fontWeight: FontWeight.bold,
              //                                     fontFamily: 'Nunito'),
              //                               ),
              //                               Text(
              //                                 'PKR 6000/-',
              //                                 style: TextStyle(
              //                                     color: Colors.black,
              //                                     fontFamily: 'Nunito'),
              //                               ),
              //                             ],
              //                           ),
              //                           const SizedBox(
              //                             height: 10,
              //                           ),
              //                           Row(
              //                             children: [
              //                               SizedBox(
              //                                 width: 130,
              //                                 child: Padding(
              //                                   padding: const EdgeInsets.only(
              //                                       bottom: 10),
              //                                   child: TextFormField(
              //                                       decoration: const InputDecoration(
              //                                           border:
              //                                               UnderlineInputBorder(),
              //                                           labelText: 'Bid Amount',
              //                                           labelStyle: TextStyle(
              //                                               fontFamily:
              //                                                   'Nunito'))),
              //                                 ),
              //                               ),
              //                               const SizedBox(
              //                                 width: 25,
              //                               ),
              //                               const Text('Total Bids: ',
              //                                   style: TextStyle(
              //                                       color: Colors.black87,
              //                                       fontFamily: 'Nunito')),
              //                               const Text('10',
              //                                   style: TextStyle(
              //                                       color: Colors.black87,
              //                                       fontFamily: 'Nunito'))
              //                             ],
              //                           ),
              //                           const SizedBox(
              //                             height: 25,
              //                           ),
              //                           Center(
              //                             child: Container(
              //                               child: SizedBox(
              //                                 width: double.infinity,
              //                                 height: 52,
              //                                 child: ClipRRect(
              //                                   borderRadius:
              //                                       BorderRadius.circular(15),
              //                                   child: TextButton(
              //                                     style: TextButton.styleFrom(
              //                                         backgroundColor:
              //                                             const Color.fromARGB(
              //                                                 255, 80, 232, 176)),
              //                                     onPressed: ((() {
              //                                       Navigator.push(
              //                                           context,
              //                                           MaterialPageRoute(
              //                                               builder: (context) =>
              //                                                   ServiceViewSeller(
              //                                                     id: widget.id,
              //                                                     title: widget
              //                                                         .title,
              //                                                     time:
              //                                                         widget.time,
              //                                                     email: widget
              //                                                         .email,
              //                                                     category: widget
              //                                                         .category,
              //                                                     price: widget
              //                                                         .price,
              //                                                   )));
              //                                     })),
              //                                     child: const Text('END OFFER',
              //                                         style: TextStyle(
              //                                             fontFamily: 'Nunito',
              //                                             color: Colors.black87,
              //                                             fontSize: 18,
              //                                             fontWeight:
              //                                                 FontWeight.w700)),
              //                                   ),
              //                                 ),
              //                               ),
              //                             ),
              //                           ),
              //                         ],
              //                       )))),
              //           ListView.builder(
              //             itemCount: 3,
              //             shrinkWrap: true,
              //             itemBuilder: (context, index) {
              //               return Column(
              //                 mainAxisAlignment: MainAxisAlignment.center,
              //                 children: [
              //                   Center(
              //                     child: Card(
              //                       margin: const EdgeInsets.all(11),
              //                       child: Padding(
              //                         padding: const EdgeInsets.all(15),
              //                         child: Column(
              //                           crossAxisAlignment:
              //                               CrossAxisAlignment.start,
              //                           children: [
              //                             const SizedBox(height: 15),
              //                             Row(
              //                               children: const [
              //                                 CircleAvatar(
              //                                   backgroundImage:
              //                                       AssetImage('profile.jpg'),
              //                                 ),
              //                                 SizedBox(
              //                                   width: 10,
              //                                 ),
              //                                 Text(
              //                                   "James Wood",
              //                                   style: TextStyle(
              //                                       fontFamily: 'Nunito',
              //                                       fontSize: 18),
              //                                 ),
              //                               ],
              //                             ),
              //                             const SizedBox(height: 10),
              //                             const Text(
              //                               "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
              //                               style: TextStyle(
              //                                   fontFamily: 'Nunito',
              //                                   fontSize: 15),
              //                             ),
              //                             const SizedBox(
              //                               height: 20,
              //                             ),
              //                             Row(
              //                               children: const [
              //                                 Text(
              //                                   'Offered: ',
              //                                   style: TextStyle(
              //                                       color: Colors.grey,
              //                                       fontWeight: FontWeight.bold,
              //                                       fontFamily: 'Nunito',
              //                                       fontSize: 15),
              //                                 ),
              //                                 Text(
              //                                   "PKR " + "13,000" + "/-",
              //                                   style: TextStyle(
              //                                       color: Colors.black,
              //                                       fontSize: 20,
              //                                       fontFamily: 'Nunito'),
              //                                 ),
              //                               ],
              //                             ),
              //                             const SizedBox(
              //                               height: 25,
              //                             ),
              //                             Container(
              //                               height: 52,
              //                               margin: const EdgeInsets.symmetric(
              //                                   vertical: 5),
              //                               child: Row(
              //                                 children: [
              //                                   GestureDetector(
              //                                     onTap: () {
              //                                       Navigator.push(
              //                                           context,
              //                                           MaterialPageRoute(
              //                                               builder: (context) =>
              //                                                   ChatMessaging()));
              //                                     },
              //                                     child: Container(
              //                                       width: 52,
              //                                       margin: const EdgeInsets.only(
              //                                           right: 10),
              //                                       decoration: BoxDecoration(
              //                                           borderRadius:
              //                                               BorderRadius.circular(
              //                                                   10),
              //                                           color:
              //                                               const Color.fromARGB(
              //                                                   255,
              //                                                   11,
              //                                                   119,
              //                                                   207)),
              //                                       child: const Center(
              //                                         child: Icon(
              //                                           Icons.message,
              //                                           size: 33.0,
              //                                           color: Color.fromRGBO(
              //                                               255, 255, 255, 0.9),
              //                                         ),
              //                                       ),
              //                                     ),
              //                                   ),
              //                                   Expanded(
              //                                     child: FloatingActionButton(
              //                                       elevation: 0.0,
              //                                       onPressed: () {},
              //                                       child: const Text(
              //                                         'Counter Offer',
              //                                         style: TextStyle(
              //                                             color: Colors.black87,
              //                                             fontWeight:
              //                                                 FontWeight.bold,
              //                                             fontFamily: 'Nunito',
              //                                             fontSize: 17),
              //                                       ),
              //                                       backgroundColor:
              //                                           const Color.fromARGB(
              //                                               255, 233, 233, 233),
              //                                       shape: RoundedRectangleBorder(
              //                                         borderRadius:
              //                                             BorderRadius.circular(
              //                                                 10.0),
              //                                       ),
              //                                     ),
              //                                   ),
              //                                 ],
              //                               ),
              //                             ),
              //                             Container(
              //                               height: 52,
              //                               margin: const EdgeInsets.symmetric(
              //                                   vertical: 5),
              //                               child: Row(
              //                                 children: [
              //                                   Expanded(
              //                                     // padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
              //                                     // width: MediaQuery.of(context).size.width / 2.25,
              //                                     child: FloatingActionButton(
              //                                       elevation: 0.0,
              //                                       onPressed: () {},
              //                                       child: const Text('Reject',
              //                                           style: TextStyle(
              //                                               color: Color.fromRGBO(
              //                                                   255,
              //                                                   255,
              //                                                   255,
              //                                                   0.9),
              //                                               fontWeight:
              //                                                   FontWeight.bold,
              //                                               fontFamily: 'Nunito',
              //                                               fontSize: 17)),
              //                                       backgroundColor: Colors.red,
              //                                       shape: RoundedRectangleBorder(
              //                                         borderRadius:
              //                                             BorderRadius.circular(
              //                                                 10.0),
              //                                       ),
              //                                     ),
              //                                   ),
              //                                   const SizedBox(
              //                                     width: 10,
              //                                   ),
              //                                   Expanded(
              //                                     // padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
              //                                     // width: MediaQuery.of(context).size.width / 2.25,
              //                                     child: FloatingActionButton(
              //                                       elevation: 0.0,
              //                                       onPressed: () {},
              //                                       child: const Text('Accept',
              //                                           style: TextStyle(
              //                                               color: Color.fromRGBO(
              //                                                   255,
              //                                                   255,
              //                                                   255,
              //                                                   0.9),
              //                                               fontWeight:
              //                                                   FontWeight.bold,
              //                                               fontFamily: 'Nunito',
              //                                               fontSize: 17)),
              //                                       backgroundColor: Colors.green,
              //                                       shape: RoundedRectangleBorder(
              //                                         borderRadius:
              //                                             BorderRadius.circular(
              //                                                 10.0),
              //                                       ),
              //                                     ),
              //                                   ),
              //                                 ],
              //                               ),
              //                             ),
              //                           ],
              //                         ),
              //                       ),
              //                     ),
              //                   ),
              //                 ],
              //               );
              //             },
              //           ),
              //         ])),
              //   ],
              // ),
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
