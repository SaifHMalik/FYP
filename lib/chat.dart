import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';

// @dart=2.9

void main() => runApp(MaterialApp(
      home: ChatMessaging(),
    ));

class ChatMessaging extends StatefulWidget {
  @override
  State<ChatMessaging> createState() => _ChatMessagingState();
}

class Message {
  final String text;
  final DateTime date;
  final bool isSentByME;

  const Message({
    required this.text,
    required this.date,
    required this.isSentByME,
  });
}

class _ChatMessagingState extends State<ChatMessaging> {
  List<Message> messages = [
    Message(
      text: "Hello",
      date: DateTime.now().subtract(Duration(minutes: 1)),
      isSentByME: false,
    ),
    Message(
        text: "Hi",
        date: DateTime.now().subtract(Duration(minutes: 1)),
        isSentByME: true),
  ].reversed.toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('James Wood',
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontFamily: 'Nunito',
                fontSize: 17)),
        backgroundColor: Color.fromARGB(255, 203, 203, 203),
        foregroundColor: Colors.black,
        shadowColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_outlined),
          onPressed: (() {
            Navigator.pop(context);
          }),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: GroupedListView<Message, DateTime>(
                padding: const EdgeInsets.all(8),
                reverse: true,
                order: GroupedListOrder.DESC,
                useStickyGroupSeparators: true,
                floatingHeader: true,
                elements: messages,
                groupBy: (message) => DateTime(
                  message.date.year,
                  message.date.month,
                  message.date.day,
                ),
                groupHeaderBuilder: (Message message) => SizedBox(
                  height: 40,
                  child: Center(
                      child: Card(
                    color: Theme.of(context).primaryColor,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        DateFormat('MMMM d, y').format(message.date),
                        style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  )),
                ),
                itemBuilder: (context, Message message) => Align(
                  alignment: message.isSentByME
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Card(
                    elevation: 8,
                    color: message.isSentByME
                        ? Color.fromARGB(255, 80, 232, 176)
                        : Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(message.text,
                          style: const TextStyle(
                              fontFamily: 'Nunito',
                              fontWeight: FontWeight.w600)),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              child: TextField(
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(12),
                    hintText: "Type Message",
                    hintStyle: const TextStyle(
                        fontFamily: 'Nunito', fontWeight: FontWeight.w600)),
                onSubmitted: (text) {
                  final message = Message(
                      text: text, date: DateTime.now(), isSentByME: true);
                  setState(() => messages.add(message));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
