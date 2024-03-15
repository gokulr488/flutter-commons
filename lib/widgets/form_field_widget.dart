import 'package:flutter/material.dart';

class FormFieldWidget extends StatelessWidget {
  const FormFieldWidget(
      {super.key, required this.fieldName, required this.controller, this.onChanged});
  final String fieldName;
  final TextEditingController controller;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(fieldName,
              style:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          const SizedBox(width: 10),
          Expanded(
            child: TextFormField(
              controller: controller,
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
