import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            height: 20,
            color: Colors.white10,
          ),
          const SizedBox(height: 10),
          const Text('Keyboard UI'),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              sendText("a");
            },
            child: const Text('a'),
          ),
          ElevatedButton(
            onPressed: () {
              sendText("delete");
            },
            child: const Text('<-'),
          ),
        ],
      ),
    );
  }
}
