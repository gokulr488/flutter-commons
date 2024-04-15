import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumericInputField extends StatelessWidget {
  const NumericInputField(
      {super.key,
      this.controller,
      required this.label,
      this.allowDecimal = false,
      this.onChange,
      this.onClear,
      this.readOnly = false,
      this.initialValue,
      this.inputDecoration,
      this.textFormFieldWidth,
      this.textFormFieldHeight,
      this.fontSize,
      this.padding});
  final TextEditingController? controller;
  final String label;
  final bool allowDecimal;
  final Function(String)? onChange;
  final void Function()? onClear;
  final bool readOnly;
  final String? initialValue;
  final InputDecoration? inputDecoration;
  final double? textFormFieldWidth;
  final double? textFormFieldHeight;
  final double? fontSize;
  final double? padding;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Padding(
      padding:
          EdgeInsets.all(padding ?? MediaQuery.of(context).size.width * 0.005),
      child: SizedBox(
        height: textFormFieldHeight ?? screenSize.height * 0.045,
        width: textFormFieldWidth ?? screenSize.width * 0.164,
        child: TextFormField(
          initialValue: initialValue,
          readOnly: readOnly,
          onChanged: onChange,
          controller: controller,
          decoration: updateLabel(inputDecoration!, label) ??
              InputDecoration(
                hintStyle: const TextStyle(color: Colors.white),
                labelStyle: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.009,
                ),
                suffixIcon: onClear != null
                    ? IconButton(
                        onPressed: onClear,
                        icon: const Icon(Icons.clear),
                      )
                    : null,
                border: const OutlineInputBorder(),
                labelText: label,
              ),
          style: TextStyle(
            fontSize: fontSize ?? MediaQuery.of(context).size.width * 0.008,
          ),
          keyboardType: TextInputType.number,
          inputFormatters: [
            allowDecimal
                ? FilteringTextInputFormatter.allow(RegExp('[0-9.]'))
                : FilteringTextInputFormatter.digitsOnly
          ],
        ),
      ),
    );
  }

  InputDecoration updateLabel(InputDecoration decoration, String newLabel) {
    return decoration.copyWith(labelText: newLabel);
  }
}
