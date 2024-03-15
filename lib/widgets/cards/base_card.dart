import 'package:flutter/material.dart';

class BaseCard extends StatelessWidget {
  const BaseCard(
      {super.key, this.onTap,
      required this.cardChild,
      this.color,
      this.elevation,
      this.boarderRaduis});
  final Function? onTap;
  final Widget cardChild;
  final Color? color;
  final double? elevation;
  final double? boarderRaduis;

  @override
  InkWell build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onTap != null) onTap!();
      },
      child: Card(
        color: color ?? Theme.of(context).colorScheme.secondaryContainer,
        elevation: elevation ?? 4,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(boarderRaduis ?? 8)),
        child: Center(
          child: cardChild,
        ),
      ),
    );
  }
}
