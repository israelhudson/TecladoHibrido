import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_cursive_writing/features/customize/page/customize_page.dart';
import 'package:keyboard_cursive_writing/features/keyboard/ui/keyboard_ui.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        //home: const MyHomePage(title: 'Flutter Demo Home Page'),
        initialRoute: "/customize",
        routes: {
          '/keyboard': (context) => const KeyboardUi(),
          '/customize': (context) => const CustomizePage(),
        });
  }
}
