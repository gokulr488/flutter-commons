import 'package:flutter/material.dart';

class RadioButtonSelector extends StatefulWidget {
  const RadioButtonSelector({
    super.key,
    required this.option1,
    required this.option2,
    required this.selected,
    required this.onChanged,
    required this.activeColor,
    this.optionFontSize,
  });

  final String option1;
  final String option2;
  final double? optionFontSize;
  final String selected;
  final Color activeColor;
  final Function(String?) onChanged;

  @override
  RadioButtonSelectorState createState() => RadioButtonSelectorState();
}

class RadioButtonSelectorState extends State<RadioButtonSelector> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio<String>(
          activeColor: widget.activeColor,
          value: widget.option1,
          groupValue: widget.selected,
          onChanged: widget.onChanged,
        ),
        Text(
          widget.option1,
          style: TextStyle(fontSize: widget.optionFontSize),
        ),
        const SizedBox(width: 20),
        Radio<String>(
          activeColor: widget.activeColor,
          value: widget.option2,
          groupValue: widget.selected,
          onChanged: widget.onChanged,
        ),
        Text(
          widget.option2,
          style: TextStyle(fontSize: widget.optionFontSize),
        ),
      ],
    );
  }
}
