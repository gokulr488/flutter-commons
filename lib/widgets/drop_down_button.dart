import 'package:flutter/material.dart';

class DropDownButton extends StatelessWidget {
  const DropDownButton(
      {super.key, required this.onChanged,
      required this.value,
      required this.values,
      this.hintText,
      this.icon});
  final Function onChanged;
  final String value;
  final List<String> values;
  final String? hintText;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 8,
      borderRadius: BorderRadius.circular(25),
      child: DropdownButtonFormField<String>(
        icon: Icon(icon ?? Icons.arrow_drop_down),
        decoration: InputDecoration(labelText: hintText),
        value: value,
        onChanged: (String? value) => onChanged(value),
        items: values
            .map((String value) =>
                DropdownMenuItem<String>(value: value, child: Text(value)))
            .toList(),
      ),
    );
  }
}
