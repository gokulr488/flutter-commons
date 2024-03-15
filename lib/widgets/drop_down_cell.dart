import 'package:flutter/material.dart';
import 'package:talos_commons/widgets/drop_down_data.dart';

class DropdownCell extends StatelessWidget {
  const DropdownCell({
    super.key,
    required this.items,
  });
  final List<DropDownData> items;
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<DropDownData>(
      itemBuilder: (context) => items
          .map((data) => PopupMenuItem<DropDownData>(
              value: data,
              child: Row(children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Icon(data.icon, size: 15),
                ),
                Text(data.label)
              ])))
          .toList(),
      onSelected: (DropDownData data) => data.onSelected(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Container(
          width: 30,
          height: 15,
          decoration: BoxDecoration(
            border:
                Border.all(color: Theme.of(context).colorScheme.inversePrimary),
            borderRadius: BorderRadius.circular(3.0),
          ),
          child: Icon(
            Icons.more_horiz,
            size: 15,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
      ),
    );
  }
}
