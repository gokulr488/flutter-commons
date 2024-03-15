import 'package:flutter/material.dart';

class PopUpContainer extends StatelessWidget {
  const PopUpContainer({
    super.key,
    this.headingContainer,
    required this.bodyContainer,
    required this.bottomContainer,
    this.containerWidth,
    this.containerHeght,
    this.headingContainerHeight,
    this.bottomContainerHeight,
  });

  final Widget? headingContainer;
  final Widget bodyContainer;
  final Widget bottomContainer;
  final double? containerWidth;
  final double? containerHeght;
  final double? headingContainerHeight;
  final double? bottomContainerHeight;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    const EdgeInsets kLeftrightPadding = EdgeInsets.only(left: 12, right: 12);
    const EdgeInsets kTopBottomPadding = EdgeInsets.only(top: 12, bottom: 12);
    const BorderSide kBorderSide = BorderSide(color: Colors.white, width: 0.2);
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          color: Color.fromARGB(255, 14, 29, 30),
          boxShadow: [
            BoxShadow(
                color: Color.fromARGB(255, 2, 0, 0),
                blurRadius: 8,
                // offset: Offset(0, 0),
                spreadRadius: 8,
                blurStyle: BlurStyle.normal)
          ]),
      height: containerHeght ?? screenheight * 0.5,
      width: containerWidth ?? screenWidth * 0.5,
      child: Column(
        children: [
          headingContainer != null
              ? Container(
                  height: headingContainerHeight ?? screenheight * 0.10,
                  decoration: const BoxDecoration(
                    border: Border(bottom: kBorderSide),
                  ),
                  child: Padding(
                    padding: kLeftrightPadding,
                    child: headingContainer,
                  ),
                )
              : Container(),
          Expanded(
            child: Padding(
              padding: kTopBottomPadding,
              child: Padding(
                padding: kLeftrightPadding,
                child: SingleChildScrollView(child: bodyContainer),
              ),
            ),
          ),
          Container(
            height: bottomContainerHeight ?? screenheight * 0.08,
            decoration: const BoxDecoration(
              border: Border(top: kBorderSide),
            ),
            child: Padding(
              padding: kLeftrightPadding,
              child: bottomContainer,
            ),
          ),
        ],
      ),
    );
  }
}
