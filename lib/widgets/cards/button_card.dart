import 'package:flutter/material.dart';
import 'package:talos_commons/widgets/cards/base_card.dart';

class ButtonCard extends StatelessWidget {
  const ButtonCard({super.key, this.text, this.onTap, this.height, this.icon});
  static TextStyle kButtonTextStyle = const TextStyle(
      fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green);
  final String? text;
  final Function? onTap;
  final double? height;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = _buildWidgets(context);

    return BaseCard(
      elevation: 3,
      onTap: onTap,
      cardChild: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: children,
      )),
    );
  }

  List<Widget> _buildWidgets(BuildContext context) {
    final List<Widget> children = [];
    if (icon != null) {
      children.add(Icon(
        icon,
        size: 60,
        color: Theme.of(context).colorScheme.primary,
      ));
    }
    if (text != null && text != '') {
      children.add(Text(text!, style: kButtonTextStyle));
    }

    return children;
  }
}
