import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:talos_commons/talos_commons.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen(
      {super.key,
      this.bottomNavBar,
      required this.headerText,
      required this.child,
      this.drawer,
      this.floatingActionButton,
      this.appBarRightWidget});
  final Widget child;
  final Widget? bottomNavBar;
  final String headerText;
  final Widget? drawer;
  final Widget? floatingActionButton;
  final Widget? appBarRightWidget;
  @override
  Widget build(BuildContext context) {
    currentContext = context;
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
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    headerText,
                    style: GoogleFonts.laila(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: 20,
                    ),
                  ),
                  if (appBarRightWidget != null) appBarRightWidget!
                ],
              ),
            ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(child: child),
      bottomNavigationBar: bottomNavBar,
      floatingActionButton: floatingActionButton,
    );
  }
}
