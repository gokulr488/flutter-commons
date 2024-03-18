import 'package:flutter/material.dart';

class BuildTextField extends StatelessWidget {
  const BuildTextField({
    super.key,
    this.controller,
    required this.label,
    this.onChanged,
    this.readOnly = false,
    this.initialValue,
    this.labelStyle,
  });
  final TextEditingController? controller;
  final String label;
  final void Function(String)? onChanged;
  final bool readOnly;
  final String? initialValue;
  final TextStyle? labelStyle;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.005),
      child: SizedBox(
        height: screenSize.height * 0.045,
        width: screenSize.width * 0.164,
        child: TextFormField(
          initialValue: initialValue,
          readOnly: readOnly,
          onChanged: onChanged,
          controller: controller,
          decoration: InputDecoration(
            hintStyle: TextStyle(
              color: Colors.white,
              fontSize: MediaQuery.of(context).size.width * 0.008,
            ),
            border: const OutlineInputBorder(),
            labelText: label,
            labelStyle: labelStyle,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          ),
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width * 0.008,
          ),
        ),
      ),
    );
  }
}
