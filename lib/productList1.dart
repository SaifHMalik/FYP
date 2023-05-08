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
  int index = 2;

  void getDocumentCount() async {
    final QuerySnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance.collection('Product').get();
    setState(() {
      index = snapshot.docs.length;
    });
  }

  @override
  void initState() {
    getDocumentCount();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: ListView.separated(
            itemCount: index,
            itemBuilder: (context, index) {
              return Container(
                child: Column(
                  children: [
                    Text("Item ${index + 1}"),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return Divider(
                height: 20,
              );
            },
          ),
        ),
      ),
    );
  }
}
