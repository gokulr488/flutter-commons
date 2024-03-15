import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingDots extends StatelessWidget {
  const LoadingDots({super.key, required this.size});
  final double size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitThreeBounce(
        color: Theme.of(context).colorScheme.primary,
        size: size,
      ),
    );
  }
}

class LoadingCircle extends StatelessWidget {
  const LoadingCircle({super.key, required this.size});
  final double size;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitSpinningLines(
        color: Theme.of(context).colorScheme.primary,
        size: size,
      ),
    );
  }
}
