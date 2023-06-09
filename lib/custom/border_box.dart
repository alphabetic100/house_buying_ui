import 'package:flutter/material.dart';
import 'package:flutter_application_2/utils/constant.dart';

class BorderBox extends StatelessWidget {
  const BorderBox({
    super.key,
    required this.child,
    this.padding,
    this.height,
    this.width,
  });
  final Widget child;
  final EdgeInsets? padding;
  final double? height, width;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(8),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: colorGray.withAlpha(75),
            width: 2,
          ),
        ),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
