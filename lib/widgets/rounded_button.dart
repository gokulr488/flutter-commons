import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({super.key, 
    required this.title,
    this.colour,
    required this.onPressed,
    this.width,
    this.elevation,
    this.leftSideWidgets,
    this.titleSize,
    this.borderRadius,
    this.fontWeight,
    this.fontColor,
    this.rightSideWidgets,
  });

  final Color? colour;
  final String title;
  final double? titleSize;
  final double? width;
  final Function() onPressed;
  final double? elevation;
  final Widget? leftSideWidgets;
  final Widget? rightSideWidgets;
  final double? borderRadius;
  final FontWeight? fontWeight;
  final Color? fontColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevation ?? 5,
      color: colour ?? Theme.of(context).colorScheme.inversePrimary,
      borderRadius: BorderRadius.circular(borderRadius ?? 45),
      child: MaterialButton(
          onPressed: onPressed,
          minWidth: width ?? MediaQuery.of(context).size.width * 0.75,
          height: 45,
          child: leftSideWidgets != null || rightSideWidgets != null
              ? Row(
                  children: [
                    leftSideWidgets ?? const SizedBox.shrink(),
                    Text(title,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                                color: fontColor,
                                fontSize: titleSize,
                                fontWeight: fontWeight ?? FontWeight.bold)),
                    rightSideWidgets ?? const SizedBox.shrink(),
                  ],
                )
              : Text(
                  title,
                  style: TextStyle(
                      color: fontColor,
                      fontSize: titleSize ?? 17,
                      fontWeight: FontWeight.bold),
                )),
    );
  }
}
