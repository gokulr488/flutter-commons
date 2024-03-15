import 'package:flutter/material.dart';
import 'package:talos_commons/widgets/cards/base_card.dart';

class DatePicker extends StatelessWidget {
  const DatePicker(
      {super.key,
      required this.onTap,
      required this.text,
      this.label,
      this.height,
      this.width,
      this.baseCardBoarderRaduis,
      this.iconSize,
      this.color});
  final Function onTap;
  final String text;
  final String? label;
  final double? height;
  final double? width;
  final double? baseCardBoarderRaduis;
  final double? iconSize;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (label != null)
            Text(label!,
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
          BaseCard(
            color: color,
            boarderRaduis: baseCardBoarderRaduis,
            cardChild: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              height: height ?? 40,
              width: width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.date_range,
                      color: Theme.of(context).colorScheme.secondary,
                      size: iconSize ?? 30),
                  Text(text, style: const TextStyle(fontSize: 15))
                ],
              ),
            ),
            onTap: onTap,
          ),
        ],
      ),
    );
  }
}
