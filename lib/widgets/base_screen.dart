import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen(
      {super.key,
      this.bottomNavBar,
      required this.headerText,
      required this.child,
      this.drawer,
      this.floatingActionButton});
  final Widget child;
  final Widget? bottomNavBar;
  final String headerText;
  final Widget? drawer;
  final Widget? floatingActionButton;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer,
      appBar: headerText.isEmpty
          ? null
          : AppBar(
              shadowColor: const Color.fromARGB(255, 0, 0, 0),
              elevation: 14,
              toolbarHeight: 45,
              iconTheme: IconThemeData(
                  color: Theme.of(context).colorScheme.inversePrimary),
              title: Text(
                headerText,
                style: GoogleFonts.laila(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 20,
                ),
              ),
            ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(child: child),
      bottomNavigationBar: bottomNavBar,
      floatingActionButton: floatingActionButton,
    );
  }
}
