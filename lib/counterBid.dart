import 'package:flutter/material.dart';
import 'package:mazdoor_pk/NumberButton.dart';
import 'package:mazdoor_pk/homeServices.dart';
import 'package:mazdoor_pk/servicesPosted.dart';
import 'ServiceViewSeller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'printing.dart' as pr;
import 'select.dart';

class updateBid extends StatefulWidget {
  final double currentBidAmount;
  final id;
  //final parentId;

  const updateBid({
    super.key,
    required this.currentBidAmount,
    required this.id,
  });

  @override
  _CashPaymentScreenState createState() => _CashPaymentScreenState();
}

class _CashPaymentScreenState extends State<updateBid> {
  Future<void> updateBid(double amount, String _parentId) async {
    pr.print("aaaaaa");
    pr.print(_parentId);
    CollectionReference CollectionRef =
        FirebaseFirestore.instance.collection('Service');

    DocumentReference subDocRef = CollectionRef.doc(_parentId);

    subDocRef.update({'price': amount});
  }

  final _textEditingController = TextEditingController();
  final _focusNode = FocusNode();
  late double amount_entered;

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(34, 205, 142, 1.0),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height - 150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'current Bid Amount: PKR ${widget.currentBidAmount}}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Display a prompt for the user to enter the cash amount
                    const Text(
                      'Enter Cash Amount',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),

                    Container(
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: TextField(
                            controller: _textEditingController,
                            focusNode: _focusNode,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: '0.00',
                            ),
                            style: const TextStyle(fontSize: 24),
                            onTap: () {
                              // Disable keyboard when text field is tapped
                              _focusNode.unfocus();
                            },
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                NumberButton('1', onPressed: () {
                                  _textEditingController.text += '1';
                                }, number: '1'),
                                const SizedBox(width: 6),
                                NumberButton('2', onPressed: () {
                                  _textEditingController.text += '2';
                                }, number: '2'),
                                const SizedBox(width: 6),
                                NumberButton('3', onPressed: () {
                                  _textEditingController.text += '3';
                                }, number: '3'),
                              ],
                            ),
                            const SizedBox(height: 7),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                NumberButton(
                                  '4',
                                  onPressed: () {
                                    _textEditingController.text += '4';
                                  },
                                  number: '4',
                                ),
                                SizedBox(width: 6),
                                NumberButton('5', onPressed: () {
                                  _textEditingController.text += '5';
                                }, number: '5'),
                                SizedBox(width: 6),
                                NumberButton('6', onPressed: () {
                                  _textEditingController.text += '6';
                                }, number: '6'),
                              ],
                            ),
                            const SizedBox(height: 7),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                NumberButton('7', onPressed: () {
                                  _textEditingController.text += '7';
                                }, number: '7'),
                                const SizedBox(width: 6),
                                NumberButton('8', onPressed: () {
                                  _textEditingController.text += '8';
                                }, number: '8'),
                                const SizedBox(width: 6),
                                NumberButton('9', onPressed: () {
                                  _textEditingController.text += '9';
                                }, number: '9'),
                              ],
                            ),
                            const SizedBox(height: 7),
                            NumberButton('0', onPressed: () {
                              _textEditingController.text += '0';
                            }, number: '0'),
                          ],
                        ),
                        Column(
                          children: [
                            NumberButton(
                              '<-',
                              onPressed: () {
                                String currentValue =
                                    _textEditingController.text;
                                if (currentValue.length > 0) {
                                  String newValue = currentValue.substring(
                                      0, currentValue.length - 1);
                                  _textEditingController.text = newValue;
                                  _textEditingController.selection =
                                      TextSelection.fromPosition(TextPosition(
                                          offset: newValue.length));
                                }
                              },
                              number: '<-',
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                        ),
                        onPressed: () {
                          amount_entered =
                              double.parse(_textEditingController.text);

                          updateBid(amount_entered, widget.id);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Amount Updated Succesfully.'),
                              duration: Duration(seconds: 5),
                            ),
                          );

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ServicesPosted(),
                            ),
                          );
                        },
                        child: const Text(
                          'Update Bid',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
