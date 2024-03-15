import 'package:flutter/material.dart';

class DropDown extends StatelessWidget {
  const DropDown(
      {super.key, required this.onChanged,
      required this.defaultValue,
      required this.values,
      this.hintText,
      this.containerWidth,
      this.containerHeght,
      this.dropDownpadding});
  final Function(dynamic) onChanged;
  final dynamic defaultValue;
  final List<dynamic> values;
  final String? hintText;
  final double? containerWidth;
  final double? containerHeght;
  final double? dropDownpadding;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.all(
          dropDownpadding ?? MediaQuery.of(context).size.width * 0.009),
      child: SizedBox(
        height: containerHeght ?? screenSize.height * 0.045,
        width: containerWidth ?? screenSize.width * 0.164,
        child: DropdownButtonFormField<dynamic>(
          style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.008,
              color: Colors.white),
          icon: Icon(
            Icons.arrow_drop_down_circle_outlined,
            color: Theme.of(context).colorScheme.secondary,
          ),
          iconSize: MediaQuery.of(context).size.width * 0.010,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.008,
              horizontal: MediaQuery.of(context).size.width * 0.008,
            ),
            hintStyle: Theme.of(context).textTheme.titleMedium,
            labelStyle:
                TextStyle(fontSize: MediaQuery.of(context).size.width * 0.009),
            labelText: hintText ?? '',
            // Set border color here
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.blue, // Change this to your desired border color
              ),
            ),
            // You can customize other styling properties here if needed
          ),
          value: defaultValue,
          onChanged: onChanged,
          items: values
              .map((dynamic value) => DropdownMenuItem<dynamic>(
                  value: value,
                  child: Text(
                    value is Enum ? value.name : value.toString(),
                  )))
              .toList(),
        ),
      ),
    );
  }
}
