import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
    this.height,
    this.color,
    this.thickness,
  });
  final double? height;
  final Color? color;
  final double? thickness;
  @override
  Widget build(BuildContext context) {
    return Divider(
      color: color ?? const Color(0xffCACACA),
      thickness: thickness ?? 0.5,
      height: height ?? 48,
    );
  }
}
