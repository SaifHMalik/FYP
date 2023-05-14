import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mazdoor_pk/dataServices.dart';
import 'package:mazdoor_pk/serviceView.dart';
import 'homeServices.dart';
import 'printing.dart' as pr;

class ServiceList extends StatefulWidget {
  @override
  _ServiceListState createState() => _ServiceListState();
}

class _ServiceListState extends State<ServiceList> {
  Future getGridView() async {
    var firestore = FirebaseFirestore.instance;
    QuerySnapshot snap = await firestore.collection("Service").get();
    return snap.docs;
  }

  Future<Null> getRegresh() async {
    await Future.delayed(Duration(seconds: 3));
    setState(() {
      getGridView();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(builder: (context, constraints) {
          return Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Recent Services',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 30,
                            fontFamily: 'Nunito'),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.search_outlined))
                    ],
                  ),
                ),
                Expanded(
                  child: LayoutBuilder(builder:
                      (BuildContext context, BoxConstraints constraints) {
                    double width = constraints.maxWidth;

                    double aspectRatio = (width - 100) / 400;
                    return FutureBuilder(
                      future: getGridView(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          return GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 1,
                                      mainAxisSpacing: 7,
                                      crossAxisSpacing: 0,
                                      childAspectRatio: aspectRatio),
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                                final String email =
                                    snapshot.data[index]["userEmail"];
                                final String id = snapshot.data[index]["id"];
                                final title = snapshot.data[index]["title"];
                                final price =
                                    snapshot.data[index]["price"].toDouble();
                                final category =
                                    snapshot.data[index]["category"];
                                Timestamp timestamp =
                                    snapshot.data[index]["time"] as Timestamp;
                                DateTime dateTime = timestamp.toDate();
                                final time = dateTime.toString();

                                return LayoutBuilder(builder:
                                    (BuildContext context,
                                        BoxConstraints constraints) {
                                  return Container(
                                    width: constraints.maxWidth,
                                    height: constraints.maxHeight,
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 12, horizontal: 21),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            width: double.maxFinite,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(0.1),
                                                  spreadRadius: 0,
                                                  blurRadius: 12,
                                                  offset: const Offset(0,
                                                      4), // changes position of shadow
                                                ),
                                              ],
                                            ),
                                            child: Center(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(20),
                                                      topRight:
                                                          Radius.circular(20),
                                                    ),
                                                    child: Image.network(
                                                        data[index]['image'],
                                                        width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width,
                                                        height: 180,
                                                        fit: BoxFit.cover),
                                                  ),
                                                  Container(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            15),
                                                    child: Column(children: [
                                                      Text(title,
                                                          style: const TextStyle(
                                                              fontSize: 20,
                                                              fontFamily:
                                                                  'Nunito',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700)),
                                                      Container(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                0, 3, 0, 10),
                                                        child: Text(
                                                            "Category: ${category}",
                                                            style: const TextStyle(
                                                                fontFamily:
                                                                    'Nunito',
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w800,
                                                                color: Colors
                                                                    .black54)),
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            'PKR + ${price}/-',
                                                            style: const TextStyle(
                                                                fontSize: 16,
                                                                fontFamily:
                                                                    'Nunito',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w800),
                                                          ),
                                                          const Text(
                                                            r' Current Bid',
                                                            style: TextStyle(
                                                                fontSize: 13,
                                                                color: Colors
                                                                    .black45,
                                                                fontFamily:
                                                                    'Nunito',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w800),
                                                          )
                                                        ],
                                                      ),
                                                      Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .fromLTRB(
                                                                  0, 10, 0, 0),
                                                          child: Text(
                                                              'Ends in ${time}',
                                                              style: const TextStyle(
                                                                  fontSize: 18,
                                                                  fontFamily:
                                                                      'Nunito',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400))),
                                                    ]),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .fromLTRB(
                                                        15, 0, 15, 20),
                                                    child: Center(
                                                      child: SizedBox(
                                                        width: double.infinity,
                                                        height: 45,
                                                        child: TextButton(
                                                          style: ButtonStyle(
                                                              backgroundColor:
                                                                  MaterialStateProperty.all<
                                                                          Color>(
                                                                      const Color.fromARGB(
                                                                          255,
                                                                          80,
                                                                          232,
                                                                          176)),
                                                              shape: MaterialStateProperty.all<
                                                                      RoundedRectangleBorder>(
                                                                  RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(15)))),
                                                          onPressed: () {
                                                            pr.print(title);

                                                            Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        ServiceView(
                                                                  title: title,
                                                                  email: email,
                                                                  category:
                                                                      category,
                                                                  price: price,
                                                                  time: time,
                                                                  id: id,
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                          child: const Text(
                                                              'OFFER',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black87,
                                                                  fontFamily:
                                                                      'Nunito',
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700)),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                });
                              });
                        }
                      },
                    );
                    // GridView.builder(
                    //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    //         crossAxisCount: 1,
                    //         mainAxisSpacing: 7,
                    //         crossAxisSpacing: 0,
                    //         childAspectRatio: aspectRatio),
                    //     itemCount: 8,
                    //     itemBuilder: (context, index) {
                    //       return LayoutBuilder(builder: (BuildContext context,
                    //           BoxConstraints constraints) {
                    //         return Container(
                    //           width: constraints.maxWidth,
                    //           height: constraints.maxHeight,
                    //           margin: const EdgeInsets.symmetric(
                    //               vertical: 12, horizontal: 21),
                    //           child: Column(
                    //             crossAxisAlignment: CrossAxisAlignment.start,
                    //             children: [
                    //               Expanded(
                    //                 child: Container(
                    //                   width: double.maxFinite,
                    //                   decoration: BoxDecoration(
                    //                     borderRadius: BorderRadius.circular(20),
                    //                     color: Colors.white,
                    //                     boxShadow: [
                    //                       BoxShadow(
                    //                         color:
                    //                             Colors.black.withOpacity(0.1),
                    //                         spreadRadius: 0,
                    //                         blurRadius: 12,
                    //                         offset: const Offset(0,
                    //                             4), // changes position of shadow
                    //                       ),
                    //                     ],
                    //                   ),
                    //                   child: Center(
                    //                     child: Column(
                    //                       mainAxisAlignment:
                    //                           MainAxisAlignment.spaceBetween,
                    //                       children: [
                    //                         ClipRRect(
                    //                           borderRadius:
                    //                               const BorderRadius.only(
                    //                             topLeft: Radius.circular(20),
                    //                             topRight: Radius.circular(20),
                    //                           ),
                    //                           child: Image.network(
                    //                               data[index]['image'],
                    //                               width: MediaQuery.of(context)
                    //                                   .size
                    //                                   .width,
                    //                               height: 180,
                    //                               fit: BoxFit.cover),
                    //                         ),
                    //                         Container(
                    //                           padding: const EdgeInsets.all(15),
                    //                           child: Column(children: [
                    //                             Text(data[index]['name'],
                    //                                 style: const TextStyle(
                    //                                     fontSize: 20,
                    //                                     fontFamily: 'Nunito',
                    //                                     fontWeight:
                    //                                         FontWeight.w700)),
                    //                             Container(
                    //                               alignment:
                    //                                   Alignment.centerLeft,
                    //                               padding:
                    //                                   const EdgeInsets.fromLTRB(
                    //                                       0, 3, 0, 10),
                    //                               child: const Text(
                    //                                   "Category: Electrician",
                    //                                   style: TextStyle(
                    //                                       fontFamily: 'Nunito',
                    //                                       fontSize: 14,
                    //                                       fontWeight:
                    //                                           FontWeight.w800,
                    //                                       color:
                    //                                           Colors.black54)),
                    //                             ),
                    //                             Row(
                    //                               children: [
                    //                                 Text(
                    //                                   '${r'PKR ' + data[index]['price']}/-',
                    //                                   style: const TextStyle(
                    //                                       fontSize: 16,
                    //                                       fontFamily: 'Nunito',
                    //                                       fontWeight:
                    //                                           FontWeight.w800),
                    //                                 ),
                    //                                 const Text(
                    //                                   r' Current Bid',
                    //                                   style: TextStyle(
                    //                                       fontSize: 13,
                    //                                       color: Colors.black45,
                    //                                       fontFamily: 'Nunito',
                    //                                       fontWeight:
                    //                                           FontWeight.w800),
                    //                                 )
                    //                               ],
                    //                             ),
                    //                             const Padding(
                    //                                 padding:
                    //                                     EdgeInsets.fromLTRB(
                    //                                         0, 10, 0, 0),
                    //                                 child: Text(
                    //                                     r'Ends in 03hr 13m 15s',
                    //                                     style: TextStyle(
                    //                                         fontSize: 18,
                    //                                         fontFamily:
                    //                                             'Nunito',
                    //                                         fontWeight:
                    //                                             FontWeight
                    //                                                 .w400))),
                    //                           ]),
                    //                         ),
                    //                         Padding(
                    //                           padding:
                    //                               const EdgeInsets.fromLTRB(
                    //                                   15, 0, 15, 20),
                    //                           child: Center(
                    //                             child: SizedBox(
                    //                               width: double.infinity,
                    //                               height: 45,
                    //                               child: TextButton(
                    //                                 style: ButtonStyle(
                    //                                     backgroundColor:
                    //                                         MaterialStateProperty.all<Color>(
                    //                                             const Color.fromARGB(
                    //                                                 255,
                    //                                                 80,
                    //                                                 232,
                    //                                                 176)),
                    //                                     shape: MaterialStateProperty.all<
                    //                                             RoundedRectangleBorder>(
                    //                                         RoundedRectangleBorder(
                    //                                             borderRadius:
                    //                                                 BorderRadius.circular(15)))),
                    //                                 onPressed: () {
                    //                                   Navigator.push(
                    //                                       context,
                    //                                       MaterialPageRoute(
                    //                                           builder: (context) =>
                    //                                               const ServiceView()));
                    //                                 },
                    //                                 child: const Text('OFFER',
                    //                                     style: TextStyle(
                    //                                         color:
                    //                                             Colors.black87,
                    //                                         fontFamily:
                    //                                             'Nunito',
                    //                                         fontSize: 18,
                    //                                         fontWeight:
                    //                                             FontWeight
                    //                                                 .w700)),
                    //                               ),
                    //                             ),
                    //                           ),
                    //                         ),
                    //                       ],
                    //                     ),
                    //                   ),
                    //                 ),
                    //               ),
                    //             ],
                    //           ),
                    //         );
                    //       });
                    //     });
                  }),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
