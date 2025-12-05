import 'package:flutter/material.dart';

class DynamicCardContainer extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;

  const DynamicCardContainer({super.key, required this.child, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // constraints.maxWidth & maxHeight are the space available from parent
        return SizedBox(
          width: constraints.maxWidth,
          height: constraints.maxHeight,
          child: child,
        );
      },
    );
  }
}
