import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

class KeyboardUi extends StatefulWidget {
  const KeyboardUi({Key? key}) : super(key: key);

  @override
  State<KeyboardUi> createState() => _KeyboardUiState();
}

class _KeyboardUiState extends State<KeyboardUi> {
  static const String _keyboardChannel = 'keyboard_channel';
  static const BasicMessageChannel<String?> _keyboardMessageChannel =
      BasicMessageChannel<String?>(_keyboardChannel, StringCodec());

  void sendText(String text) {
    _keyboardMessageChannel.send(text);
  }

  final db = GetIt.I<FirebaseFirestore>();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: StreamBuilder<QuerySnapshot>(
          stream: db.collection('config').snapshots(),
          builder: (context, snapshot) {
            late Color bgColor;
            if (snapshot.hasData) {
              DocumentSnapshot doc = snapshot.data!.docs[0];
              if (doc['colorHex'] != null) {
                bgColor = Color(int.parse(doc['colorHex']));
              } else {
                bgColor = Colors.teal;
              }
            } else {
              bgColor = Colors.teal;
            }

            return Container(
              color: bgColor,
              padding: const EdgeInsets.all(2),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 20,
                    color: Colors.white10,
                  ),
                  const Text('Keyboard UI Flutter'),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      itemViewKeyboard(value: "0"),
                      itemViewKeyboard(value: "1"),
                      itemViewKeyboard(value: "2"),
                      itemViewKeyboard(value: "3"),
                      itemViewKeyboard(value: "4"),
                      itemViewKeyboard(value: "5"),
                      itemViewKeyboard(value: "6"),
                      itemViewKeyboard(value: "7"),
                      itemViewKeyboard(value: "8"),
                      itemViewKeyboard(value: "9"),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      itemViewKeyboard(value: "q"),
                      itemViewKeyboard(value: "w"),
                      itemViewKeyboard(value: "e"),
                      itemViewKeyboard(value: "r"),
                      itemViewKeyboard(value: "t"),
                      itemViewKeyboard(value: "y"),
                      itemViewKeyboard(value: "u"),
                      itemViewKeyboard(value: "i"),
                      itemViewKeyboard(value: "o"),
                      itemViewKeyboard(value: "p"),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      itemViewKeyboard(value: "a"),
                      itemViewKeyboard(value: "s"),
                      itemViewKeyboard(value: "d"),
                      itemViewKeyboard(value: "f"),
                      itemViewKeyboard(value: "g"),
                      itemViewKeyboard(value: "h"),
                      itemViewKeyboard(value: "j"),
                      itemViewKeyboard(value: "k"),
                      itemViewKeyboard(value: "l"),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      itemViewKeyboard(value: "z"),
                      itemViewKeyboard(value: "x"),
                      itemViewKeyboard(value: "c"),
                      itemViewKeyboard(value: "v"),
                      itemViewKeyboard(value: "b"),
                      itemViewKeyboard(value: "n"),
                      itemViewKeyboard(value: "m"),
                      itemIconKeyboard(value: "delete", icon: Icons.arrow_back),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      sendText(" ");
                    },
                    child: Card(
                      color: Colors.white70,
                      child: Container(
                        width: 200,
                        height: 35,
                        color: Colors.transparent,
                        padding: const EdgeInsets.all(0.5),
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }

  Widget itemViewKeyboard({String value = ""}) {
    return InkWell(
      onTap: () {
        sendText(value);
      },
      onLongPress: () {
        sendText(value.toUpperCase());
      },
      child: Card(
        color: Colors.white70,
        child: Container(
          color: Colors.transparent,
          padding: const EdgeInsets.all(0.5),
          width: 30,
          height: 40,
          alignment: Alignment.center,
          child: Text(
            value,
            style: const TextStyle(color: Colors.black, fontSize: 20),
          ),
        ),
      ),
    );
  }

  Widget itemIconKeyboard({String value = "", IconData icon = Icons.ac_unit}) {
    return InkWell(
      onTap: () {
        sendText(value);
      },
      child: Card(
        color: Colors.white70,
        child: Container(
          color: Colors.transparent,
          padding: const EdgeInsets.all(0.5),
          width: 30,
          height: 40,
          alignment: Alignment.center,
          child: Icon(
            icon,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
