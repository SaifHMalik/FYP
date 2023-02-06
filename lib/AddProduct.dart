import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  String dropdownvalue = 'Electronics';
  DateTime _selectedDate = DateTime.now();
  // List of items in our dropdown menu
  var items = ['Electronics', 'Home Decorations', 'Jewellery'];
  bool value = false;

  Duration selectedTime = Duration(
    hours: DateTime.now().hour,
    minutes: DateTime.now().minute,
  );

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime(_selectedDate.year),
        lastDate:
            DateTime((_selectedDate.add(const Duration(days: 365)).year)));
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.black87,
            shadowColor: Colors.transparent,
            leading: IconButton(
                icon: Icon(Icons.arrow_back_ios_new_outlined),
                onPressed: (() {
                  Navigator.pop(context);
                }))),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 10),
                  alignment: Alignment.topLeft,
                  child: const Text(
                    "Add your Product",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 23,
                        fontFamily: 'Nunito'),
                  ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                    height: 60,
                    child: InputDecorator(
                        decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 39, 193, 136),
                                width: 2.0,
                              ),
                            ),
                            labelText: 'Product Category',
                            labelStyle: TextStyle(
                              fontFamily: 'Nunito',
                              fontWeight: FontWeight.w600,
                            ),
                            border: OutlineInputBorder()),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                              value: dropdownvalue,
                              icon: const Icon(Icons.keyboard_arrow_down),
                              // Array list of items
                              items: items.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownvalue = newValue!;
                                });
                              }),
                        ))),
                const SizedBox(height: 15),
                SizedBox(
                  width: double.infinity,
                  child: TextFormField(
                      decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 39, 193, 136),
                        width: 2.0,
                      ),
                    ),
                    border: OutlineInputBorder(),
                    labelText: 'Title',
                    floatingLabelStyle: TextStyle(
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 39, 193, 136)),
                    contentPadding: EdgeInsets.all(10),
                  )),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  width: double.infinity,
                  child: TextFormField(
                      maxLines: 4,
                      decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 39, 193, 136),
                            width: 2.0,
                          ),
                        ),
                        border: OutlineInputBorder(),
                        labelText: 'Description',
                        floatingLabelStyle: TextStyle(
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 39, 193, 136)),
                        contentPadding: EdgeInsets.all(10),
                      ),
                      style: TextStyle(
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w600,
                          height: 1.6)),
                ),
                const SizedBox(height: 18),
                const Text('When to End the Bid?',
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 16,
                        fontFamily: 'Nunito')),
                const SizedBox(height: 18),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () => _selectDate(context),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Text(
                            'Select Date',
                            style: TextStyle(
                                color: Color.fromARGB(255, 39, 193, 136),
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(width: 8),
                          Icon(
                            Icons.calendar_today,
                            color: Color.fromARGB(255, 39, 193, 136),
                          ),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return CupertinoTimerPicker(
                              onTimerDurationChanged: (Duration newTimer) {
                                setState(() {
                                  selectedTime = newTimer;
                                });
                              },
                              initialTimerDuration:
                                  selectedTime ?? Duration(minutes: 15),
                            );
                          },
                        );
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Text('Select Time',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 39, 193, 136),
                                  fontFamily: 'Nunito',
                                  fontWeight: FontWeight.w500)),
                          SizedBox(width: 8),
                          Icon(
                            Icons.access_time_filled_rounded,
                            color: Color.fromARGB(255, 39, 193, 136),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.43,
                        child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 39, 193, 136),
                                  width: 2.0,
                                ),
                              ),
                              border: OutlineInputBorder(),
                              labelText: 'Base Price',
                              floatingLabelStyle: TextStyle(
                                  fontFamily: 'Nunito',
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromARGB(255, 39, 193, 136)),
                              contentPadding: EdgeInsets.all(10),
                            )),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.43,
                        child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 39, 193, 136),
                                  width: 2.0,
                                ),
                              ),
                              border: OutlineInputBorder(),
                              labelText: 'Actual Price',
                              floatingLabelStyle: TextStyle(
                                  fontFamily: 'Nunito',
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromARGB(255, 39, 193, 136)),
                              contentPadding: EdgeInsets.all(10),
                            )),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Center(
                    child: SizedBox(
                      width: double.infinity,
                      height: 45,
                      child: TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 80, 232, 176)),
                        onPressed: null,
                        child: const Text('Add Product',
                            style: TextStyle(
                                color: Colors.black87,
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.w500,
                                fontSize: 17)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
