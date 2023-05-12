import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class ProductView extends StatefulWidget {
  final title;
  final description;
  final sellerEmail;
  final basePrice;
  final actualPrice;
  final category;
  final seller;

  const ProductView({
    Key? key,
    required this.title,
    required this.sellerEmail,
    required this.description,
    required this.basePrice,
    required this.actualPrice,
    required this.category,
    required this.seller,
  }) : super(key: key);

  @override
  State<ProductView> createState() => ProductViewState();
}

// ignore: camel_case_types
class ProductViewState extends State<ProductView> {
  final firebase = FirebaseFirestore.instance.collection("users");
  String userName = "";

  Future<void> getUser() async {
    final query =
        await firebase.where("userEmail", isEqualTo: widget.sellerEmail).get();
    if (query.docs.isNotEmpty) {
      final user = query.docs.first.data();
      setState(() {
        userName = user['userName'];
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getUser();
  }

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
                      image: AssetImage('productImage.jpg'),
                      fit: BoxFit.fitHeight,
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
                                            Text("${userName}",
                                                style: TextStyle(
                                                    fontFamily: 'Nunito')),
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        Text(widget.description,
                                            style: TextStyle(
                                                fontFamily: 'Nunito')),
                                        const SizedBox(height: 20),
                                        Row(
                                          children: const [
                                            Text(
                                              'Ends in: ',
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      40, 175, 125, 1),
                                                  fontWeight: FontWeight.w900,
                                                  fontFamily: 'Nunito'),
                                            ),
                                            Text(
                                              '03hr 14m 12s',
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      40, 175, 125, 1),
                                                  fontWeight: FontWeight.w700,
                                                  fontFamily: 'Nunito'),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          children: const [
                                            Text(
                                              'Current Bid: ',
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Nunito'),
                                            ),
                                            Text(
                                              'PKR 8,500/-',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontFamily: 'Nunito'),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 20,
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
                                          height: 20,
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
                                                          Color.fromARGB(255,
                                                              80, 232, 176)),
                                                  onPressed: ((() {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                const ProductView(
                                                                  actualPrice:
                                                                      null,
                                                                  basePrice:
                                                                      null,
                                                                  category:
                                                                      null,
                                                                  description:
                                                                      null,
                                                                  seller: null,
                                                                  sellerEmail:
                                                                      null,
                                                                  title: null,
                                                                )));
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
                      ]),
                ),
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
