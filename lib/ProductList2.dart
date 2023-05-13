import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mazdoor_pk/dataProducts.dart';
import 'package:mazdoor_pk/productView.dart';
import 'printing.dart' as pr;

class ProductList2 extends StatefulWidget {
  @override
  _ProductListState2 createState() => _ProductListState2();
}

class _ProductListState2 extends State<ProductList2> {
  Future getGridView() async {
    var firestore = FirebaseFirestore.instance;
    QuerySnapshot snap = await firestore.collection("Product").get();
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
          child: FutureBuilder(
        future: getGridView(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return RefreshIndicator(
              onRefresh: getRegresh,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                ),
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  final title = snapshot.data[index]["title"];
                  final basePrice =
                      snapshot.data[index]["basePrice"].toDouble();
                  final description = snapshot.data[index]["description"];
                  final actualPrice =
                      snapshot.data[index]["actualPrice"].toDouble();
                  final seller = snapshot.data[index]["user"];
                  final sellerEmail = snapshot.data[index]["userEmail"];
                  final category = snapshot.data[index]["category"];
                  final id = snapshot.data[index]["id"];
                  final image = snapshot.data[index]["image"];
                  Timestamp timestamp =
                      snapshot.data[index]["time"] as Timestamp;
                  DateTime dateTime = timestamp.toDate();
                  final time = dateTime.toString();

                  return Card(
                    elevation: 10.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 5, top: 15),
                            child: Text("Title: ${title}"),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 5, top: 10),
                            child: Text("Description: ${description}"),
                          ),
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                            child: Image.network(data[index]['image'],
                                width: MediaQuery.of(context).size.width,
                                height: 120,
                                fit: BoxFit.contain),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 5, top: 8),
                            child: Text("Price: ${actualPrice}"),
                          ),
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                              child: Center(
                                child: SizedBox(
                                  width: double.infinity,
                                  height: 45,
                                  child: TextButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                const Color.fromARGB(
                                                    255, 80, 232, 176)),
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        15)))),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => ProductView(
                                                  title: title,
                                                  description: description,
                                                  basePrice: basePrice,
                                                  actualPrice: actualPrice,
                                                  category: category,
                                                  sellerEmail: sellerEmail,
                                                  seller: seller,
                                                  image: image,
                                                  time: time,
                                                  id: id)));
                                    },
                                    child: const Text('PLACE BID',
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontFamily: 'Nunito',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700)),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }
        },
      )),
    );
  }
}
