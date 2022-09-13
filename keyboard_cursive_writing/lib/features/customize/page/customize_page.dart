import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:keyboard_cursive_writing/controller.dart';

class CustomizePage extends StatefulWidget {
  const CustomizePage({Key? key}) : super(key: key);

  @override
  State<CustomizePage> createState() => _CustomizePageState();
}

class _CustomizePageState extends State<CustomizePage> {
  final controller = GetIt.I<Controller>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Keyboard'),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(top: 20, left: 5, right: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const Text(
              "Escolha uma cor para o teclado:",
            ),
            Container(
              width: double.infinity,
              height: 50,
              alignment: Alignment.center,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  widgetSetColor(
                      color: const Color(0xFF16a085), hexaColor: "0xFF16a085"),
                  widgetSetColor(
                      color: const Color(0xFFf39c12), hexaColor: "0xFFf39c12"),
                  widgetSetColor(
                      color: const Color(0xFF2980b9), hexaColor: "0xFF2980b9"),
                  widgetSetColor(
                      color: const Color(0xFF34495e), hexaColor: "0xFF34495e"),
                  widgetSetColor(
                      color: const Color(0xFF95a5a6), hexaColor: "0xFF95a5a6"),
                  widgetSetColor(
                      color: const Color(0xFFd35400), hexaColor: "0xFFd35400"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                decoration: const InputDecoration(
                    hintText: "Click aqui para testar o teclado"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget widgetSetColor({Color color = Colors.teal, hexaColor = "0xFF1abc9c"}) {
    return InkWell(
      onTap: () {
        controller.update(color: hexaColor);
      },
      child: Card(
        color: color,
        child: Container(
          width: 50,
          height: 50,
          color: Colors.transparent,
        ),
      ),
    );
  }
}
