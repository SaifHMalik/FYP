import 'package:flutter/material.dart';
import 'package:mazdoor_pk/dataServices.dart';
import 'package:mazdoor_pk/serviceView.dart';

class ServiceList extends StatefulWidget {
  @override
  _ServiceListState createState() => _ServiceListState();
}

class _ServiceListState extends State<ServiceList> {
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
                    return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
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
                              margin: const EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 21),
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
                                                  height: 180,
                                                  fit: BoxFit.cover),
                                            ),
                                            Container(
                                              padding: const EdgeInsets.all(15),
                                              child: Column(children: [
                                                Text(data[index]['name'],
                                                    style: const TextStyle(
                                                        fontSize: 20,
                                                        fontFamily: 'Nunito',
                                                        fontWeight:
                                                            FontWeight.w700)),
                                                Container(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          0, 3, 0, 10),
                                                  child: const Text(
                                                      "Category: Electrician",
                                                      style: TextStyle(
                                                          fontFamily: 'Nunito',
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w800,
                                                          color:
                                                              Colors.black54)),
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      '${r'PKR ' + data[index]['price']}/-',
                                                      style: const TextStyle(
                                                          fontSize: 16,
                                                          fontFamily: 'Nunito',
                                                          fontWeight:
                                                              FontWeight.w800),
                                                    ),
                                                    const Text(
                                                      r' Current Bid',
                                                      style: TextStyle(
                                                          fontSize: 13,
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
                                                            fontSize: 18,
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
                                                      15, 0, 15, 20),
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
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  const ServiceView()));
                                                    },
                                                    child: const Text('OFFER',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black87,
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
