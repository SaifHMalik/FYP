import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mazdoor_pk/dataProducts.dart';
import 'package:mazdoor_pk/productView.dart';
import 'printing.dart' as pr;

class ProductList1 extends StatefulWidget {
  @override
  _ProductListState1 createState() => _ProductListState1();
}

class _ProductListState1 extends State<ProductList1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('Product').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Text("Connection Error");
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text("Loading...");
            }

            var docs = snapshot.data!.docs;
            return ListView.separated(
                itemCount: docs.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      // Text("${docs[index]["basePrice"]}"),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    spreadRadius: 0,
                                    blurRadius: 12,
                                    offset: const Offset(
                                        0, 4), // changes position of shadow
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ], //
                  ); //
                },
                separatorBuilder: (context, Index) {
                  return Divider();
                });
          },
        ),
      ),
    );
  }
}
