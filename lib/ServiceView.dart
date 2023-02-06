import 'package:flutter/material.dart';

// ignore: camel_case_types
class ServiceView extends StatefulWidget {
  const ServiceView({Key? key}) : super(key: key);

  @override
  State<ServiceView> createState() => ServiceViewState();
}

// ignore: camel_case_types
class ServiceViewState extends State<ServiceView> {
  @override
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                          'I need an Electrician to replace 5 sockets at my Home.',
                                          style: TextStyle(
                                              fontSize: 23,
                                              fontFamily: 'Nunito',
                                              fontWeight: FontWeight.w600)),
                                      const SizedBox(height: 15),
                                      Row(
                                        children: const [
                                          CircleAvatar(
                                            backgroundImage:
                                                AssetImage('profile.jpg'),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text('Vinesh Juriasinghani',
                                              style: TextStyle(
                                                  fontFamily: 'Nunito')),
                                        ],
                                      ),
                                      const SizedBox(height: 20),
                                      const Text(
                                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.',
                                          style:
                                              TextStyle(fontFamily: 'Nunito')),
                                      const SizedBox(height: 20),
                                      Row(
                                        children: const [
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
                                            '03hr 14m 12s',
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
                                                        const Color.fromARGB(
                                                            255, 80, 232, 176)),
                                                onPressed: ((() {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const ServiceView()));
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
                    ])),
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
