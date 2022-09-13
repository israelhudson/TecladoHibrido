import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_cursive_writing/features/customize/page/customize_page.dart';
import 'package:keyboard_cursive_writing/features/keyboard/ui/keyboard_ui.dart';

import 'core/binding/bindings.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Bindings.initilizeBinding();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Keyboard App',
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        initialRoute: "/customize",
        routes: {
          '/keyboard': (context) => const KeyboardUi(),
          '/customize': (context) => const CustomizePage(),
        });
  }
}
