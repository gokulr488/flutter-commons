import 'package:flutter/material.dart';

class DropDownData {
  DropDownData(
      {required this.icon, required this.label, required this.onSelected});

  final String label;
  final IconData icon;
  final VoidCallback onSelected;
}
