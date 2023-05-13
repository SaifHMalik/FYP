import 'package:flutter/material.dart';
import 'package:mazdoor_pk/dataProducts.dart';
import 'package:mazdoor_pk/productView.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
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
                    children: const [
                      Text(
                        'Recent Items',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 30,
                            fontFamily: 'Nunito'),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: LayoutBuilder(builder:
                      (BuildContext context, BoxConstraints constraints) {
                    double width = constraints.maxWidth;

                    double aspectRatio = (width - 100) / 600;
                    return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 7,
                            crossAxisSpacing: 0,
                            childAspectRatio: aspectRatio),
                        itemCount: 8,
                        itemBuilder: (context, index) {
                          return LayoutBuilder(builder: (BuildContext context,
                              BoxConstraints constraints) {
                            return Container(
                              width: constraints.maxWidth,
                              height: constraints.maxHeight,
                              margin: const EdgeInsets.all(15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Container(
                                      width: double.maxFinite,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.1),
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
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                topRight: Radius.circular(20),
                                              ),
                                              child: Image.network(
                                                  data[index]['image'],
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: 120,
                                                  fit: BoxFit.cover),
                                            ),
                                            Container(
                                              padding: const EdgeInsets.all(15),
                                              child: Column(children: [
                                                Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(0, 0, 0, 10),
                                                    child: Text(
                                                        data[index]['name'],
                                                        style: const TextStyle(
                                                            fontSize: 16,
                                                            fontFamily:
                                                                'Nunito',
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700))),
                                                Wrap(
                                                  runSpacing: 1.0,
                                                  spacing: 1.0,
                                                  children: [
                                                    Text(
                                                      '${r'PKR ' + data[index]['price']}/-',
                                                      style: const TextStyle(
                                                          fontSize: 14,
                                                          fontFamily: 'Nunito',
                                                          fontWeight:
                                                              FontWeight.w800),
                                                    ),
                                                    const Text(
                                                      r' Current Bid',
                                                      style: TextStyle(
                                                          fontSize: 11,
                                                          color: Colors.black45,
                                                          fontFamily: 'Nunito',
                                                          fontWeight:
                                                              FontWeight.w800),
                                                    )
                                                  ],
                                                ),
                                                const Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            0, 10, 0, 0),
                                                    child: Text(
                                                        r'Ends in 03hr 13m 15s',
                                                        style: TextStyle(
                                                            fontSize: 13,
                                                            fontFamily:
                                                                'Nunito',
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400))),
                                              ]),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      15, 0, 15, 15),
                                              child: Center(
                                                child: SizedBox(
                                                  width: double.infinity,
                                                  height: 45,
                                                  child: TextButton(
                                                    style: ButtonStyle(
                                                        backgroundColor:
                                                            MaterialStateProperty.all<Color>(
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
                                                      // Navigator.push(
                                                      //     context,
                                                      //     MaterialPageRoute(
                                                      //         builder: (context) =>
                                                      //             const ProductView(),
                                                      //             )
                                                      //             ,);
                                                    },
                                                    child: const Text(
                                                        'PLACE BID',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black87,
                                                            fontFamily:
                                                                'Nunito',
                                                            fontSize: 16,
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
