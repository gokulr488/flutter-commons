import 'package:flutter/material.dart';
import 'package:talos_commons/widgets/base_screen.dart';
import 'package:talos_commons/widgets/build_text_field.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Options Genie',
      theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: Colors.amber,
          brightness: Brightness.dark,
          textTheme: GoogleFonts.openSansTextTheme(
              ThemeData(brightness: Brightness.dark).textTheme)),
      home: BaseScreen(
          headerText: '',
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(children: [
              BuildTextField(
                  // width: 300,
                  label: 'Text Widget',
                  initialValue: 'Test',
                  onChanged: (p0) => p0),
            ]),
          )),
    );
  }
}
