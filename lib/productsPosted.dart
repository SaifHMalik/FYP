import 'package:flutter/material.dart';
import 'package:mazdoor_pk/AddProduct.dart';
import 'package:mazdoor_pk/productViewSeller.dart';

class ProductsPosted extends StatefulWidget {
  @override
  State<ProductsPosted> createState() => ProductsPostedState();
}

class ProductsPostedState extends State<ProductsPosted> {
  @override
  Widget build(BuildContext context) {
    var currentServices = ['1', '2', '3'];
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 20, 30, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 10),
                    child: const Text(
                      "Your Products",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 30,
                          fontFamily: 'Nunito'),
                    ),
                  ),
                  Container(
                    width: 170,
                    height: 60,
                    padding: const EdgeInsets.only(top: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(200, 230, 230, 230),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AddProduct()));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text('Add Product',
                                style: TextStyle(
                                    fontFamily: 'Nunito',
                                    color: Colors.black87,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600)),
                            Padding(
                              padding: EdgeInsets.only(left: 5.0),
                              child: Icon(
                                Icons.add,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Center(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 23),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: ((context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      alignment: Alignment.center,
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            padding: const EdgeInsets.fromLTRB(5, 0, 10, 0),
                            child: const Text(
                                "Gold Ring - Choice Ring for Bridals LR0076",
                                style: TextStyle(
                                    fontFamily: 'Nunito',
                                    fontSize: 19,
                                    fontWeight: FontWeight.w700)),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            padding: const EdgeInsets.fromLTRB(5, 5, 0, 0),
                            child: const Text("Category: Jewellery",
                                style: TextStyle(
                                    fontFamily: 'Nunito',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.black45)),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            padding: const EdgeInsets.fromLTRB(5, 15, 0, 0),
                            child: const Text("Base Price PKR 68,000/-",
                                style: TextStyle(
                                    fontFamily: 'Nunito',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black87)),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            padding: const EdgeInsets.fromLTRB(5, 5, 0, 0),
                            child: const Text("Highest Bid PKR 85,000/-",
                                style: TextStyle(
                                    fontFamily: 'Nunito',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700)),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            padding: const EdgeInsets.fromLTRB(5, 10, 0, 0),
                            child: const Text("Bid ends in 03hr 14m 12s",
                                style: TextStyle(
                                    fontFamily: 'Nunito',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500)),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            padding: const EdgeInsets.fromLTRB(5, 5, 0, 0),
                            child: const Text("Total Offers: 11",
                                style: TextStyle(
                                    fontFamily: 'Nunito',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black87)),
                          ),
                          Container(
                            width: double.infinity,
                            height: 95,
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 5),
                            child: TextButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<
                                          Color>(
                                      const Color.fromARGB(255, 80, 232, 176)),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)))),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ProductViewSeller()));
                              },
                              child: const Text('VIEW',
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontFamily: 'Nunito',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700)),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
