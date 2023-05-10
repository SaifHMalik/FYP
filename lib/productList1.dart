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
            return Text('${docs.length}');
          },
        ),
      ),
    );
  }
}
