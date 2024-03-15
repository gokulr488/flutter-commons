import 'package:flutter/material.dart';

class HorLine extends StatelessWidget {
  const HorLine({super.key, this.margin});
  final double? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.5,
      color: Theme.of(context).colorScheme.tertiary.withOpacity(.3),
      margin: EdgeInsets.symmetric(vertical: margin ?? 0),
    );
  }
}

class VerLine extends StatelessWidget {
  const VerLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      decoration: const BoxDecoration(
        border: Border(
          right: BorderSide(
            color: Colors.black54,
            width: .5,
          ),
        ),
      ),
    );
  }
}
