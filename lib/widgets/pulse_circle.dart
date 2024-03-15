import 'package:flutter/material.dart';

class PulseCircle extends StatefulWidget {
  const PulseCircle({super.key});

  @override
  State<StatefulWidget> createState() {
    return _GlowCircle();
  }
}

class _GlowCircle extends State<PulseCircle>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animationcontroller;

  @override
  void initState() {
    animationcontroller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    animationcontroller.repeat();
    animation = Tween<double>(begin: 0, end: 250).animate(animationcontroller);
    animation.addListener(() {
      setState(() {});
    });

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    animationcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      alignment: Alignment.center,
      height: 300,
      child: Container(
        decoration: const BoxDecoration(
            shape: BoxShape.circle, color: Colors.deepOrangeAccent),
        height: animation.value,
        width: animation.value,
      ),
    );
  }
}
