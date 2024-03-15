import 'package:flutter/material.dart';

class ScrollPane extends StatelessWidget {
  ScrollPane({super.key, required this.child});
  final ScrollController _horizontal = ScrollController(),
      _vertical = ScrollController();

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
        controller: _vertical,
        child: Scrollbar(
            controller: _horizontal,
            notificationPredicate: (notif) => notif.depth == 1,
            child: SingleChildScrollView(
                controller: _vertical,
                child: SingleChildScrollView(
                    controller: _horizontal,
                    scrollDirection: Axis.horizontal,
                    child: child))));
  }
}
