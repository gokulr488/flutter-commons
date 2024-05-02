import 'package:flutter/material.dart';

class CheckBoxWidget extends StatelessWidget {
  const CheckBoxWidget(
      {super.key,
      required this.fieldName,
      this.initialValue = false,
      this.onChanged,
      this.padding});
  final String fieldName;
  final bool initialValue;
  final Function(bool? value)? onChanged;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(10),
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Text(fieldName,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.of(context).size.width * 0.009)),
        Transform.scale(
          scale: MediaQuery.of(context).size.width * 0.001 / 1.5,
          child: Checkbox(
              activeColor: Theme.of(context).colorScheme.primary,
              value: initialValue,
              onChanged: onChanged),
        )
      ]),
    );
  }
}
